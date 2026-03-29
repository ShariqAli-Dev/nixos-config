{config, pkgs, lib, ...}:

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

    # initExtra = ''
    #   export PS1='\[\e[38;5;77m\]\u\[\e[0m\] in \[\e[38;5;33m\]\w\[\e[0m\] \\$ '
    # '';
  };

  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod1";
      terminal = "ghostty";

      fonts = {
        names = ["monospace"];
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

      # "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10%";
      # "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%";
      # "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";
      # "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";
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
        "Mod1+r" = "mode default";  # exit resize the same way you entered
      };
    };

    };
  };
  
  home.packages = with pkgs; [
    bat
  ];
}
