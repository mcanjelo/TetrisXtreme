package tetromino;

/**
 * ...
 * @author Mc
 */
class OTetromino extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[0, 8, 8, 0], //1
					 [0, 8, 8, 0],
					 [0, 0, 0, 0],
					 [0, 0, 0, 0]],
					[[0, 8, 8, 0], //2
					 [0, 8, 8, 0],
					 [0, 0, 0, 0],
					 [0, 0, 0, 0]],
					[[0, 8, 8, 0], //3
					 [0, 8, 8, 0],
					 [0, 0, 0, 0],
					 [0, 0, 0, 0]],
					[[0, 8, 8, 0], //4
					 [0, 8, 8, 0],
					 [0, 0, 0, 0],
					 [0, 0, 0, 0]]];
		TetType = 3;
	}
	
}