{
  pkgs,
  lib,
  ...
}:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        theme = {
          enable = true;
          name = "tokyonight";
          style = "night";
        };

        lsp.enable = true;
        lsp.formatOnSave = true;
        treesitter.enable = true;

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        options = {
          nu = true;
          relativenumber = true;
          tabstop = 4;
          softtabstop = 4;
          shiftwidth = 4;
          expandtab = true;
          smartindent = true;
          wrap = false;
          hlsearch = false;
          incsearch = true;
          termguicolors = true;
          scrolloff = 8;
          signcolumn = "yes";
          updatetime = 50;
          colorcolumn = "120";
        };

        highlight.normal.bg = "none";
        highlight.normalfloat.bg = "none";

        globals.mapleader = " ";
        keymaps = [
          {
            key = "<leader>pv";
            mode = "n";
            action = "Ex";
          }
          {
            key = "<leader>m";
            mode = [
              "n"
              "x"
            ];
            action = ":make<CR>";
          }
          {
            key = "<leader>y";
            mode = [
              "n"
              "v"
            ];
            action = "\"+y";
          }
          {
            key = "<leader>x";
            mode = "n";
            silent = true;
            action = "<cmd>!chmod +x %<CR>";
          }
        ];

        languages = {
          nix.enable = true;
          rust.enable = true;
        };
      };
    };
  };
}
