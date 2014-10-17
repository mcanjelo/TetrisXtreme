package urgame;

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
				  
			curPiece = new OTetromino();
	}
	
	public function HasLanded():Bool {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (landed[row + curPiece.getPotentialY()] != 0] &&
					landed[col + curPiece.getPotentialY()] != 0]) {
						return false;
					}
			}
		}
		
		return true;
	}
	
	public function Landed() {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					landed[row + curPiece.getY][col + curPiece.getX] = curShape[row][col];
				}
			}
		}
	}
	
	
	
}