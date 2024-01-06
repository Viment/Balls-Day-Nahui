
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 500;
local yy = 400;
local xx2 = 500;
local yy2 = 400;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()

	makeLuaSprite('gleb', 'suicideniggers/gleb', -1000, -500);
	scaleLuaSprite('gleb', 1., 1.)
	addLuaSprite('gleb', false);
	setProperty('gleb.alpha', 1)

	makeLuaSprite('mcnutt', 'suicideniggers/mcnutt', -600, -200);
	scaleLuaSprite('mcnutt', 1., 1.)
	addLuaSprite('mcnutt', false);
	setProperty('mcnutt.alpha', 0)

	makeLuaSprite('r9k', 'suicideniggers/r9k', -500, -400);
	scaleLuaSprite('r9k', 1., 1.)
	addLuaSprite('r9k', false);
	setProperty('r9k.alpha', 0)

    makeLuaSprite('shuaibyRoom', 'suicideniggers/shuaiby_room', -1000, -500);
	scaleLuaSprite('shuaibyRoom', 1., 1.)
	addLuaSprite('shuaibyRoom', false);
	setProperty('shuaibyRoom.alpha', 0)

	makeLuaSprite('buddbg', 'suicideniggers/background', -600, -200);
	scaleLuaSprite('buddbg', 1., 1.)
	addLuaSprite('buddbg', false);
	setProperty('buddbg.alpha', 0)

	makeLuaSprite('rororoom', 'suicideniggers/rororoom', -600, -300);
	scaleLuaSprite('rororoom', 1., 1.)
	addLuaSprite('rororoom', false);
	setProperty('rororoom.alpha', 0)

	makeLuaSprite('black', 'blackBG', -600, -200);
	scaleLuaSprite('black', 2., 2.)
	addLuaSprite('black', true);
	setProperty('black.alpha', 0)

	makeLuaSprite('ded', 'suicideniggers/sussyTablz', -600, -300);
    scaleLuaSprite('ded', 0.6, 0.6)
	addLuaSprite('ded', true);
	setProperty('ded.alpha', 0)
end
function onCreatePost()
    setProperty('boyfriend.alpha', 0);
end

function onStepHit()
if curStep == 1229 then
doTweenAlpha('mcnutt', 'mcnutt', 1, 1, 'linear')
doTweenAlpha('gleb', 'gleb', 0, 0.1, 'linear')
end
if curStep == 2304 then
doTweenAlpha('black', 'black', 1, 1, 'linear')
end
if curStep == 2352 then
doTweenAlpha('r9k', 'r9k', 1, 1, 'linear')
doTweenAlpha('mcnutt', 'mcnutt', 0, 0.1, 'linear')
doTweenAlpha('black', 'black', 0, 0.1, 'linear')
setProperty('boyfriend.alpha', 1);
end
if curStep == 2864 then
doTweenAlpha('shuaibyRoom', 'shuaibyRoom', 1, 0.001, 'linear')
doTweenAlpha('r9k', 'r9k', 0, 0.1, 'linear')
setProperty('boyfriend.alpha', 0);
end
if curStep == 3056 then
doTweenAlpha('black', 'black', 1, 1, 'linear')
end
if curStep == 3104 then
doTweenAlpha('buddbg', 'buddbg', 1, 1, 'linear')
doTweenAlpha('shuaibyRoom', 'shuaibyRoom', 0, 0.1, 'linear')
doTweenAlpha('black', 'black', 0, 0.1, 'linear')
end
if curStep == 3648 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
if curStep == 4032 then
doTweenAlpha('rororoom', 'rororoom', 1, 1, 'linear')
doTweenAlpha('buddbg', 'buddbg', 0, 0.1, 'linear')
doTweenAlpha('black', 'black', 0, 0.1, 'linear')
setProperty('boyfriend.alpha', 1);
end
if curStep == 4544 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
if curStep == 4864 then
doTweenAlpha('gleb', 'gleb', 1, 1, 'linear')
doTweenAlpha('rororoom', 'rororoom', 0, 0.1, 'linear')
doTweenAlpha('black', 'black', 0, 0.1, 'linear')
setProperty('boyfriend.alpha', 0);
end
if curStep == 4992 then
doTweenAlpha('rororoom', 'rororoom', 1, 1, 'linear')
doTweenAlpha('gleb', 'gleb', 0, 0.1, 'linear')
setProperty('boyfriend.alpha', 1);
end
if curStep == 5120 then
doTweenAlpha('r9k', 'r9k', 1, 1, 'linear')
doTweenAlpha('rororoom', 'rororoom', 0, 0.1, 'linear')
end
if curStep == 5248 then
doTweenAlpha('mcnutt', 'mcnutt', 1, 1, 'linear')
doTweenAlpha('r9k', 'r9k', 0, 0.1, 'linear')
setProperty('boyfriend.alpha', 0);
end
if curStep == 5376 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
--if curStep == 5440 then
--doTweenAlpha('ded', 'ded', 1, 2, 'linear')
--end
end

function onUpdate()
    if del > 0 then
    del = del - 1
end
if del2 > 0 then
    del2 = del2 - 1
end
if followchars == true then
    if mustHitSection == false then
        setProperty('defaultCamZoom',1.0)
        if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('gf.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('gf.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('gf.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' or getProperty('gf.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' or getProperty('gf.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP-alt' or getProperty('gf.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' or getProperty('gf.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
    else

        setProperty('defaultCamZoom',0.9)
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
    end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    if curBeat == 588 then
		setProperty('defaultCamZoom',0.8)
        xx = 500;
        yy = 400;
        setProperty('defaultCamZoom',0.8)
        xx2 = 750;
        yy2 = 400;  
	end
    if curBeat == 776 then
		setProperty('defaultCamZoom',1.0)
        xx = 500;
        yy = 400;
        setProperty('defaultCamZoom',0.9)
        xx2 = 500;
        yy2 = 400;  
	end
    if curBeat == 1008 then
		setProperty('defaultCamZoom',0.8)
        xx = 500;
        yy = 400;
        setProperty('defaultCamZoom',0.8)
        xx2 = 750;
        yy2 = 400;  
	end
    if curBeat == 1216 then
		setProperty('defaultCamZoom',1.0)
        xx = 500;
        yy = 400;
        setProperty('defaultCamZoom',0.9)
        xx2 = 500;
        yy2 = 400;  
	end
    if curBeat == 1248 then
		setProperty('defaultCamZoom',0.8)
        xx = 500;
        yy = 400;
        setProperty('defaultCamZoom',0.8)
        xx2 = 750;
        yy2 = 400;  
	end
    if curBeat == 1312 then
		setProperty('defaultCamZoom',1.0)
        xx = 500;
        yy = 400;
        setProperty('defaultCamZoom',0.9)
        xx2 = 500;
        yy2 = 400;  
	end
end