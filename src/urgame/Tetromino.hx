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
	
	
	public function new() {
		shape = 0;
		topLeftX = 4;
		topLeftY = 0;
		numberOfRotations = 4;
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
	
	public function rotate() {
		shape++;
		shape = shape % numberOfRotations;
	}
	
	public function getShape() {
		return rotation[shape];
	}
}