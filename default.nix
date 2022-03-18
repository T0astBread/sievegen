{ lib
, bash
, coreutils
, python3
, stdenv
}:

# NOTE: This is super hacky but I don't wanna deal with setuptools
# right now, so I'm not using `buildPythonApplication`.

let
  pythonWithPackages = (python3.withPackages (pythonPkgs: [
    pythonPkgs.managesieve
  ]));
in
stdenv.mkDerivation rec {
  pname = "sievegen";
  version = "0.0.1";

  src = ./.; # Nix doesn't like "." or "./" but "./." works. 🙃

  buildInputs = [
    bash
    coreutils
  ];

  propagatedBuildInputs = [
    pythonWithPackages
  ];

  checkPhase = ''
    ${bash}/bin/bash scripts/run-tests
  '';

  preInstall = ''
    echo "install:" > Makefile
  '';

  postInstall = ''
    mkdir -p $out/bin
    echo "#!${pythonWithPackages}/bin/python3" | tee $out/bin/sg-{newalias,update}
    ${coreutils}/bin/tail -n +3 < bin/sg-newalias >> $out/bin/sg-newalias
    ${coreutils}/bin/tail -n +3 < bin/sg-update >> $out/bin/sg-update
    ${coreutils}/bin/chmod +x $out/bin/*
    ${coreutils}/bin/cp -r wordlists $out/wordlists
  '';
}
