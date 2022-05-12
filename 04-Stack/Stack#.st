!classDefinition: #Cell category: 'Stack?'!
Object subclass: #Cell
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack?'!

!Cell methodsFor: 'initialization' stamp: 'JGC 5/11/2022 23:44:27'!
with: anObject

	value := anObject.! !


!Cell methodsFor: 'accessing' stamp: 'JGC 5/11/2022 23:18:22'!
value
	^value! !


!Cell methodsFor: 'operations' stamp: 'JGC 5/11/2022 23:49:58'!
getRemovedFrom: aCollection

	^(aCollection remove: self ifAbsent: nil) value.! !


!classDefinition: #NullCell category: 'Stack?'!
Cell subclass: #NullCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack?'!

!NullCell methodsFor: 'operations' stamp: 'JGC 5/11/2022 23:20:35'!
getRemovedFrom: aCollection
	
	OOStack error: OOStack stackEmptyErrorDescription.! !


!NullCell methodsFor: 'accessing' stamp: 'JGC 5/11/2022 23:20:22'!
value

	OOStack error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack?'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack?'!

!OOStack methodsFor: 'initialization' stamp: 'JGC 5/11/2022 23:21:46'!
initialize

	elements := OrderedCollection new.
	
	elements add: NullCell new.! !


!OOStack methodsFor: 'private' stamp: 'JGC 5/11/2022 23:28:13'!
lastElement

	^elements at: elements size.! !

!OOStack methodsFor: 'private' stamp: 'JGC 5/11/2022 23:23:07'!
realSize
	
	^elements size.! !


!OOStack methodsFor: 'testing' stamp: 'JGC 5/11/2022 13:48:53'!
isEmpty

	^self size = 0.! !


!OOStack methodsFor: 'operations' stamp: 'JGC 5/11/2022 23:34:20'!
pop
	
	^self lastElement getRemovedFrom: elements.! !

!OOStack methodsFor: 'operations' stamp: 'JGC 5/11/2022 23:24:21'!
push: aString

	elements add: (Cell new with: aString).! !


!OOStack methodsFor: 'accessing' stamp: 'JGC 5/11/2022 23:22:13'!
size
	
	^elements size - 1.! !

!OOStack methodsFor: 'accessing' stamp: 'JGC 5/11/2022 23:27:17'!
top

	^self lastElement value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack?'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack?'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack?'!


!classDefinition: #OOStackTest category: 'Stack?'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack?'!

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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack?'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack?'!
