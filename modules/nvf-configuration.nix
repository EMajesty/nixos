{
  pkgs,
  lib,
  ...
}: {
programs.nvf = {
enable = true;
settings = {
        vim = {
                viAlias = true;
                vimAlias = true;

                theme = {
                        enable = true;
                        name = "gruvbox";
                        style = "dark";
                };

                lsp.enable = true;
                lsp.formatOnSave = true;
                treesitter.enable = true;

                statusline.lualine.enable = true;
                telescope.enable = true;
                autocomplete.nvim-cmp.enable = true;

                opt = {
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

                globals.mapleader = " ";
                keymaps = [
                        {
                                key = "<leader>pv";
                                mode = "n";
                                action = "Ex";
                        }
                        {
                                key = "<leader>m";
                                mode = ["n" "x"];
                                action = ":make<CR>";
                        }
                        {
                                key = "<leader>y";
                                mode = ["n" "v"];
                                action = "\"+y";
                        }
                        {
                                key = "<leader>x";
                                mode = "n";
                                silent = true;
                                action = "<cmd>!chmod +x %<CR>";
                        }
                ];
        };
};
};
}

