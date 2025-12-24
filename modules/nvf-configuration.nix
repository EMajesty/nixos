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

