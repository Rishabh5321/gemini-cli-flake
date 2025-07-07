{ lib
, pkgs
,
}:

pkgs.gemini-cli.overrideAttrs (
  finalAttrs: prevAttrs: {
    version = "0.1.9";

    src = pkgs.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v${finalAttrs.version}";
      hash = "sha256-P8ZjUMkgl/AH1k4H6jOMg2hVXY3kqPi68lPAYvVcwvc=";
      postFetch = ''
        ${lib.getExe pkgs.npm-lockfile-fix} $out/package-lock.json
      '';
    };

    npmDeps = pkgs.fetchNpmDeps {
      inherit (finalAttrs) src;
      hash = "sha256-d1PQhXk9Nz0EduemwuLfS0lNOR+GwSc53wBn/k/l5tU=";
    };
  }
)
