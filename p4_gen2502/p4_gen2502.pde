/* -------------------------------------------------------------------------- */
/*                                PROCESSING 4                                */
/* -------------------------------------------------------------------------- */
// TITLE: gen25-02
// AUTHOR: Faizon Zaman

import processing.javafx.*;
import java.util.*;
// Layers upon layers
ArrayList<ArrayList<Leaf>> leaves;
// Each column is a hue seed. drop a particle down. it hits the bottm and stays. the next particle falls and its color is related to the previous particles' color.
void setup() {
	size(400,400, FX2D);
	pixelDensity(displayDensity());
	hint(ENABLE_STROKE_PURE);
	surface.setTitle("gen2502");
	surface.setResizable(false);
	
	rectMode(CENTER);
	imageMode(CENTER);

	final int leafCount = width;

	leaves = new ArrayList<ArrayList<Leaf>>(leafCount);
	println("size of leaves empty: " + leaves.size());
	for (int i = 0; i < leafCount; i++) {
		leaves.add(i, new ArrayList<Leaf>());
		leaves.get(i).add(new Leaf(i));
	}
	println("size of leaves filled: " + leaves.size());

	background(0);
}

void draw() {
	background(0);
	for (ArrayList<Leaf> al : leaves) {
		Leaf cal = al.get(al.size() - 1);
		if (al.size() > 1){
			cal.bottom = al.get(al.size() - 2).bottom -1;
		}
		cal.fall();
		if (cal.fell) {
			al.add(new Leaf(cal.lid));
		}
		for (Leaf l : al) {
			l.show();
		}
	}
}

void exit(){
	println("final size of leaves: " + leaves.size());
}