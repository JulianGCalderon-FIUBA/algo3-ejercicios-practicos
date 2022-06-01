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

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:45'!
setUp

	marsRoverFacingNorth := MarsRover createIn: 16@05 facing: self north. 
	marsRoverFacingSouth := MarsRover createIn: 16@05 facing: self south.
	marsRoverFacingEast := MarsRover createIn: 16@05 facing: self east.
	marsRoverFacingWest := MarsRover createIn: 16@05 facing: self west.! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:13'!
south
	^#south! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'sm 5/29/2022 18:21:24'!
west
	^#west! !


!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'sm 5/29/2022 18:46:47'!
test01MarsRoverIsCreatedInInitialPosition
	
	self assert: 16@05 equals: marsRoverFacingNorth position. ! !

!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'sm 5/29/2022 18:22:13'!
test02MarsRoverIsCreatedFacingInitialDirection

	self assert: self north equals: marsRoverFacingNorth direction. ! !

!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'sm 5/29/2022 18:22:21'!
test03InvalidPoint

	self should: [MarsRover createIn: 45 facing: self north]
	raise: Error
	withExceptionDo: [:anError | 
		self assert: MarsRover cannotCreateRoverWithInvalidPositionErrorDescription
		equals: anError messageText 
		].! !

!MarsRoverTest methodsFor: 'tests - initialization' stamp: 'sm 5/29/2022 18:59:38'!
test04InvalidCardinalDirection

	self should: [MarsRover createIn: 16@05 facing: 'hola']
	raise: Error
	withExceptionDo: [:anError | 
		self assert: MarsRover invalidCardinalDirectionErrorDescription
		equals: anError messageText 
		].! !


!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'sm 5/29/2022 16:48:25'!
test05BackwardsNorth
	
	| rover |
	
	rover := marsRoverFacingNorth. 
	
	rover executeCommands: 'b'.
	
	self assert: 16@04 equals: rover position. ! !

!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'sm 5/29/2022 16:48:25'!
test06ForwardNorth
	
	| rover |
	
	rover := marsRoverFacingNorth.
	
	rover executeCommands: 'f'.
	
	self assert: 16@06 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'sm 5/29/2022 18:22:40'!
test07LeftNorth
	
	| rover |
	
	rover := marsRoverFacingNorth.
	
	rover executeCommands: 'l'.
	
	self assert: self west equals: rover direction. ! !

!MarsRoverTest methodsFor: 'tests - facing north' stamp: 'sm 5/29/2022 18:22:48'!
test08RightNorth
	
	| rover |
	
	rover := marsRoverFacingNorth.
	
	rover executeCommands: 'r'.
	
	self assert: self east equals: rover direction. ! !


!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'sm 5/29/2022 16:48:25'!
test08BackwardsSouth

	| rover |
	
	rover := marsRoverFacingSouth.
	
	rover executeCommands: 'b'.
	
	self assert: 16@06 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'sm 5/29/2022 16:48:25'!
test09ForwardSouth

	| rover |
	
	rover := marsRoverFacingSouth.
	
	rover executeCommands: 'f'.
	
	self assert: 16@04 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'sm 5/29/2022 18:23:04'!
test10LeftSouth

	| rover |
	
	rover := marsRoverFacingSouth.
	
	rover executeCommands: 'l'.
	
	self assert: self east equals: rover direction. ! !

!MarsRoverTest methodsFor: 'tests - facing south' stamp: 'sm 5/29/2022 18:23:14'!
test11RightSouth

	| rover |
	
	rover := marsRoverFacingSouth.
	
	rover executeCommands: 'r'.
	
	self assert: self west equals: rover direction. ! !


!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'sm 5/29/2022 16:48:25'!
test12BackwardsEast

	| rover |
	
	rover := marsRoverFacingEast.
	
	rover executeCommands: 'b'.
	
	self assert: 15@05 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'sm 5/29/2022 16:48:25'!
test13ForwardEast

	| rover |
	
	rover := marsRoverFacingEast.
	
	rover executeCommands: 'f'.
	
	self assert: 17@05 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'sm 5/29/2022 18:23:33'!
test14LeftEast

	| rover |
	
	rover := marsRoverFacingEast.
	
	rover executeCommands: 'l'.
	
	self assert: self north equals: rover direction. ! !

!MarsRoverTest methodsFor: 'tests - facing east' stamp: 'sm 5/29/2022 18:23:43'!
test15RightEast

	| rover |
	
	rover := marsRoverFacingEast.
	
	rover executeCommands: 'r'.
	
	self assert: self south equals: rover direction. ! !


!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'sm 5/29/2022 16:48:25'!
test16BackwardsWest

	| rover |
	
	rover := marsRoverFacingWest.
	
	rover executeCommands: 'b'.
	
	self assert: 17@05 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'sm 5/29/2022 16:48:25'!
test17ForwardWest

	| rover |
	
	rover := marsRoverFacingWest.
	
	rover executeCommands: 'f'.
	
	self assert: 15@05 equals: rover position . ! !

!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'sm 5/29/2022 18:23:58'!
test18LeftWest

	| rover |
	
	rover := marsRoverFacingWest.
	
	rover executeCommands: 'l'.
	
	self assert: self south equals: rover direction. ! !

