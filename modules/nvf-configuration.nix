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
                theme.enable = true;
                theme.name = "gruvbox";
                theme.style = "dark";

                lsp.enable = true;
                lsp.formatOnSave = true;
                treesitter.enable = true;

                statusline.lualine.enable = true;
                telescope.enable = true;
                autocomplete.nvim-cmp.enable = true;

                globals.mapleader = " ";
                keymaps = [
                        {
                                key = "<leader>pv";
                                mode = "n";
                                silent = true;
                                action = "<cmd>Ex<CR>";
                        }
                        {
                                key = "<leader>m";
                                mode = ["n" "x"];
                                silent = true;
                                action = ":make<CR>";
                        }
                        {
                                key = "<leader>y";
                                mode = ["n" "v"];
                                silent = true;
                                action = "<cmd>\"+y";
                        }
                ];
        };
};
};
}

