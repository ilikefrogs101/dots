{pkgs, inputs, ...}:
{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = 
            {
                # "layer"= "top"; # Waybar at top layer
                # "position"= "top";
                "height"= 15;
                #"width"= 1700;
                "margin"= "5; 5; 5; 5";
                "spacing"= 4; # Gaps between modules (4px)
                
                # Choose the order of the modules
                "modules-left"= ["sway/workspaces"];
                "modules-center"= ["user"];
                "modules-right"= ["pulseaudio" "backlight" "network" "cpu" "memory" "battery" "clock" "tray"];

                # Modules configuration
                "tray"= {
                    # "icon-size"= 21;
                    "spacing"= 10;
                };
                "clock"= {
		    "interval"= 1;
                    "format"= "{:%H:%M:%S}";
                    "tooltip-format"= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    "format-alt"= "{:%Y-%m-%d}";
                };
                "cpu"= {
                    "format"= "{usage}% ";
                    "tooltip"= false;
                };
                "memory"= {
                    "format"= "{}% ";
                };
                "battery"= {
                    "format"= "{capacity}% {icon}";
                    "format-full"= "{capacity}% {icon}";
                    "format-discharging"= "{capacity}% {icon} ";
                    "format-plugged"= "{capacity}% {icon} ";
                    "format-alt"= "{time} {icon}";
                    "format-icons"= ["" "" "" "" ""];
                };
                "network"= {
                    "format-wifi"= "{essid} ({signalStrength}%) ";
                    "format-ethernet"= "{ipaddr}/{cidr} ";
                    "tooltip-format"= "{ifname} via {gwaddr} ";
                    "format-linked"= "{ifname} (No IP) ";
                    "format-disconnected"= "Disconnected ⚠";
                    "format-alt"= "{ifname}: {ipaddr}";
                };
                "pulseaudio"= {
                    "format"= "{volume}% {icon} {format_source}";
                    "format-muted"= " {format_source}";
                    "format-source"= "{volume}% ";
                    "format-source-muted"= "";
                    "format-icons"= {
                        "headphone"= "";
                        "default"= ["" "" ""];
                    };
                    "on-click"= "foot pulsemixer";
                };
                "backlight"= {
                    "device"= "intel_backlight";
                    "format"= "Brightness: {percent}%";
                };
            };
        };
        style = ''
            @define-color foreground #ebdbb2;
            @define-color background #32302f;
            @define-color regular0 #1d2021; /*black*/
            @define-color regular1 #cc241d; /*red*/
            @define-color regular2 #98971a; /*green*/
            @define-color regular3 #d79921; /*yellow*/
            @define-color regular4 #458588; /*blue*/
            @define-color regular5 #b16286; /*purple*/
            @define-color regular6 #689d6a; /*aqua*/
            @define-color regular7 #a89984; /*gray*/
            @define-color bright0 #282828;  /*bright black*/
            @define-color bright1 #fb4934;  /*bright red*/
            @define-color bright2 #b8bb26;  /*bright green*/
            @define-color bright3 #fabd2f;  /*bright yellow*/
            @define-color bright4 #83a598;  /*bright blue*/
            @define-color bright5 #d3869b;  /*bright purple*/
            @define-color bright6 #8ec07c;  /*bright aqua*/
            @define-color bright7 #928374;  /*bright gray*/

            * {
                /* `otf-font-awesome` is required to be installed for icons */
                font-family: inconsolata, FontAwesome, Roboto, Helvetica, Arial, sans-serif;
                font-size: 14px;
            }

            window#waybar {
                background-color: @background;
                color: @foreground;
                border-radius: 15;
                transition-property: background-color;
                transition-duration: .5s;
                outline: 5px red;
            }

            
            button {
                border: none;
                text-shadow: inherit;
            }

            /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
            button:hover {
                background: inherit;
            }

            #workspaces button {
                font-weight: 900;
                font-size: 15;
                padding: 1 15px;
                margin-left: 4px;
                margin-right: 4px;
                margin-top: 4px;
                margin-bottom: 4px;
                background-color: #726659; 
                /*box-shadow: 2.75 0, -2.75 0, 0 -0.65, inset 0 -4;*/
                box-shadow: 0 0 0 1;
                color: @foreground;
            }

            #workspaces button:hover {
                background: @regular7;
                text-shadow: 0.25px 0.25px;
            }

            #workspaces button.focused {
                /*box-shadow: 2 0 #998e72, -2 0 #998e72, 0 -0.75 #998e72, inset 0 -2.25;*/
                box-shadow: 0 0 0 3;
                color: @foreground;
                text-shadow: 0.45px 0.45px;
                background-color: @bright7;
            }

            #workspaces button.urgent {
                background-color: @regular1;
            }

            #clock,
            #battery,
            #cpu,
            #memory,
            #disk,
            #temperature,
            #backlight,
            #network,
            #pulseaudio,
            #wireplumber,
            #custom-media,
            #tray,
            #mode,
            #idle_inhibitor,
            #scratchpad,
            #mpd {
                padding: 0 10px;
                color: @foreground;
                border-radius: 15;
                margin-top: 5;
                margin-bottom: 5;
            }

            #window,
            #workspaces {
                margin: 0 4px;
            }

            /* If workspaces is the leftmost module, omit left margin */
            .modules-left > widget:first-child > #workspaces {
                margin-left: 15;
            }

            /* If workspaces is the rightmost module, omit right margin */
            .modules-right > widget:last-child > #workspaces {
                margin-right: 50;
            }

            #clock {
                background-color: @bright7;
            }

            #battery {
                background-color: @regular4;
            }

            #battery.charging, #battery.plugged {
                background-color: @regular2;
            }

            #battery.discharging {
                background-color: @regular3;
            }

            @keyframes blink {
                to {
                    background-color: #ffffff;
                    color: #000000;
                }
            }

            label:focus {
                background-color: #000000;
            }

            #cpu {
                background-color: @bright7;
            }

            #memory {
                background-color: @bright7;
            }

            #network {
                background-color: @bright7;
            }

            #network.disconnected {
                background-color: @regular7;
            }

            #pulseaudio {
                background-color: @bright7;
            }

            #backlight {
                background-color: @bright7;
            }

            #pulseaudio.muted {
                background-color: @regular7;
            }

            #tray {
                background-color: @bright7;
                margin-right: 5;
            }

            #tray > .passive {
                -gtk-icon-effect: dim;
            }

            #tray > .needs-attention {
                -gtk-icon-effect: highlight;
                background-color: #eb4d4b;
            }
        '';
    };
}
