{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

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
    profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        dearrow
      ];
      search = {
        force = true;
        default = "ddg";
      };
      pins = {
        "perplexity" = {
          id = "c43be71d-89f7-49a7-a5b2-5ef7983689ce";
          url = "https://perplexity.ai";
          isEssential = true;
          position = 101;
        };
      };
    };
  };
}
