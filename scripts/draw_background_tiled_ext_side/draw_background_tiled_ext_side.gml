/// @description Draws a background at a given position with scaling, blending and alpha, and tiles it to fill the entire view.
/// @param back The index of the background to draw.
/// @param x The x coordinate of where to draw the background.
/// @param y The y coordinate of where to draw the background.
/// @param xscale The horizontal scaling of the background.
/// @param yscale The vertical scaling of the background.
/// @param colour The colour with which to blend the background (use -1 or c_white to display it normally).
/// @param alpha The alpha of the background (from 0 to 1 where 0 is transparent and 1 opaque).
/// @returns 
function draw_background_tiled_ext_side(sprite, sub_image, x, y, xscale, yscale, col, alpha) {

	draw_sprite_tiled_ext(sprite, sub_image, x, y, xscale, yscale, col, alpha);


}