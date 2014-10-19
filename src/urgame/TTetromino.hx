package urgame;

/**
 * ...
 * @author Mc
 */
class TTetromino extends Tetromino
{

	public function new() 
	{
		super();
		rotation = [[[0, 1, 0], //1
					 [1, 1, 1],
					 [0, 0, 0]],
					[[0, 1, 0],//2
					 [0, 1, 1],
					 [0, 1, 0]],
					[[0, 0, 0], //3
					 [1, 1, 1],
					 [0, 1, 0]],
					[[0, 1, 0], //4
					 [1, 1, 0],
					 [0, 1, 0]]];
	}
	
}