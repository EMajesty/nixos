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
          # name = lib.mkForce "dracula";
          style = "";
        };

        visuals = {
          indent-blankline.enable = true;
        };

        git.enable = true;
        treesitter.enable = true;

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        snippets.luasnip.enable = true;

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
            action = ":Ex<CR>";
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

        binds = {
          whichKey.enable = true;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          # servers.nil_ls.settings.autoArchive = true;
        };

        languages = {
          bash.enable = true;
          clang.enable = true;
          csharp.enable = true;
          css.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix.enable = true;
          python.enable = true;
          rust.enable = true;
          ts.enable = true;
          yaml.enable = true;
        };
      };
    };
  };
}
