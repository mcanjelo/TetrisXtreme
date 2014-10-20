package Tetromino;
import Tetromino.Tetromino;

/**
 * ...
 * @author Mc
 */
class ITetromino extends Tetromino
{
	public function new() 
	{
		super();
		rotation = [[[0, 0, 0, 0], //1
					 [1, 1, 1, 1], 
					 [0, 0, 0, 0], 
					 [0, 0, 0, 0]], 
					[[0, 0, 1, 0], //2
					 [0, 0, 1, 0], 
					 [0, 0, 1, 0], 
					 [0, 0, 1, 0]],
					[[0, 0, 0, 0], //3
					 [0, 0, 0, 0], 
					 [1, 1, 1, 1], 
					 [0, 0, 0, 0]], 
					[[0, 1, 0, 0], //4
					 [0, 1, 0, 0], 
					 [0, 1, 0, 0], 
					 [0, 1, 0, 0]]];
	}
	

	
}