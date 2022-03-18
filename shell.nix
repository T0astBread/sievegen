with (import <nixpkgs> { });
let
  pythonPackages = pkgs: with pkgs; [
    # production dependencies
    managesieve

    # dev dependencies
    bandit
    black
    mypy
    pylint
  ];
  pythonWithPackages = python3.withPackages pythonPackages;
in
mkShell {
  buildInputs = [
    pythonWithPackages
  ];
  packages = (pythonPackages python39Packages) ++ [
    jq
  ];
}
