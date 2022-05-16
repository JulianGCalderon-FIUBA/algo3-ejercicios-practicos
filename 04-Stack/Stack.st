!classDefinition: #OOStackTest category: 'Stack'!
TestCase subclass: #OOStackTest
	instanceVariableNames: 'stack pushedObject firstPushedObject secondPushedObject limitedStack thirdPushedObject'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!OOStackTest methodsFor: 'private' stamp: 'JGC 5/16/2022 10:46:31'!
pushAndPopAnElementToStack

	stack push: firstPushedObject.
	stack pop.! !

!OOStackTest methodsFor: 'private' stamp: 'JGC 5/16/2022 11:19:35'!
should: aClosureToBeEvaluated raiseErrorWithErrorDescription: anErrorDescription

	^self 
		should: aClosureToBeEvaluated
	 	raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = anErrorDescription].! !


!OOStackTest methodsFor: 'test' stamp: 'MS 5/15/2022 22:50:50'!
test01StackShouldBeEmptyWhenCreated
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 10:42:53'!
test02PushAddElementsToTheStack

	stack push: firstPushedObject .
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 10:46:48'!
test03PopRemovesElementsFromTheStack

	self pushAndPopAnElementToStack.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 10:43:54'!
test04PopReturnsLastPushedObject

	stack push: firstPushedObject.
	
	self assert: stack pop = firstPushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'MS 5/15/2022 22:51:45'!
test05StackBehavesLIFO

	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 10:43:44'!
test06TopReturnsLastPushedObject

	stack push: firstPushedObject .
	
	self assert: stack top = firstPushedObject .
	! !

!OOStackTest methodsFor: 'test' stamp: 'MS 5/15/2022 22:52:15'!
test07TopDoesNotRemoveObjectFromStack

	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:19:35'!
test08CanNotPopWhenThereAreNoObjectsInTheStack
	
	self should: [stack pop] raiseErrorWithErrorDescription: OOStack stackEmptyErrorDescription.		
! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:19:35'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	self pushAndPopAnElementToStack.
	
	self should: [stack pop] raiseErrorWithErrorDescription: OOStack stackEmptyErrorDescription.		
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:19:35'!
test10CanNotTopWhenThereAreNoObjectsInTheStack
	
	self should: [stack top] raiseErrorWithErrorDescription: OOStack stackEmptyErrorDescription.		
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:11:21'!
test11LimitedStackShouldBeEmptyWhenCreated
	
	self assert: limitedStack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:11:51'!
test12PushAddElementsToLimitedStack

	limitedStack push: firstPushedObject .
	
	self deny: limitedStack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:12:57'!
test13PopReturnsLastPushedObjectOnLimitedStack

	limitedStack push: firstPushedObject.
	
	self assert: limitedStack pop = firstPushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:13:31'!
test14TopReturnsLastPushedObjectOnLimitedStack

	limitedStack push: firstPushedObject .
	
	self assert: limitedStack top = firstPushedObject .
	! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/16/2022 11:19:35'!
test15CanNotPushWhenLimitedStackIsFull

	limitedStack push: firstPushedObject.
	limitedStack push: secondPushedObject.
	
	self should: [limitedStack push: thirdPushedObject] raiseErrorWithErrorDescription: LimitedStack stackFullErrorDescription.
		
! !


!OOStackTest methodsFor: 'setup' stamp: 'JGC 5/16/2022 11:10:42'!
setUp

	stack := UnlimitedStack new.
	limitedStack := LimitedStack newWithLimit: 2.
	
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	thirdPushedObject := 'third'.! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:31:40'!
test01CanNotFindSentenceWithEmptyPrefix

	| aPrefix |
	aPrefix := ''.

	self findSentencesWithInvalidPrefixRaisesInvalidPrefixError: aPrefix.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:31:47'!
test02CanNotFindSentenceWithPrefixWithSpaces

	| aPrefix |
	aPrefix := 'hola ori'.

	self findSentencesWithInvalidPrefixRaisesInvalidPrefixError: aPrefix.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:31:51'!
test03CanNotFindSentenceWithPrefixNotAString

	| aPrefix |
	aPrefix := 4.

	self findSentencesWithInvalidPrefixRaisesInvalidPrefixError: aPrefix.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:17:48'!
