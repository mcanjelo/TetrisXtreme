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
					if (Registry.landed[y][x] == 1) 
					{
						var TetrisBlock = new Entity();
						this.owner.addChild((TetrisBlock));
						TetrisBlock.add(new Block(x, y));
					}
					
				}
            }
        }
		var curShape = Registry.curPiece.getShape();
		for (y in 0...curShape.length) {
			for (x in 0...curShape[y].length) {
				if (curShape[y][x] == 1) {
					var TetrisBlock = new Entity();
					this.owner.addChild((TetrisBlock));
					TetrisBlock.add(new Block(Registry.curPiece.getX() + x, Registry.curPiece.getY() + y));
				}
				
				
			}
		}
	}
	
}