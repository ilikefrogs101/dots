{ lib, stdenvNoCC, fetchFromGitHub }:

stdenvNoCC.mkDerivation rec {
  pname = "posy-cursors";
  version = "1.6";

  src = fetchFromGitHub {
    owner = "simtrami";
    repo = "posy-improved-cursor-linux";
    rev = "8c39b915bbba4717a450ef750fa8b0c0b60cb160";
    sha256 = "sha256-i0N/QB5uzqHapMCDl6h6PWPJ4GOAyB1ds9qlqmZacLY=";
  };

  installPhase = ''
    install -dm 755 $out/share/icons
    cp -dr --no-preserve='ownership' ./* $out/share/icons/
  '';

  meta = with lib; {
    description = "Posy's improved cursors";
    homepage = "http://www.michieldb.nl/other/cursors/";
    platforms = platforms.all;
    maintainers = with maintainers; [ ilikefrogs101 ];
  };
}
