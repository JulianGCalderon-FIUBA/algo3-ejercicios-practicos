!classDefinition: #MarsRoverTest category: 'Mars Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverFacingNorth marsRoverFacingSouth marsRoverFacingEast marsRoverFacingWest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:19'!
east
	^#east! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:05'!
north
	^#north! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'JGC 6/1/2022 13:22:11'!
setUp

	marsRoverFacingNorth := MarsRover deployInXCoordinate: 0 YCoordinate: 0 facing: self north. 
	marsRoverFacingSouth := MarsRover deployInXCoordinate: 0 YCoordinate: 0 facing: self south.
	marsRoverFacingEast := MarsRover deployInXCoordinate: 0 YCoordinate: 0 facing: self east.
	marsRoverFacingWest := MarsRover deployInXCoordinate: 0 YCoordinate: 0 facing: self west.
		
	" Mensajes como isFacingNorth, o isFacingEast permiten no depender de simbolos para direcciones cardinales afuera del Mars Rover "! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:13'!
south
	^#south! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:24'!
west
	^#west! !


!MarsRoverTest methodsFor: 'asserts' stamp: 'sm 6/1/2022 14:23:07'!
assertCardinalDirection: aCardinalDirection equalsMarsRoverDirection: aMarsRover afterExecutingCommand: aCommand
	
	aMarsRover executeCommands: aCommand.
	
	self assert: aCardinalDirection equals: aMarsRover direction.! !

!MarsRoverTest methodsFor: 'asserts' stamp: 'JGC 6/1/2022 14:09:09'!
assertRoverReturnsErrorIfRecievesInvalidCommand: anInvalidCommand

	^ self  should: [ marsRoverFacingNorth executeCommands: anInvalidCommand ]
		raiseWithErrorDescription: MarsRover invalidCommandReceivedErrorDescription.! !

!MarsRoverTest methodsFor: 'asserts' stamp: 'JGC 6/1/2022 13:23:52'!
assertXCoordinate: anXCoordinate YCoordinate: aYCoordinate equalsMarsRoverCoordinates: aMarsRover

	self assert: anXCoordinate equals: aMarsRover XCoordinate. 
	self assert: aYCoordinate equals: aMarsRover YCoordinate. ! !

!MarsRoverTest methodsFor: 'asserts' stamp: 'JGC 6/1/2022 14:02:37'!
assertXCoordinate: anXCoordinate YCoordinate: aYCoordinate equalsMarsRoverCoordinates: aMarsRover afterExecutingCommand: aCommand
	
	aMarsRover executeCommands: aCommand.
	
	self assertXCoordinate: anXCoordinate YCoordinate: aYCoordinate equalsMarsRoverCoordinates: aMarsRover.! !

!MarsRoverTest methodsFor: 'asserts' stamp: 'JGC 6/1/2022 13:26:44'!
should: aBlockThatShouldFail raiseWithErrorDescription: anErrorDescription

self should: aBlockThatShouldFail
	raise: Error
	withExceptionDo: [:anError | 
		self assert: anErrorDescription equals: anError messageText 
		].! !


!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'JGC 6/1/2022 13:40:34'!
test01RoverIsDeployedInInitialPosition
	
	self assertXCoordinate: 0 YCoordinate: 0 equalsMarsRoverCoordinates: marsRoverFacingNorth.! !

!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'JGC 6/1/2022 13:40:38'!
test02RoverIsDeployedFacingInitialDirection

	self assert: self north equals: marsRoverFacingNorth direction. ! !

!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'JGC 6/1/2022 13:40:43'!
test03CannotDeployRoverWithInvalidCoordinates

	self  should: [MarsRover deployInXCoordinate: 'pan lactal' YCoordinate: 'pan integral' facing: self north] 
		raiseWithErrorDescription: MarsRover invalidCoordinateErrorDescription.! !

!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'JGC 6/1/2022 13:40:46'!
test04CannotDeployRoverWithInvalidCardinalDirection
	
	self  should: [MarsRover deployInXCoordinate: 0 YCoordinate: 0 facing: 'pan de centeno'] 
		raiseWithErrorDescription: MarsRover invalidCardinalDirectionErrorDescription.! !


