package tetromino;

/**
 * ...
 * @author Mc
 */
class LTetromino extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[0, 0, 4], //1
					 [4, 4, 4],
					 [0, 0, 0]],
					[[0, 4, 0],//2
					 [0, 4, 0],
					 [0, 4, 4]],
					[[0, 0, 0], //3
					 [4, 4, 4],
					 [4, 0, 0]],
					[[4, 4, 0], //4
					 [0, 4, 0],
					 [0, 4, 0]]];
		TetType = 2;
	}
	
}