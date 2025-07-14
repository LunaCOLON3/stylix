{ config, lib, ... }:
let
  cfg = config.stylix.targets.sway;

  fonts = {
    names = [ config.stylix.fonts.sansSerif.name ];
    size = config.stylix.fonts.sizes.desktop + 0.0;
  };
in
{
  options.stylix.targets.sway = {
    enable = config.lib.stylix.mkEnableTarget "Sway" true;
    useWallpaper = config.lib.stylix.mkEnableWallpaper "Sway" true;
    exportedBarConfig = lib.mkOption {
      type = lib.types.attrs;
      description = ''
        Theming configuration which can be merged with your own:

        ```nix
        wayland.windowManager.sway.config.bars = [
          (
            {
              # your configuration
            }
            // config.stylix.targets.sway.exportedBarConfig
          )
        ];
        ```
      '';
      readOnly = true;
    };
  };

  config =
    with config.lib.stylix.colors.withHashtag;
    let
      text = base05;
      urgent = base08;
      focused = base0D;
      unfocused = base03;
    in
    lib.mkMerge [
      (lib.mkIf (config.stylix.enable && cfg.enable) {
        wayland.windowManager.sway.config = {
          inherit fonts;

          colors =
            let
              background = base00;
            in
            {
              inherit background;
              urgent = {
                inherit background text;
                border = urgent;
                childBorder = urgent;
                indicator = urgent;
              };
              focused = {
                inherit background text;
                border = focused;
                childBorder = focused;
                indicator = base0B;
              };
              focusedInactive = {
                inherit background text;
                border = unfocused;
                childBorder = unfocused;
                indicator = unfocused;
              };
              unfocused = {
                inherit background text;
                border = unfocused;
                childBorder = unfocused;
                indicator = unfocused;
              };
              placeholder = {
                inherit background text;
                border = unfocused;
                childBorder = unfocused;
                indicator = unfocused;
              };
            };

          output."*".bg =
            lib.mkIf cfg.useWallpaper "${config.stylix.image} ${config.stylix.imageScalingMode}";
          seat."*".xcursor_theme = lib.mkIf (
            config.stylix.cursor != null
          ) ''"${config.stylix.cursor.name}" ${toString config.stylix.cursor.size}'';
        };
      })

      {
        lib.stylix.sway.bar = builtins.warn "stylix: `config.lib.stylix.sway.bar` has been renamed to `config.stylix.targets.sway.exportedBarConfig` and will be removed after 26.11." config.stylix.targets.sway.exportedBarConfig;

        stylix.targets.sway.exportedBarConfig = {
          inherit fonts;

          colors =
            let
              background = base01;
              border = background;
            in
            {
              inherit background;
              statusline = text;
              separator = base03;
              focusedWorkspace = {
                inherit text border;
                background = focused;
              };
              activeWorkspace = {
                inherit text border;
                background = unfocused;
              };
              inactiveWorkspace = {
                inherit text border;
                background = unfocused;
              };
              urgentWorkspace = {
                inherit text border;
                background = urgent;
              };
              bindingMode = {
                inherit text border;
                background = urgent;
              };
            };
        };
      }
    ];
}
