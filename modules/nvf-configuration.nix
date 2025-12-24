{
  pkgs,
  lib,
  ...
}: {
programs.nvf = {
enable = true;
settings = {
        neovim.enable = true;
        vim.viAlias = true;
        vim.vimAlias = true;
        vim.lsp.enable = true;
};
};
}

