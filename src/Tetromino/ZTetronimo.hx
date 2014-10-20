package Tetromino;

/**
 * ...
 * @author Mc
 */
class ZTetronimo extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[1, 1, 0], //1
					 [0, 1, 1],
					 [0, 0, 0]],
					[[0, 0, 1], //2
					 [0, 1, 1],
					 [0, 1, 0]],
					[[1, 1, 0], //2
					 [0, 1, 1],
					 [0, 0, 0]],
					[[0, 0, 1], //2
					 [0, 1, 1],
					 [0, 1, 0]]];
	}
	
}