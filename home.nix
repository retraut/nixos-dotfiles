{ config, pkgs, lib, ... }:

let 
  editor = "vim";
in {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "retraut";
    home.homeDirectory = "/home/retraut";
  
    home.packages = [
      pkgs.htop
      pkgs.zsh
      pkgs.tmuxinator
      pkgs.gh
      pkgs.ncdu
      pkgs.neofetch
      pkgs.awscli
      pkgs.kubectl
      pkgs.kubectx
      pkgs.go
      pkgs.gnumake
      pkgs.gcc8
    ];
  
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";
  
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    programs.command-not-found.enable = true;
  
    programs.vim = {
      enable = true;
    };

    programs.tmux = {
      enable = true;
      extraConfig = lib.strings.fileContents ./tmux.conf;

    };

    home.sessionVariables = {
      EDITOR = "${editor}";
    };
}

