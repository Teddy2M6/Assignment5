local composer = require( "composer" )

local scene = composer.newScene()

local scrollSpeed = 12

local explosionSound
local musicTrack

musicTrack = audio.loadSound( "./Midnight-Crawlers_Looping.wav" )
audio.play( musicTrack )

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 25 )

local playerBullets = {}

local backgroundImage = display.newImageRect("./background.jpg", 2048, 2000)
backgroundImage.x = display.contentCenterX
backgroundImage.y = display.contentCenterY
backgroundImage.ID = "background image"

local jumpButton = display.newImage( "./jumpButton.png" )
jumpButton.x = display.contentWidth - 80
jumpButton.y = display.contentHeight - 80
jumpButton.id = "jump button"
jumpButton.alpha = 0.5

local theCharacter = display.newImage( "./ninja.png" )
theCharacter.x = display.contentCenterX + 290
theCharacter.y = display.contentCenterY
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )
theCharacter.isFixedRotation = true

local star = display.newImageRect("./star.png", 193, 210)
star.x = -80
star.y = display.contentHeight - 1800
star.ID = "star"
physics.addBody( star, "static", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local star2 = display.newImageRect("./star.png", 193, 210)
star2.x = -2000
star2.y = display.contentHeight - 1100
star2.ID = "star2"
physics.addBody( star2, "static", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local star3 = display.newImageRect("./star.png", 193, 210)
star3.x = -500
star3.y = display.contentHeight - 430
star3.ID = "star3"
physics.addBody( star3, "static", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local star4 = display.newImageRect("./star.png", 193, 210)
star4.x = -1200
star4.y = display.contentHeight - 630
star4.ID = "star4"
physics.addBody( star4, "static", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local star5 = display.newImageRect("./star.png", 193, 210)
star5.x = -800
star5.y = display.contentHeight - 800
star5.ID = "star5"
physics.addBody( star5, "static", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local star6 = display.newImageRect("./star.png", 193, 210)
star6.x = -1800
star6.y = display.contentHeight - 1600
star6.ID = "star6"
physics.addBody( star6, "static", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local function MoveImage(event)
	star.x = star.x + scrollSpeed
end

local function MoveImage2(event)
	star2.x = star2.x + scrollSpeed
end

local function MoveImage3(event)
	star3.x = star3.x + scrollSpeed
end

local function MoveImage4(event)
	star4.x = star4.x + scrollSpeed
end

local function MoveImage5(event)
	star5.x = star5.x + scrollSpeed
end

local function MoveImage6(event)
	star6.x = star6.x + scrollSpeed
end

local function characterCollision( self, event )
 
    if ( event.phase == "began" ) then
    	local gameover = display.newText('Game Over', display.contentCenterX, display.contentCenterY - 330, native.systemFont, 100 )
    	gameover:setFillColor( 0, 0, 0, 1 )
		
		explosionSound = audio.loadSound( "./explosion.wav" )
		audio.play( explosionSound )

	elseif ( event.phase == "ended" ) then
    	local gameover = display.newText('Game Over', display.contentCenterX, display.contentCenterY - 330, native.systemFont, 100 )
    	gameover:setFillColor( 0, 0, 0, 1 )

    	explosionSound = audio.loadSound( "./explosion.wav" )
		audio.play( explosionSound )
	end
end

function jumpButton:touch( event )
    if ( event.phase == "ended" ) then
        theCharacter:setLinearVelocity( 0, -550 )
    end

    return true
end

function checkCharacterPosition( event )
    if theCharacter.y > display.contentHeight + 500 then
        theCharacter.x = display.contentCenterX + 290
        theCharacter.y = display.contentCenterY
    end
end

Runtime:addEventListener("enterFrame", MoveImage)
Runtime:addEventListener("enterFrame", MoveImage2)
Runtime:addEventListener("enterFrame", MoveImage3)
Runtime:addEventListener("enterFrame", MoveImage4)
Runtime:addEventListener("enterFrame", MoveImage5)
Runtime:addEventListener("enterFrame", MoveImage6)

jumpButton:addEventListener( "touch", jumpButton )
Runtime:addEventListener( "enterFrame", checkCharacterPosition )

theCharacter.collision = characterCollision
theCharacter:addEventListener( "collision" )

return scene