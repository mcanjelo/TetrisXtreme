package urgame;
import haxe.macro.Expr.Var;

/**
 * ...
 * @author Mc
 */
class PlayingField
{
	private var landed:Array<Array<Int>>;
	private var curPiece:Tetromino;
	
	public function new() {
		landed = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
				  
			NewPiece();
	}
	
	public function CollisionDetection() {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (col + curPiece.getPotentialX < 0) {
					//collision on left side of playing field
					curPiece.PotentialCollision();
				}
				if (col + curPiece.getPotentialX() >= landed[0].length) {
					//collision on right side of playing field
					curPiece.PotentialCollision();
				}
				if (row + curPiece.getPotentialY() >= landed.length) {
					//collision on bottom side of playing field (land)
					Land();
				}
				if (landed[row + curPiece.getPotentialY()] != 0] &&
					landed[col + curPiece.getPotentialY()] != 0]) {
					//collision on object (land)
					Land();
				}
			}
		}
		
		curPiece.Move();
	}
	
	public function RotationHandling() {
		var curShape:Array<Array<Int>> = curPiece.GetPotentialShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (col + curPiece.getPotentialX < 0) {
					//collision on left side of playing field (dont rotate)
					curPiece.PotentialCollision();
				}
				if (col + curPiece.getPotentialX() >= landed[0].length) {
					//collision on right side of playing field (dont rotate)
					curPiece.PotentialCollision();
				}
				if (row + curPiece.getPotentialY() >= landed.length) {
					//collision on bottom side of playing field (dont rotate)
					curPiece.PotentialCollision();
				}
				if (landed[row + curPiece.getPotentialY()] != 0] &&
					landed[col + curPiece.getPotentialY()] != 0]) {
					//collision on object (dont rotate)
					curPiece.PotentialCollision();
				}
			}
		}
		
		curPiece.rotate();
	}
	
	
	public function Land() {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					landed[row + curPiece.getY][col + curPiece.getX] = curShape[row][col];
					NewPiece();
				}
			}
		}
	}
	
	public function NewPiece() {
		var randTet:Int;
		
		randTet = Std.random(7);
		switch(randTet) {
			case 0: curPiece = new ITetromino();
					break;
			case 1: curPiece = new JTetrominio();
					break;
			case 2: curPiece = new LTetromino();
					break;
			case 3: curPiece = new OTetromino();
					break;
			case 4: curPiece = new STetromino();
					break;
			case 5: curPiece = new TTetromino();
					break;
			case 6: curPiece = new ZTetronimo();
					break;
			default: break;
		}
	}
	
	
	
	
}