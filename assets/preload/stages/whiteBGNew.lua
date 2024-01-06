
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 500;
local yy = 500;
local xx2 = 950;
local yy2 = 500;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()

    makeLuaSprite('black', 'blackBG', -600, -200);
	scaleLuaSprite('black', 2., 2.)
	addLuaSprite('black', true);
	setProperty('black.alpha', 1)
end
function onStepHit()
if curStep == 1 then
doTweenAlpha('black', 'black', 0, 18, 'linear')
end
if curStep == 1600 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
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
        setProperty('defaultCamZoom',0.9)
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

        setProperty('defaultCamZoom',1.0)
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
    if curStep >= 1 and curStep < 256 then
		setProperty('defaultCamZoom',1.9)
        xx = 700;
        yy = 500;
        xx2 = 700;
        yy2 = 500;
    end
    if curStep == 256 then
		setProperty('defaultCamZoom',0.9)
        xx = 500;
        yy = 500;
        xx2 = 950;
        yy2 = 500;
    end
    if curStep >= 928 and curStep < 960 then
		setProperty('defaultCamZoom',1.0)
        xx = 700;
        yy = 500;
        xx2 = 700;
        yy2 = 500;
    end
end