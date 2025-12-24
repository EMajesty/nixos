{
  config,
  pkgs,
  ...
}:
{
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.displayManager.ly.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  networking.networkmanager.enable = true;
  services.openssh.enable = true;
  services.printing.enable = true;

  time.timeZone = "Europe/Helsinki";

  users.users.emaj = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kdePackages.ark
    btop
    cifs-utils
    clang
    clang-tools
    cmake
    efibootmgr
    eza
    fastfetch
    freerdp
    gdb
    ghostty
    home-manager
    hyprpicker
    hyprshot
    mate.eom
    nautilus
    ntfs3g
    p7zip
    pavucontrol
    samba
    tmux
    unzip
    vlc
    vesktop
    wofi
    xfce.tumbler
    xdg-desktop-portal-hyprland
    xz
    zip
  ];

  # environment.pathsToLink = [
  #   "/share/applications"
  #   "/share/xdg-desktop-portal"
  # ];

  programs.zsh.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs.hyprland.enable = true;
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # programs here, NOT in environment.systemPackages
  ];

  # system.autoUpgrade = {
  # 	enable = true;
  # 	flake = inputs.self.outPath;
  # 	flags = [
  # 		"--update-input"
  # 		"nixpkgs"
  # 		"-L"
  # 	];
  # 	dates = "09:00";
  # 	randomizedDelaySec = "45min";
  # };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}
