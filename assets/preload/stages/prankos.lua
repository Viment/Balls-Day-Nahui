function onCreate()

	makeLuaSprite('black', 'blackBG', -600, -200);
	scaleLuaSprite('black', 2., 2.)
	addLuaSprite('black', true);
	setProperty('black.alpha', 0)
end
function onCreatePost()
    setProperty('dad.alpha', 0);
end

function onStepHit()
if curStep == 127 then
setProperty('dad.alpha', 1);
end
if curStep == 891 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
end