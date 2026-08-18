_: {
  imports = [
    ./vim.nix
    ./nvim.nix
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
