package tetromino;

/**
 * ...
 * @author Mc
 */
class ZTetronimo extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[6, 6, 0], //1
					 [0, 6, 6],
					 [0, 0, 0]],
					[[0, 0, 6], //2
					 [0, 6, 6],
					 [0, 6, 0]],
					[[6, 6, 0], //2
					 [0, 6, 6],
					 [0, 0, 0]],
					[[0, 0, 6], //2
					 [0, 6, 6],
					 [0, 6, 0]]];
		TetType = 6;
	}
	
}