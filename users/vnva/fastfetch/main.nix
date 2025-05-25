{ }:
let
in {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${./oie_1.png}";
        height = 10;
        padding = {
          top = 0;
          right = 3;
        };
      };
      display = {
        #size = {
        #  binaryPrefix = "si";
        #};
        color = "white";
        #separator = "  ";
      };
      modules = [
        { type = "os"; key = "os"; }
        { type = "host"; key = "host"; }
        # { type = "kernel"; key = "kernel"; }
        { type = "packages"; key = "packages"; }
        { type = "shell"; key = "shell"; }
        { type = "display"; key = "display"; }
        { type = "wm"; key = "wm"; }
        { type = "terminal"; key = "terminal"; }
        { type = "cpu"; key = "cpu"; }
        # { type = "gpu"; key = "gpu"; }
        { type = "memory"; key = "memory"; }
      ];
    };
  };
}
