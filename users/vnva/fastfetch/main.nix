{ }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_old";
        padding = {
          right = 1;
        };
      };
      display = {
        #size = {
        #  binaryPrefix = "si";
        #};
        #color = "blue";
        #separator = "  ";
      };
      modules = [
        "os"
        "host"
        "kernel"
        "packages"
        "shell"
        "display"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
      ];
    };
  };
}
