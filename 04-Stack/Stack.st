!classDefinition: #OOStackTest category: 'Stack'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JGC 5/11/2022 13:55:31'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:05:09'!
test01CanNotFindSentenceWithEmptyPrefix

	| prefix |
	prefix := ''.

	self should: [ sentenceFinder find: prefix ] 
	raise: Error 
	withExceptionDo: 
		[:anError | self assert: SentenceFinderByPrefix prefixIsNotValidErrorDescription equals: anError messageText].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:05:54'!
test02CanNotFindSentenceWithPrefixWithSpaces

	| prefix |
	prefix := 'hola ori'.

	self should: [ sentenceFinder find: prefix ] 
	raise: Error 
	withExceptionDo: 
		[:anError | self assert: SentenceFinderByPrefix prefixIsNotValidErrorDescription equals: anError messageText].
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:16:05'!
test03CanFindSentencesWithUndercasePrefix

	| prefix sentences |
	
	prefix := 'abc'.
	sentences := OrderedCollection new.
	sentences add: 'abcxyz'.
	sentences add: 'abcdef'.
	
	self assert: sentences equals: (sentenceFinder find: prefix).
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:17:07'!
test04CanFindSentencesWithUppercasePrefix

	| prefix sentences |
	
	prefix := 'ABC'.
	sentences := OrderedCollection new.
	sentences add: 'ABCxyz'.
	sentences add: 'ABCdef'.
	
	self assert: sentences equals: (sentenceFinder find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:18:53'!
test05CanFindSentencesWithMixedcasePrefix

	| prefix sentences |
	
	prefix := 'AbC'.
	sentences := OrderedCollection new.
	sentences add: 'AbCxyz'.
	sentences add: 'AbCdef'.
	
	self assert: sentences equals: (sentenceFinder find: prefix).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:25:31'!
test06SentenceWithPrefixNotAtBeginningIsNotIncluded

	| prefix sentence |
	
	prefix := 'abc'.
	sentence := 'holaabcchau'.
	
	self assert: ((sentenceFinder find: prefix) includes: sentence) not.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'MS 5/15/2022 19:29:43'!
test07OriginalStackIsNotModifiedAfterFindingSentences

	| prefix originalSize |
	
	prefix := 'abc'.
	originalSize := stack size.
	sentenceFinder find: prefix.
	
	self assert: originalSize equals: stack size. ! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'MS 5/15/2022 19:18:42'!
setUp
	
	stack := OOStack new.
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

!OOStack methodsFor: 'operations' stamp: 'JGC 5/11/2022 14:34:21'!
push: aString

	elements add: aString.! !


!OOStack methodsFor: 'testing' stamp: 'JGC 5/11/2022 13:48:53'!
isEmpty

	^self size = 0.! !


!OOStack methodsFor: 'private' stamp: 'JGC 5/15/2022 17:45:19'!
correspondingStateInstance
	
	StackStates subclasses 
		detect: [:state | state stackCorrespondsWithState: self ] 
		ifFound: [:state | ^state new] 
		ifNone: [OOStack error: OOStack stackCorrespondsToNoStateErrorDescription ].! !


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


!classDefinition: #SentenceFinderByPrefix category: 'Stack'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!SentenceFinderByPrefix methodsFor: 'find' stamp: 'MS 5/15/2022 18:49:03'!
find: prefix

	(self isPrefixValid: prefix) 
	ifFalse: 
	[self prefixIsNotValid ]
	ifTrue: 
	[^self listOfStringsWithPrefix: prefix].! !


!SentenceFinderByPrefix methodsFor: 'error' stamp: 'MS 5/15/2022 18:48:22'!
prefixIsNotValid

	^ SentenceFinderByPrefix error: SentenceFinderByPrefix prefixIsNotValidErrorDescription! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'MS 5/15/2022 19:04:33'!
with: anOOStack 
	stack := anOOStack.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MS 5/15/2022 19:37:04'!
if: sentence startsWithPrefix: prefix addTo: list

	(sentence findString: prefix) = 1 
	ifTrue: 
	[ list add: sentence ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MS 5/15/2022 19:37:58'!
listOfStringsWithPrefix: prefix

	| listOfSentenceswithPrefix  listOfAllSentences|
	
	listOfSentenceswithPrefix := OrderedCollection new.
	listOfAllSentences := OrderedCollection new.
	
	[ stack isEmpty not ] 
	whileTrue: 
	[ |sentence|
		sentence := stack pop.
		listOfAllSentences add: sentence.
		self if: sentence startsWithPrefix: prefix addTo: listOfSentenceswithPrefix ].
	
	self refillStackWith: listOfAllSentences.
	
	^listOfSentenceswithPrefix.! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'MS 5/15/2022 19:40:49'!
refillStackWith: list

	list reversed do: [:element | stack push: element ].! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'MS 5/15/2022 18:08:43'!
isPrefixValid: prefix

	^((prefix includesSubString: ' ') or: (prefix = '')) not. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error description' stamp: 'MS 5/15/2022 18:02:20'!
prefixIsNotValidErrorDescription

	^'Prefix is not valid'.! !


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

!StackStates class methodsFor: 'testing' stamp: 'JGC 5/14/2022 11:53:47'!
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

!Empty class methodsFor: 'testing' stamp: 'JGC 5/14/2022 11:54:36'!
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

!NotEmpty class methodsFor: 'testing' stamp: 'JGC 5/14/2022 11:54:52'!
stackCorrespondsWithState: stack

	^stack isEmpty not.! !
