package urgame;
import flambe.Component;
import flambe.util.Signal0;

class Timer extends Component
{
	private var Time:Float;

	
	public function new() {
		Registry.Go = new Signal0();
	}
	
	override public function onAdded() 
	{
		super.onAdded();
		Time = 0;
	}
	
	override public function onUpdate(dt:Float) 
	{
		super.onUpdate(dt);
		Time+= dt;
		if (Time > 0.1)
		{
			Registry.Go.emit();
			Time = 0;
		}
		
	}
	
}
