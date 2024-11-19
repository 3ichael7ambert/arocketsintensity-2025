/// @description Insert description here
// You can write your code in this editor

speed=random(10);
direction=random(360);
var scale;
scale=random(360)/360;
if scale<.25 then scale+=.25;
if scale>.75 then scale-=.25;
image_xscale=scale-.5;
image_yscale=scale-.5;

depth=1000 + choose(random(500),-random(500));




