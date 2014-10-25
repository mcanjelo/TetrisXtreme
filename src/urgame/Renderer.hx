package urgame;
import flambe.Component;
import flambe.Entity;

/**
 * ...
 * @author Mc
 */
class Renderer extends Component
{

	public function new() 
	{
		
	}
	
	override public function onUpdate(dt:Float) 
	{
		super.onUpdate(dt);
		var Child = this.owner.firstChild;
		while (Child != null)
		{
			Child.dispose();
			Child = this.owner.firstChild;
		}
		for (x in 0...10)
        {
            for (y in 0...16)
            {
				if (Registry.landed[y][x] != null)
				{
					if (Registry.landed[y][x] != 0) 
					{
						var TetrisBlock = new Entity();
						this.owner.addChild((TetrisBlock));
						TetrisBlock.add(new Block(x, y, Registry.landed[y][x]));
					}
					
				}
            }
        }
		var curShape = Registry.curPiece.getShape();
		for (y in 0...curShape.length) {
			for (x in 0...curShape[y].length) {
				if (curShape[y][x] != 0) {
					var TetrisBlock = new Entity();
					this.owner.addChild((TetrisBlock));
					TetrisBlock.add(new Block(Registry.curPiece.getX() + x, Registry.curPiece.getY() + y, curShape[y][x]));
				}
				
				
			}
		}
		var nextTetromino = new Entity();
		this.owner.addChild(nextTetromino);
		nextTetromino.add(new Next(Registry.cycle[0]));
		
		if (Registry.hold != null)
		{
			var holdTetromino = new Entity();
			this.owner.addChild(holdTetromino);
			holdTetromino.add(new Hold(Registry.hold.getTetType()));
		}
		
		var cycle1 = new Entity();
		this.owner.addChild(cycle1);
		cycle1.add(new urgame.Cycle(Registry.cycle[1], 0));
		
		
		var cycle2 = new Entity();
		this.owner.addChild(cycle2);
		cycle2.add(new urgame.Cycle(Registry.cycle[2], 1));
	}
	
}