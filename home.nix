{ config, pkgs, lib, ... }:
{
  home.username = "shariq";
  home.homeDirectory = "/home/shariq";
  home.stateVersion = "24.11";

  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      nrs = "sudo nixos-rebuild switch";
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod1";
      terminal = "ghostty";
      fonts = {
        names = [ "monospace" ];
        size = 12.0;
      };

      keybindings = let
        mod = "Mod1";
      in lib.mkOptionDefault {
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        "${mod}+n" = "split h";
        "${mod}+Shift+n" = "split v";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 10 px or 10 ppt";
          "j" = "resize shrink height 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";
          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";
          "Return" = "mode default";
          "Escape" = "mode default";
          "Mod1+r" = "mode default";
        };
      };
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "shariqali-dev";
        email = "shariqali2195@gmail.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "Everforest Dark Hard";
      font-family = "JetBrains Mono";
      font-size = 12;
    };
  };

  #home.file.".config/nvim" = {
   # source = "/etc/nixos/dotfiles/nvim";
    #recursive = true;
 # };


  home.packages = with pkgs; [
    bat
    gcc
    gh
    ripgrep
    fd
    gnumake

    go
    gopls
    gotools
    delve
    golangci-lint

    vscode.fhs
    claude-code
    discord-ptb

    nodejs
    nodePackages.pnpm
    nodePackages.typescript-language-server

    python3
    uv
    pyright
    black
    isort

    rustc
    cargo
    rust-analyzer

    lua-language-server
    stylua

    clang-tools

    ols

    vscode-langservers-extracted
    
    nil #nix

  ];
}