test04CanFindSentencesWithUndercasePrefix

	| prefix sentences |
	
	prefix := 'abc'.
	
	sentences := OrderedCollection new.
	sentences add: 'abcxyz'.
	sentences add: 'abcdef'.
	
	self assert: sentences equals: (sentenceFinder find: prefix).
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:17:44'!
test05CanFindSentencesWithUppercasePrefix

	| prefix sentences |
	
	prefix := 'ABC'.
	
	sentences := OrderedCollection new.
	sentences add: 'ABCxyz'.
	sentences add: 'ABCdef'.
	
	self assert: sentences equals: (sentenceFinder find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:17:40'!
test06CanFindSentencesWithMixedcasePrefix

	| prefix sentences |
	
	prefix := 'AbC'.
	
	sentences := OrderedCollection new.
	sentences add: 'AbCxyz'.
	sentences add: 'AbCdef'.
	
	self assert: sentences equals: (sentenceFinder find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:17:36'!
test07SentenceWithPrefixNotAtBeginningIsNotIncluded

	| prefix sentence |
	
	prefix := 'abc'.
	sentence := 'holaabcchau'.
	
	self assert: ((sentenceFinder find: prefix) includes: sentence) not.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JGC 5/15/2022 22:17:31'!
test08OriginalStackIsNotModifiedAfterFindingSentences

	| prefix originalSize |
	
	prefix := 'abc'.
	originalSize := stack size.
	
	sentenceFinder find: prefix.
	
	self assert: originalSize equals: stack size. ! !


!SentenceFinderByPrefixTest methodsFor: 'asserts - private' stamp: 'JGC 5/15/2022 22:31:16'!
findSentencesWithInvalidPrefixRaisesInvalidPrefixError: aPrefix

	^self should: 
		[ sentenceFinder find: aPrefix ] 
	raise: Error 
	withExceptionDo: 
		[:anError | self assert: SentenceFinderByPrefix prefixIsNotValidErrorDescription equals: anError messageText].! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'JGC 5/16/2022 11:04:15'!
setUp
	
	stack := UnlimitedStack new.
	
	stack push: 'abcdef'.
	stack push: 'abcxyz'.
	
	stack push: 'ABCdef'.
	stack push: 'ABCxyz'	.
	
	stack push: 'AbCdef'.
	stack push: 'AbCxyz'.
	
	stack push: 'holaabcchau'.
	
	sentenceFinder := SentenceFinderByPrefix new with: stack.
	
	! !


!classDefinition: #OOStack category: 'Stack'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!OOStack methodsFor: 'accessing' stamp: 'JGC 5/11/2022 14:34:21'!
size
	
	^elements size.! !

!OOStack methodsFor: 'accessing' stamp: 'JGC 5/15/2022 17:40:24'!
top
	
	^self correspondingStateInstance top: self.! !


!OOStack methodsFor: 'initialization' stamp: 'JGC 5/11/2022 14:56:47'!
initialize

	elements := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'JGC 5/15/2022 17:40:15'!
pop
	
	^self correspondingStateInstance pop: self.
	
! !

!OOStack methodsFor: 'operations' stamp: 'JGC 5/16/2022 11:29:37'!
push: anObjectToBePushed

	self subclassResponsibility.! !


!OOStack methodsFor: 'testing' stamp: 'JGC 5/11/2022 13:48:53'!
isEmpty

	^self size = 0.! !


!OOStack methodsFor: 'state detecting' stamp: 'JGC 5/15/2022 20:22:09'!
correspondingStateInstance
	
	StackStates subclasses 
		detect: [ :state | state stackCorrespondsWithState: self ] 
		ifFound: [ :state | ^state new] 
		ifNone: [ OOStack error: OOStack stackCorrespondsToNoStateErrorDescription ].! !


!OOStack methodsFor: 'accessing - private' stamp: 'JGC 5/13/2022 15:59:48'!
lastElement

	^elements at: elements size.! !

!OOStack methodsFor: 'accessing - private' stamp: 'JGC 5/14/2022 11:44:42'!
topWhenEmpty

	OOStack error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'accessing - private' stamp: 'JGC 5/14/2022 11:44:13'!
topWhenNotEmpty

	^self lastElement.! !


!OOStack methodsFor: 'operations - private' stamp: 'JGC 5/14/2022 11:44:51'!
popWhenEmpty

	OOStack error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operations - private' stamp: 'JGC 5/14/2022 11:44:58'!
popWhenNotEmpty

	^self removeLastElement.! !

!OOStack methodsFor: 'operations - private' stamp: 'JGC 5/16/2022 11:29:45'!
pushWhenNotFull: anObjectToBePushed
	
	elements add: anObjectToBePushed.! !

!OOStack methodsFor: 'operations - private' stamp: 'JGC 5/13/2022 15:55:54'!
removeLastElement
	
	^elements removeLast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'JGC 5/15/2022 17:45:33'!
stackCorrespondsToNoStateErrorDescription

	^ 'Stack does not have a corresponding state'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #LimitedStack category: 'Stack'!
OOStack subclass: #LimitedStack
	instanceVariableNames: 'limit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!LimitedStack methodsFor: 'initialization' stamp: 'JGC 5/16/2022 11:08:53'!
with: aLimit
	
	limit := aLimit.! !


!LimitedStack methodsFor: 'operations' stamp: 'JGC 5/16/2022 11:30:26'!
push: anObjectToBePushed
	
	(elements size = limit) ifTrue:
	[
		self pushWhenFull: anObjectToBePushed.
	].

	self pushWhenNotFull: anObjectToBePushed.! !


!LimitedStack methodsFor: 'operations - private' stamp: 'JGC 5/16/2022 11:29:22'!
pushWhenFull: anObjectToBePushed

	LimitedStack error: LimitedStack stackFullErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LimitedStack class' category: 'Stack'!
LimitedStack class
	instanceVariableNames: ''!

!LimitedStack class methodsFor: 'instance creation' stamp: 'JGC 5/16/2022 11:07:41'!
newWithLimit: limit
	^LimitedStack new with: limit.! !


!LimitedStack class methodsFor: 'error descriptions' stamp: 'JGC 5/16/2022 11:19:01'!
stackFullErrorDescription

	^'Stack is full'.! !


!classDefinition: #UnlimitedStack category: 'Stack'!
OOStack subclass: #UnlimitedStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!UnlimitedStack methodsFor: 'operations' stamp: 'JGC 5/16/2022 11:30:33'!
push: anObjectToBePushed

	self pushWhenNotFull: anObjectToBePushed.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!SentenceFinderByPrefix methodsFor: 'find' stamp: 'JGC 5/15/2022 22:25:32'!
find: aPrefix
		
	self assertPrefixIsValid: aPrefix.
	
	^self findWhenPrefixIsValid: aPrefix 
		
	! !


!SentenceFinderByPrefix methodsFor: 'find - private' stamp: 'JGC 5/15/2022 22:25:47'!
findWhenPrefixIsValid: aPrefix

	| listOfSentenceswithPrefix  listOfAllSentences |
	
	
	listOfAllSentences := self createOrderedCollectionFromStack.
	
	listOfSentenceswithPrefix := listOfAllSentences select: [ :sentence | self starts: sentence with: aPrefix].
	
	^listOfSentenceswithPrefix.
! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'JGC 5/15/2022 20:06:49'!
with: aStack 

	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'JGC 5/15/2022 22:25:17'!
assertPrefixIsValid: aPrefix
	
	(self isPrefixNotValid: aPrefix) ifTrue: 
		[^SentenceFinderByPrefix error: SentenceFinderByPrefix prefixIsNotValidErrorDescription]! !

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'JGC 5/15/2022 22:25:57'!
isPrefixNotValid: aPrefix
	
	aPrefix isString ifFalse: [ ^true ].
	
	^(aPrefix includesSubString: ' ') or: (aPrefix = ''). ! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JGC 5/15/2022 22:35:53'!
createOrderedCollectionFromStack
	
	| anOrderedCollection |
	
	anOrderedCollection := OrderedCollection new.
	
	self emptyStackIn: anOrderedCollection.

	self refillStackWith: anOrderedCollection.
	
	^anOrderedCollection.
	
	"\\(O.O)//"! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JGC 5/15/2022 22:37:10'!
emptyStackIn: anOrderedCollection

	^[stack isEmpty not] whileTrue: 
	[
		anOrderedCollection add: stack pop
	].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JGC 5/15/2022 22:37:52'!
refillStackWith: anOrderedCollection

	anOrderedCollection reversed do: [:element | stack push: element ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'JGC 5/15/2022 22:26:54'!
starts: aSentence with: aPrefix

	^(aSentence findString: aPrefix) = 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'JGC 5/15/2022 21:50:04'!
prefixCorrespondsWithNoStateErrorDescription

	^'Prefix corresponds with no state'.! !

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'JGC 5/15/2022 22:24:26'!
prefixIsNotValidErrorDescription

	^ 'Prefix is not valid'.! !


!classDefinition: #StackStates category: 'Stack'!
Object subclass: #StackStates
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!StackStates methodsFor: 'accessing' stamp: 'JGC 5/14/2022 11:39:45'!
top: stack

	self subclassResponsibility.! !


!StackStates methodsFor: 'operations' stamp: 'JGC 5/14/2022 11:39:40'!
pop: stack

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStates class' category: 'Stack'!
StackStates class
	instanceVariableNames: ''!

!StackStates class methodsFor: 'state detecting' stamp: 'JGC 5/14/2022 11:53:47'!
stackCorrespondsWithState: stack

	self subclassResponsibility.! !


!classDefinition: #Empty category: 'Stack'!
StackStates subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!Empty methodsFor: 'operations' stamp: 'JGC 5/14/2022 11:51:58'!
pop: stack

	^stack popWhenEmpty.
	! !


!Empty methodsFor: 'accessing' stamp: 'JGC 5/14/2022 11:51:54'!
top: stack

	^stack topWhenEmpty.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'state detecting' stamp: 'JGC 5/14/2022 11:54:36'!
stackCorrespondsWithState: stack

	^stack isEmpty.! !


!classDefinition: #NotEmpty category: 'Stack'!
StackStates subclass: #NotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!NotEmpty methodsFor: 'operations' stamp: 'JGC 5/14/2022 11:51:47'!
pop: stack

	^stack popWhenNotEmpty.
	! !


!NotEmpty methodsFor: 'accessing' stamp: 'JGC 5/14/2022 11:51:50'!
top: stack

	^stack topWhenNotEmpty.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: 'Stack'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'state detecting' stamp: 'JGC 5/14/2022 11:54:52'!
stackCorrespondsWithState: stack

	^stack isEmpty not.! !
