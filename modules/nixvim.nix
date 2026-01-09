{ pkgs, lib, ... }:
{
  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    # colorschemes.dracula.enable = true;

    plugins = {
      indent-blankline.enable = true;
      gitsigns.enable = true;
      lualine.enable = true;
      telescope.enable = true;
      web-devicons.enable = true;
      treesitter.enable = true;
      which-key.enable = true;

      nvim-cmp = {
        enable = true;
        snippet.luasnip.enable = true;
      };

      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
        };
      };

      lsp-format.enable = true;
    };

    extraConfigLua = ''
      local augroup = vim.api.nvim_create_augroup("FormatOnSave", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          callback = function(args)
          vim.lsp.buf.format({ bufnr = args.buf })
          end,
      })
    '';

    opts = {
      number = true;
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
        # silent = true;
        action = "<cmd>!chmod +x %<CR>";
      }
    ];

    # extraConfigLua = ''
    #   -- Example: you can fine-tune per-language here if needed
    # '';
  };
}
