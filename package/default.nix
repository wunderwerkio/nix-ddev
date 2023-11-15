{
  lib,
  stdenv,
  fetchurl,
  pkgs,
  ...
}: let
  pname = "ddev";
  version = "1.22.4";

  inherit (stdenv.hostPlatform) system;
  sources = import ./sources.nix {inherit version fetchurl;};
in
  stdenv.mkDerivation {
    inherit pname version;

    src = sources.${system} or (throw "Source for ${pname} is not available for ${system}");
    setSourceRoot = "sourceRoot=`pwd`";

    nativeBuildInputs = with pkgs; [
      makeWrapper
      installShellFiles
    ];

    installPhase = ''
      install -m755 -D ./ddev $out/bin/ddev;

      wrapProgram $out/bin/ddev --prefix PATH : ${lib.makeBinPath [pkgs.mkcert]}

      installShellCompletion --cmd ddev \
        --bash ./ddev_bash_completion.sh \
        --fish ./ddev_fish_completion.sh \
        --zsh ./ddev_zsh_completion.sh
    '';
  }
