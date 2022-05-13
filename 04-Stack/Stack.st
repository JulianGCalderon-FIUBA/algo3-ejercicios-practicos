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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!


!classDefinition: #OOStack category: 'Stack'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!OOStack methodsFor: 'accessing' stamp: 'JGC 5/11/2022 14:34:21'!
size
	
	^elements size.! !

!OOStack methodsFor: 'accessing' stamp: 'ms 5/12/2022 21:19:35'!
top
	
	^self sendMessageToCorrespondingClass: #top:.! !


!OOStack methodsFor: 'initialization' stamp: 'JGC 5/11/2022 14:56:47'!
initialize

	elements := OrderedCollection new.! !


!OOStack methodsFor: 'operations' stamp: 'ms 5/12/2022 21:19:35'!
pop

	^self sendMessageToCorrespondingClass: #pop:.! !

!OOStack methodsFor: 'operations' stamp: 'JGC 5/11/2022 14:34:21'!
push: aString

	elements add: aString.! !


!OOStack methodsFor: 'testing' stamp: 'JGC 5/11/2022 13:48:53'!
isEmpty

	^self size = 0.! !


!OOStack methodsFor: 'private' stamp: 'ms 5/12/2022 20:25:14'!
popWhenEmpty
	
	OOStack error: OOStack stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'ms 5/12/2022 20:20:48'!
popWhenNotEmpty

	^elements removeLast.! !

!OOStack methodsFor: 'private' stamp: 'ms 5/12/2022 21:24:06'!
sendMessageToCorrespondingClass: message
	
	OOStack subclasses 
		detect: [:subclass | subclass stackCorrespondsWithClass: self ] 
		ifFound: [:subclass | ^message sendTo: subclass new with: self] 
		ifNone: [OOStack error: OOStack stackCorrespondsToNoClassErrorDescription ].! !

!OOStack methodsFor: 'private' stamp: 'ms 5/12/2022 20:23:30'!
topWhenEmpty

	OOStack error: OOStack stackEmptyErrorDescription.
! !

!OOStack methodsFor: 'private' stamp: 'ms 5/12/2022 20:29:04'!
topWhenNotEmpty

	^elements at: self size.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'testing' stamp: 'ms 5/12/2022 21:25:10'!
stackCorrespondsWithClass: stack
	
	self subclassResponsibility.! !


!OOStack class methodsFor: 'error descriptions' stamp: 'ms 5/12/2022 21:12:56'!
stackCorrespondsToNoClassErrorDescription

	^ 'Stack does not have a corresponding class'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #EmptyStack category: 'Stack'!
OOStack subclass: #EmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!EmptyStack methodsFor: 'operations' stamp: 'ms 5/12/2022 20:24:53'!
pop: stack

	 ^stack popWhenEmpty.

	! !


!EmptyStack methodsFor: 'accessing' stamp: 'ms 5/12/2022 20:23:08'!
top: stack

	^stack topWhenEmpty.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStack class' category: 'Stack'!
EmptyStack class
	instanceVariableNames: ''!

!EmptyStack class methodsFor: 'testing' stamp: 'ms 5/12/2022 21:23:26'!
stackCorrespondsWithClass: stack

	^stack isEmpty.! !


!classDefinition: #NotEmptyStack category: 'Stack'!
OOStack subclass: #NotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!

!NotEmptyStack methodsFor: 'operations' stamp: 'ms 5/12/2022 20:21:11'!
pop: stack

	^stack popWhenNotEmpty.! !


!NotEmptyStack methodsFor: 'accessing' stamp: 'ms 5/12/2022 20:26:03'!
top: stack

	^stack topWhenNotEmpty.! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmptyStack class' category: 'Stack'!
NotEmptyStack class
	instanceVariableNames: ''!

!NotEmptyStack class methodsFor: 'testing' stamp: 'ms 5/12/2022 21:24:27'!
stackCorrespondsWithClass: stack

	^stack isEmpty not.

	! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack'!
