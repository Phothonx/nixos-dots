{ colors, theme, ... }:
{
  programs.waybar.style = with colors; ''
    * {
      font-family: ${theme.fonts.sansSerif};
      font-size: ${builtins.toString theme.fonts.sizes.desktop}px;
    }

    window#waybar {
      background-color: #${base10};
      border-radius: 8px;
      transition-property: background-color;
      transition-duration: 0.3s;
    }

    #workspaces button {
      all: initial; /* Remove GTK theme values (waybar #1351) */
      min-width: 0; /* Fix weird spacing in materia (waybar #450) */
      background-color: transparent;
      color: #${base0C};
    }

    #workspaces button:hover {
      color: #${base0D};
    }

    #workspaces button.active {
      color: #${base0E};
    }

    #clock,
    #network,
    #battery,
    #backlight,
    #workspaces,
    #wireplumber,

    #clock {
      background-color: #${base00};
      color: #${base17};
      font-family: Ubuntu Nerd Font;
      font-size: 30px;
      font-weight: bold;
      margin: 5px;
      padding: 5px;
      border-radius: 8px;
    }

    #network {
      background-color: #${base00};
      color: #${base0D};
      margin: 5px;
      padding: 5px;
      border-radius: 8px;
    }

    #backlight {
      background-color: #${base00};
      color: #${base0A};
      margin: 5px;
      padding: 5px;
      border-radius: 8px;
    }

    #battery {
      background-color: #${base00};
      color: #${base0B};
      margin: 5px;
      padding: 5px;
      border-radius: 8px;
    }

    #battery.warning {
      background-color: #${base00};
      color: #${base0C};
    }

    #battery.critical:not(.charging) {
      color: #${base08};
    }

    #wireplumber {
      background-color: #${base00};
      color: #${base0C};
      margin: 5px;
      padding: 5px;
      border-radius: 8px;
    }

    #wireplumber.muted {
      color: #${base08};
    }
    
    tooltip {
      border-radius: 8px;
      padding: 15px;
      background-color: #${base11};
    }
      
    tooltip label {
      padding: 5px;
      background-color: #${base11};
    }
  '';
}
