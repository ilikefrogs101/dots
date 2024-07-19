{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "gentium-kaktovik";
  version = "1.0";

  src = fetchurl {
    url = "https://languagetools-153419.appspot.com/fonts/Inupiaq/GentiumKaktovik.ttf";
    sha256 = "sha256-KVDVkBDK9rmzNbiburpHlI9g6b/5j59FH5a0Fq23vwg=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/gentium-kaktovik
    cp -r $src $out/share/fonts/truetype/gentium-kaktovik/GentiumKaktovik.ttf
  '';

  meta = with lib; {
    description = "";
    homepage = "https://languagetools-153419.appspot.com/ik/";
    platforms = platforms.all;
    maintainers = with maintainers; [ ilikefrogs101 ];
  };
}
