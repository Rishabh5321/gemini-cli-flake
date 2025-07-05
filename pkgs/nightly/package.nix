{ lib
, stdenv
, fetchurl
, nodejs
, writeShellApplication
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gemini-cli";
  version = "0.1.9-nightly.250704.23eea823";

  src = fetchurl
    {
      url = "https://github.com/google-gemini/gemini-cli/releases/download/v${finalAttrs.version}/gemini.js";
      hash = "sha256-0wa4d1nmgfp7gwsvbb2r32pwgrjj5wzgl5w38yrbp5rb99gsdvfc";
    };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/gemini.js
    substituteInPlace $out/gemini.js --replace '#!/usr/bin/env node' '#!${nodejs}/bin/node'
    chmod +x $out/gemini.js
    ln -s $out/gemini.js $out/bin/gemini
  '';

  meta = {
    description = "AI agent that brings the power of Gemini directly into your terminal";
    homepage = "https://github.com/google-gemini/gemini-cli";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.all;
    mainProgram = "gemini";
  };
})