!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'JGC 6/1/2022 14:03:34'!
test05WhenNorthFacingRoverReceivesBackwardsCommandItMovesSouth
	
	| rover |
	
	rover := marsRoverFacingNorth. 
	
	self assertXCoordinate: 0 YCoordinate: -1 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'b'.! !

!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'JGC 6/1/2022 14:03:31'!
test06WhenNorthFacingRoverReceivesForwardCommandItMovesNorth
	
	| rover |
	
	rover := marsRoverFacingNorth.
	
	self assertXCoordinate: 0 YCoordinate: 1 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'f'.! !

!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'sm 6/1/2022 14:23:29'!
test07WhenNorthFacingRoverReceivesLeftCommandItRotatesWest
	
	| rover |
	
	rover := marsRoverFacingNorth.

	self assertCardinalDirection: self west equalsMarsRoverDirection: rover afterExecutingCommand: 'l'.! !

!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'sm 6/1/2022 14:23:47'!
test08WhenNorthFacingRoverReceivesRightCommandItRotatesEast
	
	| rover |
	
	rover := marsRoverFacingNorth.

	self assertCardinalDirection: self east equalsMarsRoverDirection: rover afterExecutingCommand: 'r'.! !


!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'JGC 6/1/2022 14:04:00'!
test09WhenSouthFacingRoverReceivesBackwardsCommandItMovesNorth

	| rover |
	
	rover := marsRoverFacingSouth.
	
	self assertXCoordinate: 0 YCoordinate: 1 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'b'.! !

!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'JGC 6/1/2022 14:04:13'!
test10WhenSouthFacingRoverReceivesForwardCommandItMovesSouth

	| rover |
	
	rover := marsRoverFacingSouth.
	
	self assertXCoordinate: 0 YCoordinate: -1 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'f'.! !

!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'sm 6/1/2022 14:24:13'!
test11WhenSouthFacingRoverReceivesLeftCommandItMovesEast

	| rover |
	
	rover := marsRoverFacingSouth.
	
	self assertCardinalDirection: self east equalsMarsRoverDirection: rover afterExecutingCommand: 'l'.! !

!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'sm 6/1/2022 14:24:20'!
test12WhenSouthFacingRoverReceivesRightCommandItMovesWest

	| rover |
	
	rover := marsRoverFacingSouth.
	
	self assertCardinalDirection: self west equalsMarsRoverDirection: rover afterExecutingCommand: 'r'.! !


!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'JGC 6/1/2022 14:05:34'!
test13WhenEastFacingRoverReceivesBackwardsCommandItMovesWest

	| rover |
	
	rover := marsRoverFacingEast.
	
	self assertXCoordinate: -1 YCoordinate: 0 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'b'.! !

!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'JGC 6/1/2022 14:05:52'!
test14WhenEastFacingRoverReceivesForwardCommandItMovesEast

	| rover |
	
	rover := marsRoverFacingEast.
	
	self assertXCoordinate: 1 YCoordinate: 0 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'f'.! !

!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'sm 6/1/2022 14:24:28'!
test15WhenEastFacingRoverReceivesLeftCommandItRotatesNorth

	| rover |
	
	rover := marsRoverFacingEast.
	
	self assertCardinalDirection: self north equalsMarsRoverDirection: rover afterExecutingCommand: 'l'.! !

!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'sm 6/1/2022 14:24:38'!
test16WhenEastFacingRoverReceivesRightCommandItRotatesSouth

	| rover |
	
	rover := marsRoverFacingEast.
	
	self assertCardinalDirection: self south equalsMarsRoverDirection: rover afterExecutingCommand: 'r'.! !


!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'JGC 6/1/2022 14:06:05'!
test17WhenWestFacingRoverReceivesBackwardsCommandItMovesEast

	| rover |
	
	rover := marsRoverFacingWest.
	
	self assertXCoordinate: 1 YCoordinate: 0 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'b'.! !

!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'JGC 6/1/2022 14:06:20'!
test18WhenWestFacingRoverReceivesForwardCommandItMovesWest

	| rover |
	
	rover := marsRoverFacingWest.
	
	self assertXCoordinate: -1 YCoordinate: 0 equalsMarsRoverCoordinates: rover afterExecutingCommand: 'f'.! !

!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'sm 6/1/2022 14:24:50'!
test19WhenWestFacingRoverReceivesLeftCommandItRotatesSouth

	| rover |
	
	rover := marsRoverFacingWest.
	
	self assertCardinalDirection: self south equalsMarsRoverDirection: rover afterExecutingCommand: 'l'.! !