!MarsRoverTest methodsFor: 'tests - facing west' stamp: 'sm 5/29/2022 18:24:05'!
test19RightWest

	| rover |
	
	rover := marsRoverFacingWest.
	
	rover executeCommands: 'r'.
	
	self assert: self north equals: rover direction. ! !


!MarsRoverTest methodsFor: 'tests - invalid commands' stamp: 'sm 5/29/2022 16:49:39'!
test20EmptyString

	| rover |
	
	rover := marsRoverFacingEast.
	
	self should: [rover executeCommands: '' ]
	raise: Error
	withExceptionDo: [:anError | 
		self assert: MarsRover invalidCommandReceivedErrorDescription 
		equals: anError messageText ].
	
	
	
	! !

!MarsRoverTest methodsFor: 'tests - invalid commands' stamp: 'sm 5/29/2022 16:49:43'!
test21InvalidCommand

	| rover |
	
	rover := marsRoverFacingEast.
	
	self should: [rover executeCommands: 'j' ]
	raise: Error
	withExceptionDo: [:anError | 
		self assert: MarsRover invalidCommandReceivedErrorDescription 
		equals: anError messageText ].
	
	
	
	! !

!MarsRoverTest methodsFor: 'tests - invalid commands' stamp: 'sm 5/29/2022 16:49:48'!
test22NotString

	| rover |
	
	rover := marsRoverFacingEast.
	
	self should: [rover executeCommands: 8 ]
	raise: Error
	withExceptionDo: [:anError | 
		self assert: MarsRover invalidCommandReceivedErrorDescription 
		equals: anError messageText ].
	
	
	
	! !


!MarsRoverTest methodsFor: 'tests - multiple commands' stamp: 'sm 5/29/2022 18:24:20'!
test23MultipleValidCommands

	| rover |
	
	rover := marsRoverFacingSouth.
	
	rover executeCommands: 'ffl'.
	
	self assert: 16@03 equals: rover position.
	self assert: self east equals: rover direction.! !

!MarsRoverTest methodsFor: 'tests - multiple commands' stamp: 'sm 5/29/2022 18:24:30'!
test24MultipleValidCommandsIncludingInvalid

	| rover |
	
	rover := marsRoverFacingSouth.
	
	self should: [rover executeCommands: 'fflrbfffgr'] 
	raise: Error
	withExceptionDo: [:anError | 
		self assert: MarsRover invalidCommandReceivedErrorDescription equals: anError messageText].
	
	self assert: 16@01 equals: rover position.
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

!CommandBackwards class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 17:19:46'!
isBoundedTo: aCharacter

	^$b = aCharacter.! !


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

!CommandForward class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 17:19:57'!
isBoundedTo: aCharacter

	^$f = aCharacter.! !


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

!CommandLeft class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 17:20:03'!
isBoundedTo: aCharacter

	^$l = aCharacter.! !


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

!CommandRight class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 17:20:11'!
isBoundedTo: aCharacter

	^$r = aCharacter.! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'asserting' stamp: 'sm 5/29/2022 18:56:05'!
assertCardinalDirectionIsValid

	self correspondingState.! !

!MarsRover methodsFor: 'asserting' stamp: 'sm 5/29/2022 18:55:59'!
assertPositionIsValid

	(position isKindOf: Point) 
		ifFalse: [self class error: self class cannotCreateRoverWithInvalidPositionErrorDescription ]! !

!MarsRover methodsFor: 'asserting' stamp: 'sm 5/29/2022 17:40:29'!
assertStringOfCommandsIsValid: aStringOfCommands

	(aStringOfCommands isString not or: [aStringOfCommands isEmpty])
		ifTrue: [self class error: self class invalidCommandReceivedErrorDescription]! !


!MarsRover methodsFor: 'initialization' stamp: 'sm 5/29/2022 18:56:05'!
initializeIn: anInitialPosition facing: aCardinalDirection
	
	position := anInitialPosition.
	direction := aCardinalDirection.
	
	self assertPositionIsValid.
	self assertCardinalDirectionIsValid.
	
	! !


!MarsRover methodsFor: 'accessing' stamp: 'sm 5/29/2022 13:13:34'!
direction
	^direction! !

!MarsRover methodsFor: 'accessing' stamp: 'sm 5/29/2022 13:11:46'!
position
	^position! !


!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:29:03'!
executeBackwardsCommand
	
	self correspondingState executeBackwardsCommand..! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:35:50'!
executeBackwardsCommandFacingEast

	position := position + (-1@0)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:35:54'!
executeBackwardsCommandFacingNorth

	position := position + (0@-1)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:35:58'!
executeBackwardsCommandFacingSouth

	position := position + (0@1)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:36:02'!
executeBackwardsCommandFacingWest

	position := position + (1@0)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:28:50'!
executeForwardCommand

	self correspondingState executeForwardCommand.! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:36:07'!
executeForwardCommandFacingEast

	position := position + (1@0)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:36:10'!
executeForwardCommandFacingNorth

	position := position + (0@1)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:36:13'!
