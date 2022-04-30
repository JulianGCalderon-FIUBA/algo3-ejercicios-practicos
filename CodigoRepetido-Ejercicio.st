!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'private' stamp: 'MS 4/30/2022 19:46:28'!
auxTest01ThereIsOnlyACustomerNamed: aName in: aCustomerBook

	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aName).! !

!CustomerBookTest methodsFor: 'private' stamp: 'MS 4/30/2022 19:47:51'!
auxTest02TryToSuspend: aName from: aCustomerBook withOnly: anotherName

	[ aCustomerBook suspendCustomerNamed: aName.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self auxTest01ThereIsOnlyACustomerNamed: anotherName in: aCustomerBook ]! !

!CustomerBookTest methodsFor: 'private' stamp: 'MS 4/30/2022 16:36:30'!
createCustomerBookWithCustomer: aName

	|customerBook|
	
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: aName.
	
	^customerBook.! !

!CustomerBookTest methodsFor: 'private' stamp: 'MS 4/30/2022 19:43:03'!
createCustomerBookWithSuspendedCustomer: aName

	|customerBook|
	
	customerBook := self createCustomerBookWithCustomer: aName.
	customerBook suspendCustomerNamed: aName.
	
	^customerBook.! !

!CustomerBookTest methodsFor: 'private' stamp: 'MS 4/30/2022 19:41:38'!
howManyMillisecondsDoesItTakeTo: closure

	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	closure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning - millisecondsBeforeRunning).! !


!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 16:43:57'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	|customerBook millisecondsItTook johnLennon|
	
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook new.
	
	millisecondsItTook := self howManyMillisecondsDoesItTakeTo: [ customerBook addCustomerNamed: johnLennon ].
	
	self assert: millisecondsItTook < (50 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 16:44:15'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	|customerBook millisecondsItTook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook new.
	
	millisecondsItTook := self howManyMillisecondsDoesItTakeTo: [ customerBook addCustomerNamed: paulMcCartney ].
	
	self assert: millisecondsItTook < (100 * millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 19:46:28'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon paulMcCartney|
			
	johnLennon := 'John Lennon'.
	paulMcCartney := 'Paul McCartney'.
	customerBook := self createCustomerBookWithCustomer: johnLennon.
	
	[ customerBook removeCustomerNamed: paulMcCartney.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self auxTest01ThereIsOnlyACustomerNamed: johnLennon in: customerBook ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 19:49:27'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook  := self createCustomerBookWithSuspendedCustomer: paulMcCartney.
		
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	
	"este tambien le parece feito :("
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 19:49:58'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook  := self createCustomerBookWithSuspendedCustomer: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
	
	"a sol le parece feito"


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 19:47:51'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon ringoStarr|
			
	johnLennon := 'John Lennon'.
	ringoStarr := 'Ringo Starr'.
	
	customerBook := self createCustomerBookWithCustomer: johnLennon.
	
	self auxTest02TryToSuspend: ringoStarr from: customerBook withOnly: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'MS 4/30/2022 19:50:24'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook  := self createCustomerBookWithSuspendedCustomer: johnLennon.

	
	self auxTest02TryToSuspend: johnLennon from: customerBook withOnly: johnLennon.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'MS 4/30/2022 19:32:48'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ].! !

!CustomerBook methodsFor: 'testing' stamp: 'MS 4/30/2022 19:33:47'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ].! !

!CustomerBook methodsFor: 'testing' stamp: 'MS 4/30/2022 19:35:22'!
remove: aName from: aList

	1 to: aList size do: 
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

!CustomerBook methodsFor: 'customer management' stamp: 'MS 4/30/2022 15:35:05'!
removeCustomerNamed: aName 
 
	|customerRemoved|
	
	[ customerRemoved := self remove: aName from: active ]
	on: NotFound
	do: 
	[ customerRemoved := self remove: aName from: suspended ]
	on: NotFound
	do: [ ^NotFound signal]. 
	
	^customerRemoved. 
	
"revisar porque customerremoved igual da error"! !

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

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'MS 4/30/2022 19:33:36'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'.! !

!CustomerBook class methodsFor: 'error messages' stamp: 'MS 4/30/2022 19:33:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'.! !
