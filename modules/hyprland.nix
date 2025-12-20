{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;

		settings = {
			"$terminal" = "ghostty";
			"$fileManager" = "nautilus";
			"$menu" = "wofi --show drun";

			env = [ ];

			monitor = ",preferred,auto,1";

			exec-once = [
				"hypridle"
				"waybar &"
				# "swww-daemon &"
				# "mullvad"
			];

			general = {
				gaps_in = 5;
				gaps_out = 10;
				border_size = 4;
				col = {
					active_border = "rgba(fa6161ee)";
					inactive_border = "rgba(333333aa)";
				};
				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
			};

			decoration = {
				rounding = 2;
				rounding_power = 2;
				active_opacity = 1.0;
				inactive_opacity = 1.0;
				shadow = {
					enabled = true;
					range = 4;
					render_power = 3;
					color = "rgba(1a1a1aee)";
				};
				blur = {
					enabled = true;
					size = 3;
					passes = 1;
					vibrancy = 0.1696;
				};
			};

			animations = {
				enabled = "no";
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			misc = {
				windowrulev2 = "focusonactivate, class:.*";
				force_default_wallpaper = 0;
				disable_hyprland_logo = true;
			};

			cursor = {
				hide_on_key_press = true;
			};

			input = {
				# kb_layout = "us_nords";
				kb_variant = "";
				kb_model = "";
				kb_options = "fkeys:basic_13-24";
				kb_rules = ""
				# sensitivity = 1.0;

				touchpad = {
					natural_scroll = false;
					# scroll_factor = 0.2;
				};
			};

			gestures = {
				gesture = "4, horizontal, workspace";
				workspace_swipe_invert = false;
				workspace_swipe_distance = 200;
			};

			"$mod" = "SUPER";
			bind = [
				"$mod, BACKSPACE, exec, $terminal"
				"$mod, C, killactive"
				"$mod, M, exit"
				"$mod, E, exec, $fileManager"
				"$mod, V, togglefloating"
				"$mod, R, exec, $menu"
				"$mod, B, togglesplit"
				"$mod, F, fullscreen"
				"$mod, G, togglegroup"
				"$mod, S, exec, hyprshot -m output -m active --clipboard-only"
				"$mod SHIFT, S, exec, hyprshot -m window --clipboard-only"
				"$mod CONTROL, S, exec, hyprshot -m region --clipboard-only"
				"$mod, P, exec, hyprpicker -a"
				"$mod SHIFT, L, exec $home/.emaj/lock_screen.sh"
				"$mod, H, movefocus, l"
				"$mod, L, movefocus, r"
				"$mod, K, movefocus, u"
				"$mod, J, movefocus, d"
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"
				"$mod, 6, workspace, 6"
				"$mod, 7, workspace, 7"
				"$mod, 8, workspace, 8"
				"$mod, 9, workspace, 9"
				"$mod, 0, workspace, 0"
				"$mod SHIFT, 1, movetoworkspace, 1"
				"$mod SHIFT, 2, movetoworkspace, 2"
				"$mod SHIFT, 3, movetoworkspace, 3"
				"$mod SHIFT, 4, movetoworkspace, 4"
				"$mod SHIFT, 5, movetoworkspace, 5"
				"$mod SHIFT, 6, movetoworkspace, 6"
				"$mod SHIFT, 7, movetoworkspace, 7"
				"$mod SHIFT, 8, movetoworkspace, 8"
				"$mod SHIFT, 9, movetoworkspace, 9"
				"$mod SHIFT, 0, movetoworkspace, 0"
			];

			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];

			windowrule = [
				"suppressevent maximize, class:.*"
				"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
			];
			};
		};
	};
}
