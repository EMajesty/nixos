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
    

    nvim-cmp = {
      enable = true;
      snippet.luasnip.enable = true;
    };
    which-key.enable = true;
    lsp= {
        enable = true;
        servers = {
            nixd.enable = true;
        };
    };
    lsp-format.enable = true;
# lsp = {
#       enable = true;
#       # This will format on save for servers that support it.
#       onAttach = ''
#         vim.api.nvim_create_autocmd("BufWritePre", {
#           callback = function(args)
#             vim.lsp.buf.format({ bufnr = args.buf })
#           end,
#         })
#       '';
#       # servers = {
#       #   nixd.enable = true;
#       #   nixd.settings = {
#       #     nil = {
#       #       nix = {
#       #         autoArchive = true;
#       #       };
#       #     };
#       #   };
#       # };
#     };
#
#     # Language support (enable Treesitter + LSP per language as needed)
#     treesitter.enable = true;

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

    # highlight = {
    #   Normal = {
    #     bg = "none";
    #   };
    #   NormalFloat = {
    #     bg = "none";
    #   };
    # };

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


    extraConfigLua = ''
      -- Example: you can fine-tune per-language here if needed
    '';
  };
}
