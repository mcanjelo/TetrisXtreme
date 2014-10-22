package tetromino;

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
	private var potentialShape:Int;
	
	
	public function new() {
		shape = 0;
		topLeftX = 4;
		topLeftY = 0;
		potentialTopLeftX = topLeftX;
		potentialTopLeftY = topLeftY;
		potentialShape = shape;
		numberOfRotations = 4;
	}
	
	public function PotentialCollision () {
		potentialTopLeftX = topLeftX;
		potentialTopLeftY = topLeftY;
	}
	
	public function PotentialFall() {
		potentialTopLeftY++;
	}
	
	public function PotentialMoveRight() {
		potentialTopLeftX++;
	}
	
	public function PotentialMoveLeft() {
		potentialTopLeftX--;
	}
	
	public function PotentialRotate() {
		potentialShape++;
		potentialShape = potentialShape % numberOfRotations;
	}
	
	public function GetPotentialShape() {
		return rotation[potentialShape];
	}
	
	public function Move() {
		topLeftX = potentialTopLeftX;
		topLeftY = potentialTopLeftY;
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
		shape = potentialShape;
	}
	
	public function getShape() :Array<Array<Int>> {
		return rotation[shape];
	}
	
}