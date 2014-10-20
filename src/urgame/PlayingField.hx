package urgame;
import flambe.Component;
import flambe.Disposer;
import flambe.Entity;
import flambe.input.KeyboardEvent;
import flambe.System;
import flambe.input.Key;
import haxe.macro.Expr.Var;

/**
 * ...
 * @author Mc
 */
class PlayingField extends Component
{
	private var curPiece:Tetromino;
	
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

	}

	
	override public function onAdded() 
	{
		super.onAdded();
		this.owner.add(Registry._Disposer);
		Registry._Disposer.add(System.keyboard.down.connect(ChangeDirection));
		NewPiece();
		Registry.Go.connect(function() {
			curPiece.PotentialFall();
			LandDetection();
		});
	}
	
	public function CollisionDetection() {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (col + curPiece.getPotentialX() < 0) {
					//collision on left side of playing field
					curPiece.PotentialCollision();
				}
				if (col + curPiece.getPotentialX() >= Registry.landed[0].length) {
					//collision on right side of playing field
					curPiece.PotentialCollision();
				}
				if (Registry.landed[row + curPiece.getPotentialY()][col + curPiece.getPotentialY()] != 0) {
					//collision on object (land)
					curPiece.PotentialCollision();
				}
			}
		}
		
		curPiece.Move();
	}
	
	public function LandDetection() {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (row + curPiece.getPotentialY() >= Registry.landed.length) {
					//collision on bottom side of playing field (land)
					Land();
				}
				if (Registry.landed[row + curPiece.getPotentialY()][col + curPiece.getPotentialY()] != 0) {
					//collision on object (land)
					Land();
				}
			}
		}
		
		curPiece.Move();
	}
	
	public function RotationHandling() {
		var curShape:Array<Array<Int>> = curPiece.GetPotentialShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (col + curPiece.getPotentialX() < 0) {
					//collision on left side of playing field (dont rotate)
					curPiece.PotentialCollision();
				}
				if (col + curPiece.getPotentialX() >= Registry.landed[0].length) {
					//collision on right side of playing field (dont rotate)
					curPiece.PotentialCollision();
				}
				if (row + curPiece.getPotentialY() >= Registry.landed.length) {
					//collision on bottom side of playing field (dont rotate)
					curPiece.PotentialCollision();
				}
				if (Registry.landed[row + curPiece.getPotentialY()][col + curPiece.getPotentialY()] != 0) {
					//collision on object (dont rotate)
					curPiece.PotentialCollision();
				}
			}
		}
		
		curPiece.rotate();
	}
	
	
	public function Land() {
		var curShape:Array<Array<Int>> = curPiece.getShape();
		for (row in 0...curShape.length) {
			for (col in 0...curShape[row].length) {
				if (curShape[row][col] != 0) {
					Registry.landed[row + curPiece.getY()][col + curPiece.getX()] = curShape[row][col];
					NewPiece();
				}
			}
		}
	}
	
	public function NewPiece() {
		var randTet:Int;
		
		randTet = Std.random(7);
		switch(randTet) {
			case 0: curPiece = new ITetromino();
			case 1: curPiece = new JTetrominio();
			case 2: curPiece = new LTetromino();
			case 3: curPiece = new OTetromino();
			case 4: curPiece = new STetromino();
			case 5: curPiece = new TTetromino();
			case 6: curPiece = new ZTetronimo();
		}
	}
	
	public function ChangeDirection(event:KeyboardEvent) {
		if (event.key == Key.Up) {
			curPiece.PotentialRotate();
			RotationHandling();
		}
		else if (event.key == Key.Down) {
			curPiece.PotentialFall();
			LandDetection();
		}
		else if (event.key == Key.Right) {
			curPiece.PotentialMoveRight();
			CollisionDetection();
		}
		else if (event.key == Key.Left) {
			curPiece.PotentialMoveLeft();
			CollisionDetection();
		}
	}
	
	
	
	
}