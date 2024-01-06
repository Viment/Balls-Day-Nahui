
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 800;
local yy = 550;
local xx2 = 1300;
local yy2 = 500;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()

    makeLuaSprite('gayingWithLine', 'shittersBGNew/line');
	scaleLuaSprite('gayingWithLine', 1., 1.)
	addLuaSprite('gayingWithLine', true);
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
        setProperty('defaultCamZoom',0.95)
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
    if curBeat >= 63.9 and curBeat < 128 then
		setProperty('defaultCamZoom',0.7)
        xx = 950;
        yy = 550;
        xx2 = 950;
        yy2 = 550;
    end
    if curBeat >= 129 and curBeat < 182 then
		setProperty('defaultCamZoom',1.0)
        xx = 800;
        yy = 550;
        xx2 = 1300;
        yy2 = 500;
    end
    if curBeat >= 183 and curBeat < 187 then
        setProperty('defaultCamZoom',0.9)
	end
    if curBeat >= 188 and curBeat < 191 then
        setProperty('defaultCamZoom',1.1)
    end
    if curBeat >= 192 and curBeat < 255 then
		setProperty('defaultCamZoom',0.7)
        xx = 950;
        yy = 550;
        xx2 = 950;
        yy2 = 550;
    end
    if curBeat >= 256 and curBeat < 319 then
		setProperty('defaultCamZoom',1.0)
        xx = 800;
        yy = 550;
        xx2 = 1300;
        yy2 = 500;
    end
    if curBeat >= 320 and curBeat < 352 then
		setProperty('defaultCamZoom',0.7)
        xx = 950;
        yy = 550;
        xx2 = 950;
        yy2 = 550;
    end
end