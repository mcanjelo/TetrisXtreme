package urgame;

/**
 * ...
 * @author Mc
 */
class Tetromino
{
	private var shape:Int;
	private var numberOfRotations:Int;
	private var rotation:Array<Array<Array<Int>>>;
	private var topLeftX:Int;
	private var topLeftY:Int;
	private var potentialTopLeftX:Int;
	private var potentialTopLeftY:Int;
	
	
	public function new() {
		shape = 0;
		topLeftX = 4;
		topLeftY = 0;
		potentialTopLeftX = topLeftX;
		potentialTopLeftY = topLeftY;
		numberOfRotations = 4;
	}
	
	public function PotentialFall() {
		potentialTopLeftY++;
	}
	
	public function PotentialMoveRight() {
		potentialTopLeftX++;
	}
	
	public function PotentialmMoveLeft() {
		potentialTopLeftX--;
	}
	
	public function MoveRight() {
		topLeftX++;
	}
	
	public function MoveLeft() {
		topLeftX--;
	}
	
	public function Fall() {
		topLeftY++;
	}
	
	public function getPotentialX() {
		return potentialTopLeftX;
	}
	
	public function getPotentialY() {
		return potentialTopLeftY;
	}
	
	public function getX() {
		return topLeftX;
	}
	
	public function getY() {
		return topLeftY;
	}
	
	public function rotate() {
		shape++;
		shape = shape % numberOfRotations;
	}
	
	public function getShape() :Array<Array<Int>> {
		return rotation[shape];
	}
}