!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'sm 6/1/2022 14:25:05'!
test20WhenWestFacingRoverReceivesRightCommandItRotatesNorth

	| rover |
	
	rover := marsRoverFacingWest.
	
	self assertCardinalDirection: self north equalsMarsRoverDirection: rover afterExecutingCommand: 'r'.! !


!MarsRoverTest methodsFor: 'tests - invalid commands' stamp: 'JGC 6/1/2022 14:09:45'!
test21RoverReturnsErrorWhenItReceivesAnEmptyString

	self assertRoverReturnsErrorIfRecievesInvalidCommand: ''.
	
	
	
	! !

!MarsRoverTest methodsFor: 'tests - invalid commands' stamp: 'JGC 6/1/2022 14:09:38'!
test22RoverReturnsErrorWhenItReceivesASingleInvalidCommand
		
	self assertRoverReturnsErrorIfRecievesInvalidCommand: 'j'.
	
	
	
	! !

!MarsRoverTest methodsFor: 'tests - invalid commands' stamp: 'JGC 6/1/2022 14:09:21'!
test23RoverReturnsErrorWhenItDoesNotReceiveAString
	
	self assertRoverReturnsErrorIfRecievesInvalidCommand: #VeintiochoPanesDeAvena.
	
	
	
	! !


!MarsRoverTest methodsFor: 'tests - multiple commands' stamp: 'JGC 6/1/2022 13:53:52'!
test24RoverExecutesAllCommandsWhenItReceivesMultipleValidCommands

	| rover |
	
	rover := marsRoverFacingSouth.
	
	rover executeCommands: 'ffl'.
	
	self assertXCoordinate: 0 YCoordinate: -2 equalsMarsRoverCoordinates: rover.
	self assert: self east equals: rover direction.! !

!MarsRoverTest methodsFor: 'tests - multiple commands' stamp: 'JGC 6/1/2022 14:09:56'!
test25RoverExecutesAllCommandsUntilInvalidWhenItReceivesAStringWithMultipleValidCommandsAndAnInvalidOne

	| rover |
	
	rover := marsRoverFacingSouth.
	
	self  should: [rover executeCommands: 'fflrbfffgr']
		raiseWithErrorDescription: MarsRover invalidCommandReceivedErrorDescription.
	
	self assertXCoordinate: 0 YCoordinate: -4 equalsMarsRoverCoordinates: rover.
	self assert: self south equals: rover direction.
	! !


!classDefinition: #Command category: 'Mars Rover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Command methodsFor: 'execution' stamp: 'sm 5/29/2022 16:54:00'!
executeAs: aMarsRover 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'Mars Rover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 17:19:30'!
isBoundedTo: aCharacter

	self subclassResponsibility.! !


!classDefinition: #CommandBackwards category: 'Mars Rover'!
Command subclass: #CommandBackwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!CommandBackwards methodsFor: 'execution' stamp: 'sm 5/29/2022 16:54:32'!
executeAs: aMarsRover

	aMarsRover executeBackwardsCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandBackwards class' category: 'Mars Rover'!
CommandBackwards class
	instanceVariableNames: ''!

!CommandBackwards class methodsFor: 'as yet unclassified' stamp: 'JGC 6/1/2022 00:02:50'!
isBoundedTo: aCharacter

	^ $b = aCharacter.! !


!classDefinition: #CommandForward category: 'Mars Rover'!
Command subclass: #CommandForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!CommandForward methodsFor: 'execution' stamp: 'sm 5/29/2022 16:54:45'!
executeAs: aMarsRover

	aMarsRover executeForwardCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandForward class' category: 'Mars Rover'!
CommandForward class
	instanceVariableNames: ''!

!CommandForward class methodsFor: 'as yet unclassified' stamp: 'JGC 6/1/2022 00:02:53'!
isBoundedTo: aCharacter

	^ $f = aCharacter.! !


!classDefinition: #CommandLeft category: 'Mars Rover'!
Command subclass: #CommandLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!CommandLeft methodsFor: 'execution' stamp: 'sm 5/29/2022 16:54:59'!
executeAs: aMarsRover

	aMarsRover executeLeftCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandLeft class' category: 'Mars Rover'!
CommandLeft class
	instanceVariableNames: ''!

