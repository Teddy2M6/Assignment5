local composer = require( "composer" )

local scene = composer.newScene()

local musicTrack


local function gotoGame()
	composer.gotoScene( "game", { time=800, effect="crossFade" } )
end

function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

	local background = display.newImageRect("./background.jpg", 2048, 2000)
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local title = display.newText('Star Dodge', display.contentCenterX, display.contentCenterY - 330, native.systemFont, 150 )
	title:setFillColor( 0, 0, 0, 1 )
	title.x = display.contentCenterX
	title.y = 200

	local playButton = display.newText('Play', display.contentCenterX, display.contentCenterY - 330, native.systemFont, 100 )
	playButton:setFillColor( 0, 0, 0, 1 )
	playButton.y = 1000

	playButton:addEventListener( "tap", gotoGame )
	
	musicTrack = audio.loadStream( "./Escape_Looping.wav" )
end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
		-- Start the music!
		audio.play( musicTrack, { channel=1, loops=-1 } )
	end
end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		-- Stop the music!
		audio.stop( 1 )
	end
end

function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
	-- Dispose audio!
	audio.dispose( musicTrack )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene