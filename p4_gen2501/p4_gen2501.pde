/* -------------------------------------------------------------------------- */
/*                                PROCESSING 4                                */
/* -------------------------------------------------------------------------- */
// Title: gen25-01
// Author: Faizon Zaman

import processing.javafx.*;

final float cellSize = 10.0;
final float cellSizeHalf = cellSize * 0.5;

void setup() {
    size(400,400, FX2D);
    pixelDensity(displayDensity());
    hint(ENABLE_STROKE_PURE);
    surface.setTitle("gen25-01");
	
    background(0);
}

void draw() {
    background(0);

    for(int i = 0; i < width; i += cellSize){
        for(int j = 0; j < height; j += cellSize){
	    final float x = i + cellSizeHalf;
	    final float d = dist(width * 0.5, height * 0.5, x, j);
	    final float r = random(200 - d)+55;
	    final float sw = 2.0 - (255.0/(2*d));
	    strokeWeight(sw);
	    stroke(r);
	    line(x, j - cellSizeHalf, x, j + cellSizeHalf);
        }
    }
}
