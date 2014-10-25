package tetromino;

/**
 * ...
 * @author Mc
 */
class TTetromino extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[0, 5, 0], //1
					 [5, 5, 5],
					 [0, 0, 0]],
					[[0, 5, 0],//2
					 [0, 5, 5],
					 [0, 5, 0]],
					[[0, 0, 0], //3
					 [5, 5, 5],
					 [0, 5, 0]],
					[[0, 5, 0], //4
					 [5, 5, 0],
					 [0, 5, 0]]];
		TetType = 5;
	}
	
}