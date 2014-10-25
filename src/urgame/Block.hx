package urgame;
import flambe.display.ImageSprite;

/**
 * ...
 * @author Mc
 */
class Block extends ImageSprite
{
	var myx: Int;
	var myy: Int;
	
	public function new(xx:Int, yy:Int, color:Int) 
	{
		if(color == 1)
		super(Registry.pack.getTexture("beige"));
		else if (color == 2)
		super(Registry.pack.getTexture("blue"));
		else if (color == 3)
		super(Registry.pack.getTexture("green"));
		else if (color == 4)
		super(Registry.pack.getTexture("yellow"));
		else if (color == 5)
		super(Registry.pack.getTexture("purple"));
		else if (color == 6)
		super(Registry.pack.getTexture("orange"));
		else if (color == 7)
		super(Registry.pack.getTexture("red"));
		else if (color == 8)
		super(Registry.pack.getTexture("cyan"));
		myx = xx;
		myy = yy;
	}
	
	override public function onAdded() 
	{
		super.onAdded();
		this.setXY(150 + 30 * myx , 194 + 30 * myy);
	}
	
}