depth=1010;

//create_parallax_layer(sprComic, 0.2, 0.2, 0.2, 0, 1000, c_white, 1);
surf=-1;
surf2=-1;
surf3=-1;
surf4=-1;
surf5=-1;

x_follow = 0.2;
y_follow = 0.2;
x_speed = 0.2;
y_speed = 0;
colour = c_white;
alpha = 1;

previous_xview = __view_get( e__VW.XView, 0 );
previous_yview = __view_get( e__VW.YView, 0 );


bgColor1=make_colour_rgb(random(255), random(255), random(255));
bgColor2=make_colour_rgb(random(255), random(255), random(255));
bgColor3=make_colour_rgb(random(255), random(255), random(255));
bgColor4=make_colour_rgb(random(255), random(255), random(255));
bgColor5=make_colour_rgb(random(255), random(255), random(255));

