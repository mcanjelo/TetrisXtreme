package tetromino;

/**
 * ...
 * @author Mc
 */
class STetromino extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[0, 1, 1], //1
					 [1, 1, 0],
					 [0, 0, 0]],
					[[1, 0, 0], //2
					 [1, 1, 0],
					 [0, 1, 0]],
					[[0, 1, 1], //3
					 [1, 1, 0],
					 [0, 0, 0]],
					[[0, 1, 1], //4
					 [1, 1, 0],
					 [0, 0, 0]]];
	}
	
}