{
  pkgs,
  lib,
  ...
}: {
programs.nvf = {
enable = true;
settings = {
        vim.viAlias = true;
        vim.vimAlias = true;
        vim.theme.enable = true;
        vim.theme.name = "gruvbox";
        vim.theme.style = "dark";

        vim.lsp.enable = true;
        vim.lsp.formatOnSave = true;
        vim.treesitter.enable = true;

        # statusline.lualine.enable = true;
        telescope.enable = true;
        # autocomplete.nvim-cmp.enable = true;

        vim.globals.mapleader = " ";
        vim.keymaps = [
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
}

