package tetromino;

/**
 * ...
 * @author Mc
 */
class JTetrominio extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[3, 0, 0], //1
					 [3, 3, 3],
					 [0, 0, 0]],
					[[0, 3, 3],//2
					 [0, 3, 0],
					 [0, 3, 0]],
					[[0, 0, 0], //3
					 [3, 3, 3],
					 [0, 0, 3]],
					[[0, 3, 0], //4
					 [0, 3, 0],
					 [3, 3, 0]]];
		TetType = 1;
	}
	
}