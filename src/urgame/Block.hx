package urgame;
import flambe.display.FillSprite;

/**
 * ...
 * @author Mc
 */
class Block extends FillSprite
{
	var myx: Int;
	var myy: Int;
	
	public function new(xx:Int, yy:Int ) 
	{
		super(0xff0000, 0, 0);
		myx = xx;
		myy = yy;
	}
	
	override public function onAdded() 
	{
		super.onAdded();
		this.setSize(24, 24);
		this.setXY(24 * myx , 24 * myy);
	}
	
}