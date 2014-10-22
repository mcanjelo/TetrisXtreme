package urgame;
import flambe.Component;
import flambe.Disposer;
import flambe.Entity;
import flambe.input.KeyboardEvent;
import flambe.System;
import flambe.input.Key;
import haxe.macro.Expr.Var;
import tetromino.ITetromino;
import tetromino.JTetrominio;
import tetromino.LTetromino;
import tetromino.OTetromino;
import tetromino.STetromino;
import tetromino.TTetromino;
import tetromino.ZTetronimo;

/**
 * ...
 * @author Mc
 */
class PlayingField extends Component
{
	private var rightKeyDown:Bool;
	private var leftKeyDown:Bool;
	private var downKeyDown:Bool;
	private var MoveTime:Float;
	
	public function new() {
		Registry.landed = [[1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]];
				  
				  Registry._Disposer = new Disposer();

	}

	
	override public function onAdded() 
	{
		super.onAdded();
		this.owner.add(Registry._Disposer);
		Registry._Disposer.add(System.keyboard.down.connect(ChangeDirection));
		Registry._Disposer.add(System.keyboard.up.connect(ReleaseChangeDirection));
		NewPiece();
		trace(Registry.landed.length);
		Registry.Go.connect(function() {
			Movement();
			if(Registry.curPiece != null) {
			Registry.curPiece.PotentialFall();
			if (LandDetection())
				Land();
			else
				Registry.curPiece.Move();
			}
			
		});
		
	}
	
	public function Movement() {
		if (downKeyDown) {
			Registry.curPiece.PotentialFall();
			if (LandDetection())
				Land();
			else
				Registry.curPiece.Move();
		}
		if (rightKeyDown) {
			Registry.curPiece.PotentialMoveRight();
			CollisionDetection();
		}
		else if (leftKeyDown) {
			Registry.curPiece.PotentialMoveLeft();
			CollisionDetection();
		}
	}
	
	public function CollisionDetection() {
		var curShape:Array<Array<Int>> = Registry.curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					if (col + Registry.curPiece.getPotentialX() < 0) {
						//collision on left side of playing field
						Registry.curPiece.PotentialCollision();
					}
					if (col + Registry.curPiece.getPotentialX() >= Registry.landed[0].length) {
						//collision on right side of playing field
						Registry.curPiece.PotentialCollision();
					}
					if (Registry.landed[row + Registry.curPiece.getPotentialY()][col + Registry.curPiece.getPotentialX()] != 0) {
						//collision on object (land)
						Registry.curPiece.PotentialCollision();
					}
				}
			}
		}
		
		Registry.curPiece.Move();
	}
	
	public function LandDetection() {
		var curShape:Array<Array<Int>> = Registry.curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					if (row + Registry.curPiece.getPotentialY() >= Registry.landed.length) {
						//collision on bottom side of playing field (land)
						return true;
					}
					if (Registry.landed[row + Registry.curPiece.getPotentialY()][col + Registry.curPiece.getPotentialX()] != 0) {
						//collision on object (land)
						return true;
					}
				}
			}
		}
		
		return false;
	}
	
	public function RotationHandling() {
		var curShape:Array<Array<Int>> = Registry.curPiece.GetPotentialShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					if (col + Registry.curPiece.getPotentialX() < 0) {
						//collision on left side of playing field (dont rotate)
						Registry.curPiece.PotentialCollision();
					}
					if (col + Registry.curPiece.getPotentialX() >= Registry.landed[0].length) {
						//collision on right side of playing field (dont rotate)
						Registry.curPiece.PotentialCollision();
					}
					if (row + Registry.curPiece.getPotentialY() >= Registry.landed.length) {
						//collision on bottom side of playing field (dont rotate)
						Registry.curPiece.PotentialCollision();
					}
					if (Registry.landed[row + Registry.curPiece.getPotentialY()][col + Registry.curPiece.getPotentialX()] != 0) {
						//collision on object (dont rotate)
						Registry.curPiece.PotentialCollision();
					}
				}
			}
		}
		
		Registry.curPiece.rotate();
	}
	
	
	public function Land() {
		var curShape:Array<Array<Int>> = Registry.curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					Registry.landed[row + Registry.curPiece.getY()][col + Registry.curPiece.getX()] = curShape[row][col];
					
				}
			}
		}
		NewPiece();	
	}
	
	override public function onUpdate(dt:Float) 
	{
		super.onUpdate(dt);
		ClearLines();
		MoveTime+= dt;
	}
	
	public function ClearLines() {
		var isFilled = true;
		for (row in 0...Registry.landed.length) {
			for (col in 0...Registry.landed[row].length) {
				if (Registry.landed[row][col] == 0)
					isFilled = false;
			}
			if (isFilled) {
				Registry.landed.splice(row, 1);
				Registry.landed.unshift([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
				trace("clear line" + row);
			}
			isFilled = true;
		}
	}
	
	public function NewPiece() {
		var randTet:Int;
		
		randTet = Std.random(7);
		switch(randTet) {
			case 0: Registry.curPiece = new ITetromino();
			case 1: Registry.curPiece = new JTetrominio();
			case 2: Registry.curPiece = new LTetromino();
			case 3: Registry.curPiece = new OTetromino();
			case 4: Registry.curPiece = new STetromino();
			case 5: Registry.curPiece = new TTetromino();
			case 6: Registry.curPiece = new ZTetronimo();
		}
	}
	
	public function ChangeDirection(event:KeyboardEvent) {
		if (event.key == Key.Up) {
			Registry.curPiece.PotentialRotate();
			RotationHandling();
		}
		else if (event.key == Key.Down) {
			downKeyDown = true;
			Registry.curPiece.PotentialFall();
			if (LandDetection())
				Land();
			else
				Registry.curPiece.Move();
		}
		else if (event.key == Key.Right) {
			rightKeyDown = true;
			Registry.curPiece.PotentialMoveRight();
			CollisionDetection();
		}
		else if (event.key == Key.Left) {
			leftKeyDown = true;
			Registry.curPiece.PotentialMoveLeft();
			CollisionDetection();
		}
	}
	
	public function ReleaseChangeDirection(event:KeyboardEvent) {
		if (event.key == Key.Down) {
			rightKeyDown = false;
		}
		else if (event.key == Key.Right) {
			rightKeyDown = false;
		}
		else if (event.key == Key.Left) {
			leftKeyDown = false;
		}
	}
	
	
	
	
}