!CommandLeft class methodsFor: 'as yet unclassified' stamp: 'JGC 6/1/2022 00:02:56'!
isBoundedTo: aCharacter

	^ $l = aCharacter.! !


!classDefinition: #CommandRight category: 'Mars Rover'!
Command subclass: #CommandRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!CommandRight methodsFor: 'execution' stamp: 'sm 5/29/2022 16:55:10'!
executeAs: aMarsRover

	aMarsRover executeRightCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CommandRight class' category: 'Mars Rover'!
CommandRight class
	instanceVariableNames: ''!

!CommandRight class methodsFor: 'as yet unclassified' stamp: 'JGC 6/1/2022 00:03:00'!
isBoundedTo: aCharacter

	^ $r = aCharacter.! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'accessing' stamp: 'JGC 6/1/2022 13:11:01'!
XCoordinate

	^ position x.! !

!MarsRover methodsFor: 'accessing' stamp: 'JGC 6/1/2022 13:11:04'!
YCoordinate

	^ position y.! !

!MarsRover methodsFor: 'accessing' stamp: 'JGC 6/1/2022 00:04:18'!
direction

	^ direction.! !


!MarsRover methodsFor: 'asserting' stamp: 'JGC 6/1/2022 00:06:49'!
assertCardinalDirectionIsValid: aCardinalDirection

	(self cardinalDirectionIsValid: aCardinalDirection) 
		ifFalse: [ self class error: self class invalidCardinalDirectionErrorDescription. ].! !

!MarsRover methodsFor: 'asserting' stamp: 'JGC 6/1/2022 00:09:34'!
assertStringOfCommandsIsValid: aStringOfCommands

	(self stringOfCommandsIsValid: aStringOfCommands)
		ifFalse: [ self class error: self class invalidCommandReceivedErrorDescription. ].! !

!MarsRover methodsFor: 'asserting' stamp: 'JGC 6/1/2022 13:19:48'!
assertXCoordinate: anXCoordinate andYCoordinateAreValid: aYCoordinate
	
	((self coordinateIsValid: anXCoordinate) and: [self coordinateIsValid: aYCoordinate]) 
		ifFalse: [ self class error: self class invalidCoordinateErrorDescription. ].! !

!MarsRover methodsFor: 'asserting' stamp: 'JGC 6/1/2022 12:50:40'!
cardinalDirectionIsValid: aCardinalDirection

	| validCardinalDirections |
	validCardinalDirections _ #(#north, #south, #east, #west).
	
	^ validCardinalDirections includes: aCardinalDirection.! !

!MarsRover methodsFor: 'asserting' stamp: 'JGC 6/1/2022 13:07:49'!
coordinateIsValid: aCoordinate

	^ aCoordinate isInteger.! !

!MarsRover methodsFor: 'asserting' stamp: 'JGC 6/1/2022 00:07:43'!
stringOfCommandsIsValid: aStringOfCommands

	^ aStringOfCommands isString and: [aStringOfCommands isEmpty not. ].! !


!MarsRover methodsFor: 'execution' stamp: 'JGC 6/1/2022 00:12:46'!
executeCommands: aStringOfCommands

	self assertStringOfCommandsIsValid: aStringOfCommands. 
	
	aStringOfCommands collect: [ :aCommand | self executeCommand: aCommand. ].
	! !


!MarsRover methodsFor: 'private' stamp: 'JGC 6/1/2022 13:21:37'!
correspondingState

	MarsRoverState subclasses 
		detect: [ :state | state correspondsToState: self] 
		ifFound: [ :state | ^state newWith: self]
		ifNone: [ self class error: self class marsRoverHasNoValidStateErrorDescription ].
	! !


!MarsRover methodsFor: 'execution - private' stamp: 'JGC 6/1/2022 00:17:08'!
executeBackwardsCommand
	
	self correspondingState executeBackwardsCommand.! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:23:23'!
executeCommand: aCommand

	Command subclasses
		detect: [ :subclass | subclass isBoundedTo: aCommand ]
		ifFound: [ :subclass |  subclass new executeAs: self ]
		ifNone: [ self class error: self class invalidCommandReceivedErrorDescription ].
! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:28:50'!
executeForwardCommand

	self correspondingState executeForwardCommand.! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:28:43'!
