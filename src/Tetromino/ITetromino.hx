package tetromino;
import tetromino.Tetromino;

/**
 * ...
 * @author Mc
 */
class ITetromino extends Tetromino
{
	public function new() 
	{
		super();
		rotation = [[[0, 2, 0, 0], //1
					 [0, 2, 0, 0], 
					 [0, 2, 0, 0], 
					 [0, 2, 0, 0]], 
					[[0, 0, 0, 0], //2
					 [2, 2, 2, 2], 
					 [0, 0, 0, 0], 
					 [0, 0, 0, 0]],
					[[0, 0, 2, 0], //3
					 [0, 0, 2, 0], 
					 [0, 0, 2, 0], 
					 [0, 0, 2, 0]], 
					[[0, 0, 0, 0], //4
					 [2, 2, 2, 2], 
					 [0, 0, 0, 0], 
					 [0, 0, 0, 0]]];
		TetType = 0;
	}
	

	
}