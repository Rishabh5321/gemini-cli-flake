{ lib
, stdenv
, fetchurl
, nodejs
, writeShellApplication
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "gemini-cli";
  version = "0.1.14";

  src = fetchurl
    {
      url = "https://github.com/google-gemini/gemini-cli/releases/download/v${finalAttrs.version}/gemini.js";
      hash = "sha256-e+zdaGOIp6tQ7PpphYeMDVIBZropJHHvpQL+aHMkWog=";
    };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/gemini.js
    substituteInPlace $out/gemini.js --replace '#!/usr/bin/env node' '#!${nodejs}/bin/node --no-deprecation'
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