executeLeftCommand
	
	self correspondingState executeLeftCommand.! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:29:18'!
executeRightCommand
	
	self correspondingState executeRightCommand.! !


!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:39'!
moveOneUnitEast

	^ position := position + (1@0).! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:44'!
moveOneUnitNorth

	^ position := position + (0@1).! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:46'!
moveOneUnitSouth

	^ position := position + (0@-1).! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:48'!
moveOneUnitWest

	^ position := position + (-1@0).! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:51'!
rotateEast

	^ direction := #east.! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:53'!
rotateNorth

	^ direction := #north.! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:56'!
rotateSouth

	^ direction := #south.! !

!MarsRover methodsFor: 'movement - private' stamp: 'JGC 6/1/2022 13:20:58'!
rotateWest

	^ direction := #west.! !


!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:57:54'!
executeBackwardsCommandFacingEast

	self moveOneUnitWest.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:58:28'!
executeBackwardsCommandFacingNorth

	self moveOneUnitSouth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:58:44'!
executeBackwardsCommandFacingSouth

	self moveOneUnitNorth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:59:00'!
executeBackwardsCommandFacingWest

	self moveOneUnitEast.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:59:00'!
executeForwardCommandFacingEast

	self moveOneUnitEast.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:58:44'!
executeForwardCommandFacingNorth

	self moveOneUnitNorth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:58:28'!
executeForwardCommandFacingSouth

	self moveOneUnitSouth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:57:54'!
executeForwardCommandFacingWest

	self moveOneUnitWest.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:59:35'!
executeLeftCommandFacingEast

	self rotateNorth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:59:45'!
executeLeftCommandFacingNorth

	self rotateWest.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 13:00:06'!
executeLeftCommandFacingSouth

	self rotateEast.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 13:00:27'!
executeLeftCommandFacingWest

	self rotateSouth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 13:00:27'!
executeRightCommandFacingEast

	self rotateSouth.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 13:00:06'!
executeRightCommandFacingNorth

	self rotateEast.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:59:45'!
executeRightCommandFacingSouth

	self rotateWest.! !

!MarsRover methodsFor: 'commands - private' stamp: 'JGC 6/1/2022 12:59:35'!
executeRightCommandFacingWest

	self rotateNorth.! !


!MarsRover methodsFor: 'initialization' stamp: 'JGC 6/1/2022 13:18:28'!
initializeInXCoordinate: anXCoordinate YCoordinate: aYCoordinate facing: aCardinalDirection

	self assertXCoordinate: anXCoordinate andYCoordinateAreValid: aYCoordinate.
	self assertCardinalDirectionIsValid: aCardinalDirection.
	
	position := anXCoordinate@aYCoordinate.
	direction := aCardinalDirection.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover'!
MarsRover class
	instanceVariableNames: 'renameMe1 renameMe2'!

!MarsRover class methodsFor: 'initialization' stamp: 'JGC 6/1/2022 13:04:49'!
deployInXCoordinate: anXCoordinate YCoordinate: aYCoordinate facing: aCardinalDirection 

	^self new initializeInXCoordinate: anXCoordinate YCoordinate: aYCoordinate facing: aCardinalDirection.! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'JGC 6/1/2022 00:02:38'!
invalidCardinalDirectionErrorDescription

	^ 'Cardinal direction is not valid'.! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'JGC 6/1/2022 00:35:13'!
invalidCommandReceivedErrorDescription

	^ 'Command recieved is not valid'.! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'JGC 6/1/2022 13:08:31'!
invalidCoordinateErrorDescription

	^ 'Coordinate input is invalid'.! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'JGC 6/1/2022 00:11:18'!
marsRoverHasNoValidStateErrorDescription

	^ 'Mars Rover has no valid state'.! !


!classDefinition: #MarsRoverState category: 'Mars Rover'!
Object subclass: #MarsRoverState
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverState methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:10'!
executeBackwardsCommand 

	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:18'!
executeForwardCommand 

	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:24'!
executeLeftCommand 

	self subclassResponsibility.! !

!MarsRoverState methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:29'!
executeRightCommand 

	self subclassResponsibility.! !


!MarsRoverState methodsFor: 'initialization' stamp: 'sm 5/29/2022 18:16:03'!
initializeWith: aMarsRover

	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverState class' category: 'Mars Rover'!
MarsRoverState class
	instanceVariableNames: ''!

