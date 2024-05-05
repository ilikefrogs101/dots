{ godot_4
, lib
, python3
, mkNugetDeps
, mkNugetSource
, writeText
, dotnet-sdk
, dotnet-runtime
, callPackage
, withDebug ? false
, withPlatform ? "linuxbsd"
, withTarget ? "editor"
, withPrecision ? "single"
, withPulseaudio ? true
, withDbus ? true
, withSpeechd ? true
, withFontconfig ? true
, withUdev ? true
, withTouch ? true
}:

assert lib.asserts.assertOneOf "withPrecision" withPrecision [ "single" "double" ];

let
  mkSconsFlagsFromAttrSet = lib.mapAttrsToList (k: v:
    if builtins.isString v
    then "${k}=${v}"
    else "${k}=${builtins.toJSON v}");
in
godot_4.overrideAttrs (self: base: {
  pname = "godot4-mono";

  nugetDeps = mkNugetDeps { name = "deps"; nugetDeps = import ./deps.nix; };

  shouldConfigureNuget = true;

  nugetSource =
    mkNugetSource {
      name = "${base.pname}-nuget-source";
      description = "A Nuget source with dependencies for ${base.pname}";
      deps = [ self.nugetDeps ];
    };

  nugetConfig = writeText "NuGet.Config" ''
    <?xml version="1.0" encoding="utf-8"?>
    <configuration>
      <packageSources>
        <add key="${base.pname}-deps" value="${self.nugetSource}/lib" />
      </packageSources>
    </configuration>
  '';

  nativeBuildInputs = base.nativeBuildInputs ++ [
    python3
    dotnet-sdk
    dotnet-runtime
  ];

  runtimeDependencies = base.runtimeDependencies ++ [
    dotnet-sdk
    dotnet-runtime
  ];

  postConfigure = ''
    echo "Setting up buildhome."
    mkdir buildhome
    export HOME="$PWD"/buildhome

    if [ -n "$shouldConfigureNuget" ]; then
      echo "Configuring NuGet."
      mkdir -p ~/.nuget/NuGet
      ln -s "$nugetConfig" ~/.nuget/NuGet/NuGet.Config
    fi
  '';

  buildPhase = ''
    echo "Starting Build"
    scons p=${withPlatform} target=${withTarget} precision=${withPrecision} module_mono_enabled=yes mono_glue=no

    echo "Generating Glue"
    if [[ ${withPrecision} == *double* ]]; then
        bin/godot.${withPlatform}.${withTarget}.${withPrecision}.x86_64.mono --headless --generate-mono-glue modules/mono/glue
    else
        bin/godot.${withPlatform}.${withTarget}.x86_64.mono --headless --generate-mono-glue modules/mono/glue
    fi

    echo "Building Assemblies"
    scons p=${withPlatform} target=${withTarget} precision=${withPrecision} module_mono_enabled=yes mono_glue=yes

    echo "Building C#/.NET Assemblies"
    python modules/mono/build_scripts/build_assemblies.py --godot-output-dir bin --precision=${withPrecision}
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    cp bin/godot.* $out/bin/godot4-mono
    cp -r bin/GodotSharp/ $out/bin/

    installManPage misc/dist/linux/godot.6

    mkdir -p "$out"/share/{applications,icons/hicolor/scalable/apps}
    cp misc/dist/linux/org.godotengine.Godot.desktop "$out/share/applications/org.godotengine.Godot4-Mono.desktop"
    substituteInPlace "$out/share/applications/org.godotengine.Godot4-Mono.desktop" \
      --replace "Exec=godot" "Exec=$out/bin/godot4-mono" \
      --replace "Godot Engine" "Godot Engine ${base.version} (Mono, $(echo "${withPrecision}" | sed 's/.*/\u&/') Precision)"
    cp icon.svg "$out/share/icons/hicolor/scalable/apps/godot.svg"
    cp icon.png "$out/share/icons/godot.png"
  '';

  meta = with lib; {
    homepage = "https://godotengine.org";
    description = "Free and Open Source 2D and 3D game engine";
    license = licenses.mit;
    platforms = [ "i686-linux" "x86_64-linux" "aarch64-linux" ];
    maintainers = with maintainers; [ ilikefrogs101 ];
    mainProgram = "godot4-mono";
  };

  passthru = {
    make-deps = callPackage ./make-deps.nix { };
  };
})