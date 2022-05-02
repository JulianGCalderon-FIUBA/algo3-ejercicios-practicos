!classDefinition: #CantSuspend category: 'CodigoRepetido'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido'!


!classDefinition: #NotFound category: 'CodigoRepetido'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido'!

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:22:16'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook millisecondsItTook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook new.
	
	millisecondsItTook := self millisecondsItTakesTo: [ customerBook addCustomerNamed: johnLennon ].
	
	self assert: millisecondsItTook < (50 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 5/1/2022 23:50:12'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook millisecondsItTook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithCustomer: paulMcCartney.
	
	millisecondsItTook := self millisecondsItTakesTo: [ customerBook removeCustomerNamed: paulMcCartney ].
	
	self assert: millisecondsItTook < (100 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:25:16'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
		
	self testTryTo: [ customerBook addCustomerNamed: '' ] 
		ifError: Error
		test: [ :anError | 
				self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
				self assert: customerBook isEmpty
			].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:25:26'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon paulMcCartney |
			
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithCustomer: johnLennon.
		
	self testTryTo: [ customerBook removeCustomerNamed: paulMcCartney ] 
		ifError: NotFound
		test: [ :anError | self testThereIsOnlyACustomerNamed: johnLennon in: customerBook ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:24:42'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createCustomerBookWithSuspendedCustomer: paulMcCartney.
		
	self testNumberOfActiveCustomersIn: customerBook is: 0 andNumberOfSuspendedCustomersIs: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:24:42'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook := self createCustomerBookWithSuspendedCustomer: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self testNumberOfActiveCustomersIn: customerBook is: 0 andNumberOfSuspendedCustomersIs: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:25:05'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr |
			
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	
	customerBook := self createCustomerBookWithCustomer: johnLennon.
		
	self testTryToSuspend: ringoStarr from: customerBook withOnly: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:25:05'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self createCustomerBookWithSuspendedCustomer: johnLennon.
		
	self testTryToSuspend: johnLennon from: customerBook withOnly: johnLennon.! !


!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:23:25'!
createCustomerBookWithCustomer: aName

	| customerBook |
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: aName.
	
	^customerBook.! !

!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:22:46'!
createCustomerBookWithSuspendedCustomer: aName

	| customerBook |
	
	customerBook := self createCustomerBookWithCustomer: aName.
	
	customerBook suspendCustomerNamed: aName.
	
	^customerBook.! !

!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:22:32'!
millisecondsItTakesTo: closure

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	closure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning - millisecondsBeforeRunning).! !

!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:24:41'!
testNumberOfActiveCustomersIn: aCustomerBook is: activeCustomers andNumberOfSuspendedCustomersIs: suspendedCustomers

	self assert: activeCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: (activeCustomers + suspendedCustomers) equals: aCustomerBook numberOfCustomers.
! !

!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:25:26'!
testThereIsOnlyACustomerNamed: aName in: aCustomerBook

	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aName).! !

!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:25:16'!
testTryTo: action ifError: error test: tests

	[ action value. self fail ]
		on: error 
		do: [ :anError | tests value: anError ].! !

!CustomerBookTest methodsFor: 'private' stamp: 'JGC 5/1/2022 20:25:26'!
testTryToSuspend: aName from: aCustomerBook withOnly: anotherName
		
	self testTryTo: [aCustomerBook suspendCustomerNamed: aName] 
		ifError: CantSuspend 
		test: [ :anError | self testThereIsOnlyACustomerNamed: anotherName in: aCustomerBook].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido'!

!CustomerBook methodsFor: 'testing' stamp: 'MS 4/30/2022 19:32:48'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ].! !

!CustomerBook methodsFor: 'testing' stamp: 'MS 4/30/2022 19:33:47'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ].! !

!CustomerBook methodsFor: 'testing' stamp: 'JGC 5/1/2022 20:37:42'!
remove: aName from: aList

	1 to: (aList size) do: 
		[ :index |
			aName = (aList at: index)
				ifTrue: [
					aList removeAt: index.
					^ aName 
				] 
		].

	^NotFound signal.! !


!CustomerBook methodsFor: 'initialization' stamp: 'MS 4/30/2022 19:36:06'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 19:36:34'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName.! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 19:36:40'!
numberOfActiveCustomers
	
	^active size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 15:32:22'!
numberOfCustomers
	
	^(self numberOfActiveCustomers) + (self numberOfSuspendedCustomers).! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 19:36:50'!
numberOfSuspendedCustomers
	
	^suspended size.! !

!CustomerBook methodsFor: 'customer management' stamp: 'JGC 5/1/2022 20:58:36'!
removeCustomerNamed: aName 
 
	| customerRemoved |
	
	[ customerRemoved := self remove: aName from: active ]
	on: NotFound
	do: 
	[ customerRemoved := self remove: aName from: suspended ]
	on: NotFound
	do: [ ^NotFound signal]. 
	
	^customerRemoved. 
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 19:37:55'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage.! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 19:38:00'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage.! !

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 19:38:11'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [ ^CantSuspend signal ].
	
	active remove: aName.
	
	suspended add: aName.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'MS 4/30/2022 19:33:36'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'.! !

!CustomerBook class methodsFor: 'error messages' stamp: 'MS 4/30/2022 19:33:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'.! !
