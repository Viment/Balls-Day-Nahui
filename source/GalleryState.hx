package;

import flixel.*;
import flixel.FlxSprite;
import flixel.text.FlxText;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import flixel.math.FlxMath;
import flixel.addons.transition.FlxTransitionableState;
import sys.FileSystem;
import flixel.addons.ui.FlxInputText;
import flixel.addons.display.FlxBackdrop;
import lime.system.System;

// Programmed/made by SquidBowl
// Optimized by Swords352
// Helped port to Psych Engine by bimagamongMOP
// Default galleryMusic theme by 

// READ ME
    // This gallery has a few things you might need to know, based on if you want to use all its features or not.
    // It has a customizable music theme. Basically, where you can set background music of the gallery. If you want to turn this off, "//" out the line at the backspace function, and also the one that plays music.
    // The Gallery also has the function to open links when you press enter to take you to a preferred link. To disable this, you can remove it, but it might be a little tricky. Remove the code and fix the errors that might happen.
    // When you use the gallery, to credit me, (and the other people that helped) add a special thanks or a link on the gamebanana page linking back to the download of the gallery. 
    // Thank you for downloading! If you have any issues feel free to private message me on gamebanana @ https://gamebanana.com/members/2041479 (Or comment on the post but I prefer you DM me)
    // No I will not add you on Discord.
// End of read me    

class GalleryState extends MusicBeatState
{
    var itemGroup:FlxTypedGroup<GalleryImage>;
    var imagePaths:Array<String>;
    var imageDescriptions:Array<String>;
    var imageTitle:Array<String>;
    var linkOpen:Array<String>;
    var currentIndex:Int = 0;
    var descriptionText:FlxText;
    var titleText:FlxText;
    var background:FlxSprite;
    var imageSprite:FlxSprite;
    var bg:FlxSprite;
    var backspace:FlxSprite;
    var intendedColor:Int;
	var colorTween:FlxTween;
    var imagePath:String = "gallery/";
    var openLink:String;

    override public function create():Void
    {
        // idk i didnt rlly experiment w this shit if anything bugs out here just remove the 2 lines
        Paths.clearStoredMemory();
		Paths.clearUnusedMemory();
        
        // Place your preferred galleryMusic file in the same folder freakyMenu is in.
        // Comment out the line if you don't want the music to change. If not the menu might be silent.
        FlxG.sound.playMusic(Paths.music("masturbist"));

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

        // Set up background
        background = new FlxSprite(10, 50).loadGraphic(Paths.image("gallery/ui/void"));
        background.setGraphicSize(Std.int(background.width * 1));
        background.screenCenter();
        add(background);

        //Setup the bars
        background = new FlxSprite(10, 50).loadGraphic(Paths.image("gallery/ui/bars"));
        background.setGraphicSize(Std.int(background.width * 1));
        background.screenCenter();
        add(background);

        // Set up image paths and descriptions
        imagePaths = ["keoki", "Artem228", "autism", "stazzzkorablev", "hetchotesh", "vahui", "cringy art from Artem with grammatical error", "Hitesh' sketches for V3", "Unused SHiZo sprite for V3", "1st rist concept", "old Viment's scrapped idle sprites", "unused Viment's poses sketches", "shitty Artem's version of shitters bg", "BoyKisserTesh"];
        imageDescriptions = ["This cool dude made gallery", "This is cool old sprite for Artem", "i had it, lel", "::::00000 stASS", "Hitesh's unused Freeplay portrait", ":mindblowing:", "bruh, cringy art from Artem with grammatical error", " ", "too shitty", "Artem can't drawing", "bruuuuuh", "sus", "my eyes are getting HURT!!!", "boykesiir"];
        imageTitle = ["SquidBowl", "YARIK", "POV me", "!!!STAS KORABLEV WATCH FULL WITHOUT SMS OR REGISTRATION!!!", "Shizotesh", "NapoleRonnie", "Artem has skill issue", "Hitesh' sketches for V3", "Unused SHiZo sprite for V3", "1st concept of Viment(Artem)", "Scrapped idles for Viment's sprite", "unused Viment's pose-sketches", "shitty Artem's version of shitters bg", "TeshedKisser"];

        itemGroup = new FlxTypedGroup<GalleryImage>();

        for (id => i in imagePaths) {
            var newItem = new GalleryImage();
            newItem.loadGraphic(Paths.image(imagePath + i));
            newItem.ID = id;
            itemGroup.add(newItem);
        }
        
        add(itemGroup);

        descriptionText = new FlxText(50, -100, FlxG.width - 100, imageDescriptions[currentIndex]);
        descriptionText.setFormat(null, 25, 0xffffff, "center");
        descriptionText.screenCenter();
        descriptionText.y += 250;
        descriptionText.setFormat(Paths.font("vcr.ttf"), 32);
        add(descriptionText);

        titleText = new FlxText(50, 50, FlxG.width - 100, imageTitle[currentIndex]);
        titleText.screenCenter(X);
        titleText.setFormat(null, 40, 0xffffff, "center");
        titleText.setFormat(Paths.font("vcr.ttf"), 32);
        add(titleText);

        backspace = new FlxSprite(-0, 560);
        backspace.frames = Paths.getSparrowAtlas('gallery/ui/backspace');
        backspace.animation.addByPrefix('backspace to exit white0', "backspace to exit white0", 24);
        backspace.animation.play('backspace to exit white0');
        backspace.updateHitbox();
        add(backspace);
        
        persistentUpdate = true;
        changeSelection();
        super.create();
        CustomFadeTransition.nextCamera = FlxG.cameras.list[FlxG.cameras.list.length - 1];
    }
    

