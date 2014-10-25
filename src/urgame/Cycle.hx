package urgame;
import flambe.display.ImageSprite;

/**
 * ...
 * @author Mc
 */
class Cycle extends ImageSprite
{
	var myPos:Int;
	
	public function new(color:Int, pos:Int) 
	{
		if(color == 0)
		super(Registry.pack.getTexture("ITetromino"));
		else if (color == 1)
		super(Registry.pack.getTexture("JTetromino"));
		else if (color == 2)
		super(Registry.pack.getTexture("LTetromino"));
		else if (color == 3)
		super(Registry.pack.getTexture("OTetromino"));
		else if (color == 4)
		super(Registry.pack.getTexture("STetromino"));
		else if (color == 5)
		super(Registry.pack.getTexture("TTetromino"));
		else if (color == 6)
		super(Registry.pack.getTexture("ZTetromino"));
		myPos = pos;
	}
	
	override public function onAdded() 
	{
		super.onAdded();
		
		this.setXY(53, 310 + this.getNaturalHeight() * myPos);
	}
	
}