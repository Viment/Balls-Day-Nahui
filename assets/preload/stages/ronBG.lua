function onCreate()

    makeLuaSprite('black', 'blackBG', -600, -200);
	scaleLuaSprite('black', 2., 2.)
	addLuaSprite('black', true);
	setProperty('black.alpha', 1)
end

function onStepHit()
if curStep == 1 then
doTweenAlpha('black', 'black', 0, 11, 'linear')
end
if curStep == 511 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
if curStep == 639 then
doTweenAlpha('black', 'black', 0, 0.001, 'linear')
end
if curStep == 1695 then
doTweenAlpha('black', 'black', 1, 0.001, 'linear')
end
end