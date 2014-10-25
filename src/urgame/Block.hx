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
	
	public function new(xx:Int, yy:Int ) 
	{
		super(Registry.pack.getTexture("red"));
		myx = xx;
		myy = yy;
	}
	
	override public function onAdded() 
	{
		super.onAdded();
		this.setXY(150 + 30 * myx , 194 + 30 * myy);
	}
	
}