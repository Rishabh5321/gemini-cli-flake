{ lib
, pkgs
,
}:

pkgs.gemini-cli.overrideAttrs (
  finalAttrs: prevAttrs: {
    version = "0.1.7";

    src = pkgs.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v${finalAttrs.version}";
      hash = "sha256-DAenod/w9BydYdYsOnuLj7kCQRcTnZ81tf4MhLUug6c=";
      postFetch = ''
        ${lib.getExe pkgs.npm-lockfile-fix} $out/package-lock.json
      '';
    };

    npmDeps = pkgs.fetchNpmDeps {
      inherit (finalAttrs) src;
      hash = "sha256-otogkSsKJ5j1BY00y4SRhL9pm7CK9nmzVisvGCDIMlU=";
    };
  }
)