executeForwardCommandFacingSouth

	position := position + (0@-1)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 17:36:18'!
executeForwardCommandFacingWest

	position := position + (-1@0)! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:28:43'!
executeLeftCommand
	
	self correspondingState executeLeftCommand.! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:26:40'!
executeLeftCommandFacingEast

	direction := #north! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:26:48'!
executeLeftCommandFacingNorth

	direction := #west! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:26:54'!
executeLeftCommandFacingSouth

	direction := #east! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:26:58'!
executeLeftCommandFacingWest

	direction := #south! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:29:18'!
executeRightCommand
	
	self correspondingState executeRightCommand.! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:26:28'!
executeRightCommandFacingEast

	direction := #south! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:27:10'!
executeRightCommandFacingNorth

	direction := #east! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:27:16'!
executeRightCommandFacingSouth

	direction := #west! !

!MarsRover methodsFor: 'execution - private' stamp: 'sm 5/29/2022 18:27:21'!
executeRightCommandFacingWest

	direction := #north! !


!MarsRover methodsFor: 'private' stamp: 'sm 5/29/2022 18:54:14'!
correspondingState

	MarsRoverStates subclasses 
		detect: [ :state | state correspondsToState: self] 
		ifFound: [ :state | ^state newWith: self]
		ifNone: [self class error: self class invalidCardinalDirectionErrorDescription ].
	! !


!MarsRover methodsFor: 'execution' stamp: 'sm 5/29/2022 17:23:23'!
executeCommand: aCommand

	Command subclasses
		detect: [ :subclass | subclass isBoundedTo: aCommand ]
		ifFound: [ :subclass |  subclass new executeAs: self ]
		ifNone: [ self class error: self class invalidCommandReceivedErrorDescription ].
! !

!MarsRover methodsFor: 'execution' stamp: 'sm 5/29/2022 17:39:01'!
executeCommands: aStringOfCommands

	self assertStringOfCommandsIsValid: aStringOfCommands. 
	
	aStringOfCommands collect: [ :aCommand | 
		self executeCommand: aCommand.].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover'!
MarsRover class
	instanceVariableNames: 'renameMe1 renameMe2'!

!MarsRover class methodsFor: 'initialization' stamp: 'sm 5/29/2022 13:12:59'!
createIn: aPoint facing: aCardinalDirection 
	
	^self new initializeIn: aPoint facing: aCardinalDirection.! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'sm 5/29/2022 15:44:53'!
cannotCreateRoverWithInvalidPositionErrorDescription

	^'Position input is invalid'.! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'sm 5/29/2022 18:54:14'!
invalidCardinalDirectionErrorDescription

	^'Cardinal direction is not valid'.! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'sm 5/29/2022 16:00:19'!
invalidCommandReceivedErrorDescription

	^'Command is not valid'.! !


!classDefinition: #MarsRoverStates category: 'Mars Rover'!
Object subclass: #MarsRoverStates
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverStates methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:10'!
executeBackwardsCommand 

	self subclassResponsibility.! !

!MarsRoverStates methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:18'!
executeForwardCommand 

	self subclassResponsibility.! !

!MarsRoverStates methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:24'!
executeLeftCommand 

	self subclassResponsibility.! !

!MarsRoverStates methodsFor: 'execution' stamp: 'sm 5/29/2022 18:19:29'!
executeRightCommand 

	self subclassResponsibility.! !


!MarsRoverStates methodsFor: 'initialization' stamp: 'sm 5/29/2022 18:16:03'!
initializeWith: aMarsRover

	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverStates class' category: 'Mars Rover'!
MarsRoverStates class
	instanceVariableNames: ''!

!MarsRoverStates class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 18:07:24'!
correspondsToState: aMarsRover
	
	self subclassResponsibility.! !

!MarsRoverStates class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 18:14:56'!
newWith: aMarsRover

	^self new initializeWith: aMarsRover.! !


!classDefinition: #MarsRoverFacingEast category: 'Mars Rover'!
MarsRoverStates subclass: #MarsRoverFacingEast
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

!MarsRoverFacingEast class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 18:08:42'!
correspondsToState: aMarsRover
	
	^aMarsRover direction = #east.! !


!classDefinition: #MarsRoverFacingNorth category: 'Mars Rover'!
MarsRoverStates subclass: #MarsRoverFacingNorth
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

!MarsRoverFacingNorth class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 18:09:06'!
correspondsToState: aMarsRover
	
	^aMarsRover direction = #north.! !


!classDefinition: #MarsRoverFacingSouth category: 'Mars Rover'!
MarsRoverStates subclass: #MarsRoverFacingSouth
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

!MarsRoverFacingSouth class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 18:09:18'!
correspondsToState: aMarsRover
	
	^aMarsRover direction = #south.! !


!classDefinition: #MarsRoverFacingWest category: 'Mars Rover'!
MarsRoverStates subclass: #MarsRoverFacingWest
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

!MarsRoverFacingWest class methodsFor: 'as yet unclassified' stamp: 'sm 5/29/2022 18:09:27'!
correspondsToState: aMarsRover
	
	^aMarsRover direction = #west.! !
