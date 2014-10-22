package urgame;
import flambe.asset.AssetPack;
import flambe.Disposer;
import flambe.util.Signal0;
import tetromino.Tetromino;

/**
 * ...
 * @author Mc
 */
class Registry
{
	static public var Pack: AssetPack;
	static public var Go: Signal0;
	static public var pack: AssetPack;
	static public var _Disposer: Disposer;
	static public var landed:Array<Array<Int>>;
	static public var curPiece:Tetromino;
}