!MarsRoverState class methodsFor: 'instance creation' stamp: 'sm 5/29/2022 18:14:56'!
newWith: aMarsRover

	^self new initializeWith: aMarsRover.! !


!MarsRoverState class methodsFor: 'state detecting' stamp: 'sm 5/29/2022 18:07:24'!
correspondsToState: aMarsRover
	
	self subclassResponsibility.! !


!classDefinition: #MarsRoverFacingEast category: 'Mars Rover'!
MarsRoverState subclass: #MarsRoverFacingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverFacingEast methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:10'!
executeBackwardsCommand 

	marsRover executeBackwardsCommandFacingEast.! !

!MarsRoverFacingEast methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:18'!
executeForwardCommand 

	marsRover executeForwardCommandFacingEast.! !

!MarsRoverFacingEast methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:24'!
executeLeftCommand 

	marsRover executeLeftCommandFacingEast.! !

!MarsRoverFacingEast methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:29'!
executeRightCommand 

	marsRover executeRightCommandFacingEast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingEast class' category: 'Mars Rover'!
MarsRoverFacingEast class
	instanceVariableNames: ''!

!MarsRoverFacingEast class methodsFor: 'state detecting' stamp: 'JGC 6/1/2022 00:19:32'!
correspondsToState: aMarsRover
	
	^ aMarsRover direction = #east.! !


!classDefinition: #MarsRoverFacingNorth category: 'Mars Rover'!
MarsRoverState subclass: #MarsRoverFacingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverFacingNorth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:10'!
executeBackwardsCommand 

	marsRover executeBackwardsCommandFacingNorth.! !

!MarsRoverFacingNorth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:18'!
executeForwardCommand 

	marsRover executeForwardCommandFacingNorth.! !

!MarsRoverFacingNorth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:24'!
executeLeftCommand 

	marsRover executeLeftCommandFacingNorth.! !

!MarsRoverFacingNorth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:29'!
executeRightCommand 

	marsRover executeRightCommandFacingNorth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingNorth class' category: 'Mars Rover'!
MarsRoverFacingNorth class
	instanceVariableNames: ''!

!MarsRoverFacingNorth class methodsFor: 'state detecting' stamp: 'JGC 6/1/2022 00:19:36'!
correspondsToState: aMarsRover
	
	^ aMarsRover direction = #north.! !


!classDefinition: #MarsRoverFacingSouth category: 'Mars Rover'!
MarsRoverState subclass: #MarsRoverFacingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverFacingSouth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:10'!
executeBackwardsCommand 

	marsRover executeBackwardsCommandFacingSouth.! !

!MarsRoverFacingSouth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:18'!
executeForwardCommand 

	marsRover executeForwardCommandFacingSouth.! !

!MarsRoverFacingSouth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:24'!
executeLeftCommand 

	marsRover executeLeftCommandFacingSouth.! !

!MarsRoverFacingSouth methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:29'!
executeRightCommand 

	marsRover executeRightCommandFacingSouth.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingSouth class' category: 'Mars Rover'!
MarsRoverFacingSouth class
	instanceVariableNames: ''!

!MarsRoverFacingSouth class methodsFor: 'state detecting' stamp: 'JGC 6/1/2022 00:19:39'!
correspondsToState: aMarsRover
	
	^ aMarsRover direction = #south.! !


!classDefinition: #MarsRoverFacingWest category: 'Mars Rover'!
MarsRoverState subclass: #MarsRoverFacingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverFacingWest methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:10'!
executeBackwardsCommand 

	marsRover executeBackwardsCommandFacingWest.! !

!MarsRoverFacingWest methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:18'!
executeForwardCommand 

	marsRover executeForwardCommandFacingWest.! !

!MarsRoverFacingWest methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:24'!
executeLeftCommand 

	marsRover executeLeftCommandFacingWest.! !

!MarsRoverFacingWest methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:29'!
executeRightCommand 

	marsRover executeRightCommandFacingWest.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverFacingWest class' category: 'Mars Rover'!
MarsRoverFacingWest class
	instanceVariableNames: ''!

!MarsRoverFacingWest class methodsFor: 'state detecting' stamp: 'JGC 6/1/2022 00:19:42'!
correspondsToState: aMarsRover
	
	^ aMarsRover direction = #west.! !
