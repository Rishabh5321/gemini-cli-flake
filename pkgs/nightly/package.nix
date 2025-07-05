{ lib
, stdenv
, fetchurl
, nodejs
, writeShellApplication
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gemini-cli";
  version = "0.1.9-nightly.250704.38fc1835";

  src = fetchurl
    {
      url = "https://github.com/google-gemini/gemini-cli/releases/download/v${finalAttrs.version}/gemini.js";
      hash = "sha256-GyWq80H9i6BNmMaEFgnJVBaVC64hBrlBSRfmWgSbQhA=";
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
