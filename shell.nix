let
  unstable = import
    (fetchTarball "https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz")
    { };
in
{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
mkShell {
  name = "hello-flux";

  buildInputs = with pkgs; [
    unstable.docker
    unstable.go_1_18
    unstable.go-task
    fluxcd
  ];

  GITHUB_USERNAME = "jordangarrison";
  KUBECONFIG = "/home/jordangarrison/dev/scale2023/kubeconfig";
}
