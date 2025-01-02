public class Leaf {
	int lid; 
	float fallRate;
	float length;
	float lengthHalf;
	PVector position;
	float bottom;
	color clr;
	Leaf sibling;
	boolean fell;
	final static float CFAC = 200.0 * (1.0/255.0);

	public Leaf (int xpos) {
		lid = xpos;
		position = new PVector(lid, 0.0);
		length = width * 0.08;
		lengthHalf = length * 0.5;
		bottom = height - 1;

		fell = false;
		setFallRate();
		clr = genColor();
	}

	color genColor() {
		final float tfac = fallRate * 0.33;
		float r = 215.0;
		float g = (1.0 - abs(lerp(0.0, 1.0, tfac))) * 255.0;
		float b = (1.0 - (abs(lerp(0.0, 1.0, tfac))*CFAC)) * 255.0;

		return color(r, g, b);
	}

	void setFallRate(){
		fallRate = random(0.50,3.0);
	}

	void setFallRate(float n){
		fallRate = random(n);
	}

	void resetLeaf(){
		position.x = random(width - (length * 0.5));
		position.y = 0;
		setFallRate();
	}

	void fall(){
		if (!fell) {
		// [^] if this Leaf has not 'fell' to the bottom yet then:
			if (position.y > bottom) {
			// [^] if this Leaf's y position is greater than the bottom then:
				position.y = bottom;
				// [^] set the y position to the bottom and:
				fell = true;
				// [^] mark this Leaf as fell otherwise:
			} else {
				position.y += fallRate;
				// [^] 'fall' the Leaf
			}
		}
	}

	void show(){
		stroke(clr);
		point(position.x, position.y);
	}

}
