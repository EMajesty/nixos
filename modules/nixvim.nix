{ pkgs, lib, ... }:
{
  programs.nixvim = {
    enable = true;

    # vi/vim aliases
    viAlias = true;
    vimAlias = true;

    # Theme / colorscheme (closest to your Stylix-driven setup)
    # If Stylix manages colors, you can leave explicit colorschemes off.
    # Otherwise, uncomment a colorscheme, e.g.:
    # colorschemes.dracula.enable = true;

    # Visuals
    plugins.indent-blankline.enable = true;

    # Git
    plugins.gitsigns.enable = true;

    # Statusline
    plugins.lualine.enable = true;

    # Telescope
    plugins.telescope.enable = true;

    # Completion + snippets
    plugins.nvim-cmp = {
      enable = true;
      snippet.luasnip.enable = true;
    };

    # Core options (vim.options -> opts)
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

    # Highlight tweaks
    highlight = {
      Normal = {
        bg = "none";
      };
      NormalFloat = {
        bg = "none";
      };
    };

    # Leader
    globals.mapleader = " ";

    # Keymaps
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

    # which-key
    plugins.which-key.enable = true;

    # LSP (rough equivalent of nvf's simplified LSP section)
    plugins.lsp = {
      enable = true;
      # This will format on save for servers that support it.
      onAttach = ''
        vim.api.nvim_create_autocmd("BufWritePre", {
          callback = function(args)
            vim.lsp.buf.format({ bufnr = args.buf })
          end,
        })
      '';
      servers = {
        nixd.enable = true;
        # You can put extra settings here; nvf’s
        # `servers.nixd.settings.nil.nix.autoArchive = true;`
        # maps to:
        nixd.settings = {
          nil = {
            nix = {
              autoArchive = true;
            };
          };
        };
      };
    };

    # Language support (enable Treesitter + LSP per language as needed)
    plugins.treesitter.enable = true;

    # NixVim has a big language module set; this reflects your nvf.languages
    # at roughly the same level of abstraction.
    # If you prefer, use only treesitter & lsp servers above instead.
    extraConfigLua = ''
      -- Example: you can fine-tune per-language here if needed
    '';
  };
}
