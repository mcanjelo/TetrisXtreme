package urgame;
import flambe.Component;
import flambe.Disposer;
import flambe.Entity;
import flambe.input.KeyboardEvent;
import flambe.script.CallFunction;
import flambe.script.Delay;
import flambe.script.Repeat;
import flambe.script.Script;
import flambe.script.Sequence;
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
import tetromino.Tetromino;

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
	private var Lines:Int;
	private var fallScript:Script;
	private var movementScript:Script;
	private var hold:Bool;
	private var dropY:Int;
	
	public function new() {
		Registry.landed = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
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
				  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];
				  
				  Registry._Disposer = new Disposer();
				  fallScript = new Script();
				  movementScript = new Script();
				  Registry.cycle = new Array<Int>();
				  hold = false;

	}

	
	override public function onAdded() 
	{
		super.onAdded();
		this.owner.add(Registry._Disposer);
		Registry._Disposer.add(System.keyboard.down.connect(ChangeDirection));
		Registry._Disposer.add(System.keyboard.up.connect(ReleaseChangeDirection));
		generateNewPiece();
		generateNewPiece();
		generateNewPiece();
		NewPiece(Registry.cycle.splice(0,1)[0]);
		generateNewPiece();
		this.owner.add(fallScript);
		this.owner.addChild(new Entity().add(movementScript));
		fallScript.run(new Repeat(new Sequence([new CallFunction(function() { if(Registry.curPiece != null) {
			Registry.curPiece.PotentialFall();
			if (LandDetection()){
				if (Registry.curPiece.getY() == 0)
					trace("GameOver");
				Land();
			}
			else
				Registry.curPiece.Move();
			}}), new Delay(1)])));
			
		movementScript.run(new Repeat(new Sequence([new CallFunction(Movement), new Delay(0.07)])));
		
		
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
	
	public function HardDropDetection() {
		var curShape:Array<Array<Int>> = Registry.curPiece.getShape();
		for (hardDrop in 0...Registry.landed.length) {
			for (row in 0...curShape.length) {
				for (col in 0...curShape[row].length) {
					if (curShape[row][col] != 0) {
						if (row + hardDrop >= Registry.landed.length) {
							//collision on bottom side of playing field (land)
							return hardDrop - 1;
						}
						if (Registry.landed[row + hardDrop][col + Registry.curPiece.getPotentialX()] != 0) {
							//collision on object (land)
							return hardDrop - 1;
						}
					}
				}
			}
		}
		return Registry.landed.length-4;
		
		
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
		ClearLines();
		hold = false;
		NewPiece(Registry.cycle.splice(0, 1)[0]);
		generateNewPiece();
	}
	
	public function HardDrop() {
		var curShape:Array<Array<Int>> = Registry.curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					Registry.landed[row + dropY][col + Registry.curPiece.getX()] = curShape[row][col];
					
				}
			}
		}
		ClearLines();
		hold = false;
		NewPiece(Registry.cycle.splice(0, 1)[0]);
		generateNewPiece();
	}
	
	override public function onUpdate(dt:Float) 
	{
		super.onUpdate(dt);
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
				Lines++;
			}
			isFilled = true;
		}
	}
	
	public function NewPiece(tet:Int) {
		
		switch(tet) {
			case 0: Registry.curPiece = new ITetromino();
			case 1: Registry.curPiece = new JTetrominio();
			case 2: Registry.curPiece = new LTetromino();
			case 3: Registry.curPiece = new OTetromino();
			case 4: Registry.curPiece = new STetromino();
			case 5: Registry.curPiece = new TTetromino();
			case 6: Registry.curPiece = new ZTetronimo();
		}
	}
	
	public function generateNewPiece() {
		var randTet:Int;
		randTet = Std.random(7);
		Registry.cycle.push(randTet);
	}
	
	public function ChangeDirection(event:KeyboardEvent) {
		dropY = HardDropDetection();
		if (event.key == Key.Up) {
			Registry.curPiece.PotentialRotate();
			RotationHandling();
		}
		else if (event.key == Key.Down) {
			downKeyDown = true;
		}
		else if (event.key == Key.Right) {
			rightKeyDown = true;
		}
		else if (event.key == Key.Left) {
			leftKeyDown = true;
		}
		else if (event.key == Key.Shift) {
			
			if (!hold) {
				hold = true;
				if (Registry.hold == null) {
					Registry.hold = Registry.curPiece;
					NewPiece(Registry.cycle.splice(0, 1)[0]);
					generateNewPiece();
				}
				else {
					var Temp = Registry.hold;
					Registry.hold = Registry.curPiece;
					Registry.curPiece = Temp;
				}
				Registry.hold.reset();
			}
		}
		else if (event.key == Key.Space) {
			HardDrop();
		}
	}
	
	public function ReleaseChangeDirection(event:KeyboardEvent) {
		if (event.key == Key.Down) {
			downKeyDown = false;
		}
		else if (event.key == Key.Right) {
			rightKeyDown = false;
		}
		else if (event.key == Key.Left) {
			leftKeyDown = false;
		}
	}
	
	
	
	
}