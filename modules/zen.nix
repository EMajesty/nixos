{ config, pkgs, ... }:

{
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles.default =
      let
        pins = {
          "perplexity" = {
            id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
            url = "https://perplexity.ai";
            isEssential = true;
            position = 101;
          };
          "github" = {
            url = "https://github.com";
            isEssential = true;
            position = 102;
          };
          "annas" = {
            url = "https://annas-archive.org";
            isEssential = true;
            position = 103;
          };
          "proton" = {
            url = "https://mail.proton.me";
            isEssential = true;
            position = 104;
          };
          "onshape" = {
            url = "https://cad.onshape.com/signin";
            isEssential = true;
            position = 201;
          };
          "fluidd" = {
            url = "http://192.168.1.130/#/";
            isEssential = true;
            position = 202;
          };
          "pedal" = {
            url = "pedalplayground.com";
            isEssential = true;
            position = 203;
          };
          "pinterest" = {
            url = "https://pinterest.com";
            isEssential = true;
            position = 204;
          };
        };
      in
      {
        pinsForce = true;
        inherit pins;
      };

  };
}
