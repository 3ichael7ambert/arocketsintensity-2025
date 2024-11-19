//draw_text_outlined(x, y, outline color, string color, string)  
function draw_text_outlined(argument0,argument1,argument2,argument3,argument4)
{
var xx,yy,outline,words, colored;  
xx = argument0;  
yy = argument[1];  
outline=argument[4];
words=argument[2];
colored=argument[3];
  
//Outline  
draw_set_color(c_black);  
draw_text(xx+1, yy+1, argument[2]);  
draw_text(xx-1, yy-1, argument[2]);  
draw_text(xx,   yy+1, argument[2]);  
draw_text(xx+1,   yy, argument[2]);  
draw_text(xx,   yy-1, argument[2]);  
draw_text(xx-1,   yy, argument[2]);  
draw_text(xx-1, yy+1, argument[2]);  
draw_text(xx+1, yy-1, argument[2]);  
  
//Text  
draw_set_color(argument[3]);  
draw_text(xx, yy, argument[2]); 

}