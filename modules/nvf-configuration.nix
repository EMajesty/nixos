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
        vim.lsp.enable = true;
        vim.theme.enable = true;
        vim.theme.name = "gruvbox";
        vim.theme.style = "dark";

        vim.globals.mapleader = " ";
        vim.keymaps = [
                {
                        key = "<leader>pv";
                        mode = "n";
                        action = "vim.cmd.Ex";
                }
        ];
};
};
}

