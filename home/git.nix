{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Emir Cankur";
    userEmail = "emircnkr66@gmail.com";
  };

  programs.gh.enable = true;
  programs.gh.enableGitCredentialHelper = true;
}
