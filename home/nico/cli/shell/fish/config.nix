{
  lib,
  inputs,
  ...
}: {
  imports = [inputs.nix-index-database.hmModules.nix-index];

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
    # Slow as fuck, to correct
  };

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    interactiveShellInit = ''
      set -g fish_color_option blue

      set -g fish_key_bindings fish_vi_key_bindings
      set -g fish_cursor_default block
      set -g fish_cursor_insert line
      set -g fish_cursor_replace_one underscore
      set -g fish_cursor_replace underscore
      set -g fish_cursor_external line
    '';

    functions = {
      fish_greeting = lib.mkDefault "";
    };

    plugins = [];
  };
}
