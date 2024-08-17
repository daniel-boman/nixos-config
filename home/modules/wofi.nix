{ config, pkgs, inputs, lib, ...}: 

{
	programs.wofi = {
		enable = false;

		style = ''
@define-color rosewater  #f4dbd6;
@define-color rosewater-rgb  rgb(244, 219, 214);
@define-color flamingo  #f0c6c6;
@define-color flamingo-rgb  rgb(240, 198, 198);
@define-color pink  #f5bde6;
@define-color pink-rgb  rgb(245, 189, 230);
@define-color mauve  #c6a0f6;
@define-color mauve-rgb  rgb(198, 160, 246);
@define-color red  #ed8796;
@define-color red-rgb  rgb(237, 135, 150);
@define-color maroon  #ee99a0;
@define-color maroon-rgb  rgb(238, 153, 160);
@define-color peach  #f5a97f;
@define-color peach-rgb  rgb(245, 169, 127);
@define-color yellow  #eed49f;
@define-color yellow-rgb  rgb(238, 212, 159);
@define-color green  #a6da95;
@define-color green-rgb  rgb(166, 218, 149);
@define-color teal  #8bd5ca;
@define-color teal-rgb  rgb(139, 213, 202);
@define-color sky  #91d7e3;
@define-color sky-rgb  rgb(145, 215, 227);
@define-color sapphire  #7dc4e4;
@define-color sapphire-rgb  rgb(125, 196, 228);
@define-color blue  #8aadf4;
@define-color blue-rgb  rgb(138, 173, 244);
@define-color lavender  #b7bdf8;
@define-color lavender-rgb  rgb(183, 189, 248);
@define-color text  #cad3f5;
@define-color text-rgb  rgb(202, 211, 245);
@define-color subtext1  #b8c0e0;
@define-color subtext1-rgb  rgb(184, 192, 224);
@define-color subtext0  #a5adcb;
@define-color subtext0-rgb  rgb(165, 173, 203);
@define-color overlay2  #939ab7;
@define-color overlay2-rgb  rgb(147, 154, 183);
@define-color overlay1  #8087a2;
@define-color overlay1-rgb  rgb(128, 135, 162);
@define-color overlay0  #6e738d;
@define-color overlay0-rgb  rgb(110, 115, 141);
@define-color surface2  #5b6078;
@define-color surface2-rgb  rgb(91, 96, 120);
@define-color surface1  #494d64;
@define-color surface1-rgb  rgb(73, 77, 100);
@define-color surface0  #363a4f;
@define-color surface0-rgb  rgb(54, 58, 79);
@define-color base  #24273a;
@define-color base-rgb  rgb(36, 39, 58);
@define-color mantle  #1e2030;
@define-color mantle-rgb  rgb(30, 32, 48);
@define-color crust  #181926;
@define-color crust-rgb  rgb(24, 25, 38);

* {
  font-family: "Inconsolata Nerd Font", monospace;
  font-size: 14px;
}

/* Window */
window {
  margin: 0px;
  padding: 10px;
  border: 0.16em solid @lavender;
  border-radius: 0.1em;
  background-color: @base;
}

/* Inner Box */
#inner-box {
  margin: 5px;
  padding: 10px;
  border: none;
  background-color: @base;
}

/* Outer Box */
#outer-box {
  margin: 5px;
  padding: 10px;
  border: none;
  background-color: @base;
}

/* Scroll */
#scroll {
  margin: 0px;
  padding: 10px;
  border: none;
  background-color: @base;
}

/* Input */
#input {
  margin: 5px 20px;
  padding: 10px;
  border: none;
  border-radius: 0.1em;
  color: @text;
  background-color: @base;
}

#input image {
  border: none;
  color: @red;
}

#input * {
  outline: 4px solid @red!important;
}

/* Text */
#text {
  margin: 5px;
  border: none;
  color: @text;
}

#entry {
  background-color: @base;
}

#entry arrow {
  border: none;
  color: @lavender;
}

/* Selected Entry */
#entry:selected {
  border: 0.11em solid @lavender;
}

#entry:selected #text {
  color: @mauve;
}

#entry:drop(active) {
  background-color: @lavender!important;
}

		'';	
	};
}
