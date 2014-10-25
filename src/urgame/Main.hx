package urgame;

import flambe.Entity;
import flambe.System;
import flambe.asset.AssetPack;
import flambe.asset.Manifest;
import flambe.display.FillSprite;
import flambe.display.ImageSprite;

class Main
{
    private static function main ()
    {
        // Wind up all platform-specific stuff
        System.init();

        // Load up the compiled pack in the assets directory named "bootstrap"
        var manifest = Manifest.fromAssets("blocks");
        var loader = System.loadAssetPack(manifest);
        loader.get(onSuccess);
    }

    private static function onSuccess (pack :AssetPack)
    {
        // Add a solid color background
        var background = new ImageSprite(pack.getTexture("playing screen"));
		background.centerAnchor();
		background.x._ = System.stage.width / 2;
		background.y._ = System.stage.height / 2;
		
		Registry.pack = pack;
		
		var PF = new PlayingField();
		System.root.addChild(new Entity().add(new Timer()).add(PF));
        System.root.addChild(new Entity().add(background).add(new Renderer()));
    }
}
