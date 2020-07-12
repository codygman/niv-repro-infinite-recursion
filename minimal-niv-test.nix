let
  sources = import ./nix/sources.nix;
  systemPkgs = import <nixpkgs> {};
  emacsOverlay = import sources.nixpkgs { overlays = [ (import sources.emacs-overlay) ]; };
  lorriGit = import sources.nixpkgs { overlays = [ (import sources.lorri) ]; };
in emacsOverlay.emacsGit.version # WORKS returns "20200712.0"
# in systemPkgs.lorri.version # WORKS returns "1.0"
# in lorriGit.lorri.version # BUG? returns "infinite recursion encountered" and I expected "1.1" or similar
