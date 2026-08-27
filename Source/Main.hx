package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.utils.Assets;
import haxe.Timer;

class Main extends Sprite
{
    //Hierarquia de ossos
    var torso:Sprite;
    var head:Sprite;
    var armL:Sprite;
    var armR:Sprite;
    var legL:Sprite;
    var legR:Sprite;
    var hips:Sprite;

    //State Machine simples
    var isPaused:Bool = false;
    var demoElapsed:Float = 0;

    //Controle de tempo (haxe.Timer + Delta Time)
    var fpsTimer:Timer;
    var demoLastTime:Float = -1;

    //Botão
    var buttonSprite:Sprite;//faz o botão ser clicavel
    var buttonShape:Shape;//forma visual do botão
    var buttonLabel:TextField;//texto do botão

    public function new()
    {
        super();
        loadImagens();
    }

    private function loadImagens():Void
    {
        //Carrega as partes salvas separadamente da pasta assets/character/
        var torsoData:BitmapData = Assets.getBitmapData("assets/character/torso.png");
        var headData:BitmapData  = Assets.getBitmapData("assets/character/head.png");
        var armLData:BitmapData  = Assets.getBitmapData("assets/character/arm_l.png");
        var armRData:BitmapData  = Assets.getBitmapData("assets/character/arm_r.png");
        var legLData:BitmapData  = Assets.getBitmapData("assets/character/leg_l.png");
        var legRData:BitmapData  = Assets.getBitmapData("assets/character/leg_r.png");

        //Criação dos Sprites com pivôs nas articulações
        torso = createBone(torsoData, -torsoData.width / 2, -torsoData.height);
        head  = createBone(headData,  -headData.width / 2,  -headData.height);
        armL  = createBone(armLData,  -armLData.width / 2,  0);
        armR  = createBone(armRData,  -armRData.width / 2,  0);
        legL  = createBone(legLData,  -legLData.width / 2,  0);
        legR  = createBone(legRData,  -legRData.width / 2,  0);
        
        //Montagem da hierarquia
        addChild(torso);
        addChild(legL);
        addChild(legR);

        hips = new Sprite();
        addChild(hips);

        //Adciona filhos ao hips e ao torso
		torso.addChild(armL);
        torso.addChild(armR);
        hips.addChild(legL);
        hips.addChild(legR);
        hips.addChild(torso);
        torso.addChild(head);
        
		
        //Posicionamento na tela
        var centerX = 1200 / 2;
        var centerY = 700 / 2 + 100;

        //Posição global do hips na tela
        hips.x = centerX;
        hips.y = centerY;

        //Posições locais dos membros
        head.x = 0;
        head.y = torsoData.height - 480;

        armL.x = torsoData.width - 400;
        armL.y = torsoData.height - 480;

        armR.x = torsoData.width - 80;
        armR.y = torsoData.height - 480;

        legL.x = -40;
        legL.y = -10; 
        legR.x = 40;
        legR.y = -10;
        torso.x = 0;
        torso.y = 0;

        //Chama a função para criar a interface
        createUI();

        //Loop com DeltaTime
        fpsTimer = new Timer(16); // 16 frametime representa 60 FPS
        fpsTimer.run = onDemoTick;
    }

    private function createBone(data:BitmapData, offsetX:Float, offsetY:Float):Sprite
    {
        var bone = new Sprite();
        var bmp = new Bitmap(data);
        bmp.x = offsetX;
        bmp.y = offsetY;
        bone.addChild(bmp);
        return bone;
    }

    //UI
	//Uso Sprite porque ele pode receber clique do mouse, Shape altera apenas a forma
    private function createUI():Void
    {
    buttonSprite = new Sprite();
    buttonSprite.x = 30;
    buttonSprite.y = 30;
    buttonSprite.buttonMode = true;

    //Shape só cuida do desenho
    buttonShape = new Shape();
    buttonSprite.addChild(buttonShape);

    buttonLabel = new TextField();
    buttonLabel.text = "Pausar";
    buttonLabel.textColor = 0xFFFFFF;
    buttonLabel.mouseEnabled = false;
    buttonLabel.x = 10;
    buttonLabel.y = 5;

    buttonSprite.addChild(buttonLabel);
    updateButton(0x444444);

    //O clique é escutado no Sprite (container)
    buttonSprite.addEventListener(MouseEvent.CLICK, onToggleClick);
    addChild(buttonSprite);
    }

    private function updateButton(color:Int):Void
    {
        buttonShape.graphics.clear();
        buttonShape.graphics.beginFill(color);
        buttonShape.graphics.drawRoundRect(0, 0, 100, 30, 8, 8);
        buttonShape.graphics.endFill();
    }

    private function onToggleClick(e:MouseEvent):Void
    {
        isPaused = !isPaused;

        if (isPaused)
        {
            buttonLabel.text = "Play";
            updateButton(0x228B22);
        }
        else
        {
            buttonLabel.text = "Pausar";
            updateButton(0x444444);
        }
    }

    //Animação com loop
    private function onDemoTick():Void
    {
       var now = Timer.stamp();
    if (demoLastTime < 0)
        demoLastTime = now;
    var dt = now - demoLastTime;
    demoLastTime = now;

    if (!isPaused)
    {
        demoElapsed += dt * 2.5;
    }

    var sineWave = Math.sin(demoElapsed);

    //Movimentação do Tronco 
    torso.scaleX = 1.0 + (sineWave * 0.02);
    torso.scaleY = 1.0 + (sineWave * 0.04);
    torso.rotation = sineWave * 1.5;

    //Movimentação local dos filhos
    head.rotation = Math.sin(demoElapsed * 0.8) * 2;
    armL.rotation = sineWave * 12;
    armR.rotation = -sineWave * 12;
    legL.rotation = -sineWave * 5;
    legR.rotation = sineWave * 2;
    }
}