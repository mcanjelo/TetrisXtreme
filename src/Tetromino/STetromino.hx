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
		rotation = [[[0, 7, 7], //1
					 [7, 7, 0],
					 [0, 0, 0]],
					[[7, 0, 0], //2
					 [7, 7, 0],
					 [0, 7, 0]],
					[[0, 7, 7], //3
					 [7, 7, 0],
					 [0, 0, 0]],
					[[0, 7, 7], //4
					 [7, 7, 0],
					 [0, 0, 0]]];
		TetType = 4;
	}
	
}