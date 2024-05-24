{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "inupiaq-fonts";
  version = "1.0";

  src = fetchurl {
    url = "https://languagetools-153419.appspot.com/fonts/Inupiaq/GentiumKaktovik.ttf";
    sha256 = "";
  };

  installPhase = ''
    install -dm 755 $out/share/fonts
    cp -dr --no-preserve='ownership' ./* $out/share/fonts/
  '';

  meta = with lib; {
    description = "";
    homepage = "https://languagetools-153419.appspot.com/ik/downloads/";
    platforms = platforms.all;
    maintainers = with maintainers; [ ilikefrogs101 ];
  };
}
