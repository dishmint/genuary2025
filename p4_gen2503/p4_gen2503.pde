/* -------------------------------------------------------------------------- */
/*                                PROCESSING 4                                */
/* -------------------------------------------------------------------------- */
// TITLE: gen2503
// AUTHOR: Faizon Zaman
import processing.javafx.*;
float degrees;

PVector center;
PVector qcenter;

void setup() {size(400,400, FX2D);pixelDensity(displayDensity());hint(ENABLE_STROKE_PURE);surface.setTitle("gen2503");surface.setResizable(false);center = new PVector(width, height);center.mult(0.5);qcenter = new PVector(width, height);qcenter.mult(0.25);rectMode(CENTER);imageMode(CENTER);background(0);}
void draw() {
	background(0);final int num = int(random(0,12));
	switch (num) {
		case 0 :
			degrees = 0;break;
		case 1 :
			degrees = 45;break;
		case 2 :
			degrees = 90;break;
		case 3 :
			degrees = 135;break;
		case 4 :
			degrees = 180;break;
		case 5 :
			degrees = 225;break;
		case 6 :
			degrees = 270;break;
		case 7 :
			degrees = 315;break;
		case 8 :
			degrees = 360;break;
		default:
			degrees = 0;break;
	}
	stroke(255);
	translate(center.x, center.y);
	rotate(radians(degrees));
	translate(-center.x, -center.y);
	line(center.x - qcenter.x, center.y, center.x + qcenter.x, center.y);
}