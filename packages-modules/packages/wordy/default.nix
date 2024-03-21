{ stdenv
, lib
, fetchFromGitLab
, bash
, makeWrapper
, lolcat
, scowl
}:
stdenv.mkDerivation {
  pname = "wordy";
  version = "08049f6";
  src = fetchFromGitLab {
    owner = "christosangel";
    repo = "wordy";
    rev = "79debaf64a3af34264291e49db1f7a3d466e1101";
    hash = "sha256-wI7h3Eddl8K/hdVRdDscL6QSPIcnML5DlwG30GB1tNI=";
  };
  buildInputs = [ bash ];
  nativeBuildInputs = [ makeWrapper ];
  runtimeDependencies = [
    lolcat
    scowl
  ];
  installPhase = ''
    mkdir -p $out/bin
    cp wordy.sh $out/bin/wordy.sh
    sed -i 's#WORD_LIST="/usr/share/dict/words"#WORD_LIST=${scowl}/share/dict/words.txt#' $out/bin/wordy.sh
    wrapProgram $out/bin/wordy.sh --prefix PATH : ${lib.makeBinPath [ bash lolcat scowl ]}
  '';

  meta = with lib; {
    homepage = "https://gitlab.com/christosangel/wordy";
    description = "Wordy is a TUI word spelling puzzle in bash. You have 6 guesses to find out the secret 5-letter word.";
    license = licenses.gpl2Plus;
    platforms = [ "i686-linux" "x86_64-linux" "aarch64-linux" ];
    maintainers = with maintainers; [ ilikefrogs101 ];
    mainProgram = "wordy";
  };
}
