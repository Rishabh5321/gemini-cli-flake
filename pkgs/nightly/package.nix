{ lib
, pkgs
,
}:

pkgs.gemini-cli.overrideAttrs (
  finalAttrs: prevAttrs: {
    version = "0.1.9-nightly.250704.23eea823";

    src = pkgs.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v${finalAttrs.version}";
      hash = "sha256-2IobbS922VUWB2mzCTullrveM80ZGh00BJHerGURl5M=";
      postFetch = ''
        ${lib.getExe pkgs.npm-lockfile-fix} $out/package-lock.json
      '';
    };

    npmDeps = pkgs.fetchNpmDeps {
      inherit (finalAttrs) src;
      hash = "sha256-q1gFMZvvEPMDzsubU1a0mxVOPLH1pX52hjT/AsmBRE4=";
    };
  }
)
