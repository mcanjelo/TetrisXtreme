package Tetromino;

/**
 * ...
 * @author Mc
 */
class JTetrominio extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[1, 0, 0], //1
					 [1, 1, 1],
					 [0, 0, 0]],
					[[0, 1, 1],//2
					 [0, 1, 0],
					 [0, 1, 0]],
					[[0, 0, 0], //3
					 [1, 1, 1],
					 [0, 0, 1]],
					[[0, 1, 0], //4
					 [0, 1, 0],
					 [1, 1, 0]]];
	}
	
}