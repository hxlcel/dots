{ ... }: {

  programs.git = {
    enable = true;
    userName = "hxlcel";
    userEmail = "jopat2003@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