    var allowInputs:Bool = true;
    
override public function update(elapsed:Float):Void
{
    super.update(elapsed);

    // Handle left and right arrow keys to scroll through image
    if ((controls.UI_LEFT_P || controls.UI_RIGHT_P) && allowInputs) {
        changeSelection(controls.UI_LEFT_P ? -1 : 1);
        FlxG.sound.play(Paths.sound("scrollMenu"));
    }
    
    if (controls.BACK && allowInputs)
    {
        allowInputs = false;
        FlxG.sound.play(Paths.sound('cancelMenu'));
        MusicBeatState.switchState(new MainMenuState());
        backspace.animation.addByPrefix('backspace to exit', "backspace to exit", 12);
        backspace.animation.play('backspace to exit');
        FlxG.sound.playMusic(Paths.music("menu")); // Comment this out if not using a custom galleryMenu music theme
    }
    
    // Handle opening the link when the desired input (e.g., ENTER) is detected
    if (controls.ACCEPT && allowInputs)
    {
        CoolUtil.browserLoad(openLink);

        // After opening the link, you can handle any other actions or updates as needed.
        // For example, you may want to play a sound, show a message, or perform other logic.
    }
}

    
    private function changeSelection(i = 0)
    {
    currentIndex = FlxMath.wrap(currentIndex + i, 0, imageTitle.length - 1);

    descriptionText.text = imageDescriptions[currentIndex];

    titleText.text = imageTitle[currentIndex]; 

        // HERE IS THE GALLERY LINKS!! Change the links to whatever you want, and it's based on which image is currenty highlighted.
        // Like for example, the cat image opens you to my youtube, while the gamebanana screenshot opens you to again, my YouTube page. Easy as that.
            var linkOpen:Array<String> = [
            "https://www.youtube.com/channel/UCcmSo3U6ob1C04bPz2wSNtQ",  // Image 1 Link
            // Add other links here for each image
        ];

    openLink = linkOpen[currentIndex];  // Update the link based on the current index

    var change = 0;
    for (item in itemGroup) {
        item.posX = change++ - currentIndex;
        item.alpha = item.ID == currentIndex ? 1 : 0.6;
        }
    }
}

class GalleryImage extends FlxSprite {
    public var posX:Float = 0;
    
    override function update(elapsed:Float) {
        super.update(elapsed);
        x = FlxMath.lerp(x, (FlxG.width - width) / 2 + posX * 780, CoolUtil.boundTo(elapsed * 3, 0, 1));
    }
}