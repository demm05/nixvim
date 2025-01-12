{ lib, config, ... }:
{
  plugins.notify = {
    enable = false;
    backgroundColour = "#000000";
    fps = 60;
    render = "default";
    timeout = 1000;
    topDown = true;
  };
}
