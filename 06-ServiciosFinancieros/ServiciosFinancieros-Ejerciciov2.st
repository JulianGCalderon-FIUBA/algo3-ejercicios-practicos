!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'sm 6/5/2022 19:54:58'!
test08registrarConValor

	| transfer aValue |
	
	aValue := 50 * peso.
	
	transfer := AccountTransfer register: aValue from: account1 to: account2. 
	
	self assert: aValue equals: transfer value.! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'sm 6/5/2022 19:59:38'!
test09seRegistraEnLasCuentasLaTransferencia

	| transfer aValue |
	
	aValue := 50 * peso.
	
	transfer := AccountTransfer register: aValue from: account1 to: account2. 
	
	self assert: (account1 hasRegistered: transfer extractionLeg).
	self assert: (account1 hasRegistered: transfer depositLeg).! !


!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:51:38'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:50:37'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
		
	self assert: 100 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:50:43'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
		
	self assert: 50 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:50:55'!
test04WithdrawValueMustBePositive 

	| withdrawValue |

	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account1) value
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:51:02'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	account1 := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account1.
		
	self assert: (account1 hasRegistered: deposit).
	self assert: (account1 hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:51:12'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	account1 := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account1 hasRegistered: deposit).
	self deny: (account1 hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'sm 6/5/2022 19:51:20'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	account1 := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'setUp/tearDown' stamp: 'sm 6/5/2022 19:53:12'!
setUp

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance altering' stamp: 'sm 6/5/2022 19:48:38'!
alter: aBalance 
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'sm 6/5/2022 19:48:52'!
alter: aBalance

	^aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'sm 6/5/2022 19:49:04'!
alter: aBalance

	^aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'valueToTransfer transferringAccount receivingAccount value extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransfer methodsFor: 'initialization' stamp: 'sm 6/5/2022 20:11:45'!
initializeRegister: aValueToTransfer from: aTransferringAccount to: aReceivingAccount 
	
	value := aValueToTransfer.
	
	extractionLeg  := ExtractionLeg 
		register: aValueToTransfer 
		on: aTransferringAccount.
		
	depositLeg := DepositLeg 
		register: aValueToTransfer 
		on: aTransferringAccount.
! !


!AccountTransfer methodsFor: 'accessing' stamp: 'sm 6/5/2022 20:12:07'!
depositLeg

	^depositLeg! !

!AccountTransfer methodsFor: 'accessing' stamp: 'sm 6/5/2022 20:07:25'!
extractionLeg

	^extractionLeg.! !

!AccountTransfer methodsFor: 'accessing' stamp: 'sm 6/5/2022 19:56:40'!
value

	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer class
	instanceVariableNames: ''!

!AccountTransfer class methodsFor: 'instance creation' stamp: 'sm 6/5/2022 19:55:48'!
register: aValueToTransfer from: aTransferringAccount to: aReceivingAccount 

	^self new initializeRegister: aValueToTransfer from: aTransferringAccount to: aReceivingAccount. ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sm 6/5/2022 19:47:57'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | aTransaction alter: balance]. ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferLeg
	instanceVariableNames: 'value counterpart valueToTransfer account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'sm 6/5/2022 20:08:50'!
initializeWithValue: aValueToTransfer on: anAccount 
	valueToTransfer := aValueToTransfer.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'sm 6/5/2022 20:10:45'!
register: aValueToTransfer on: anAccount 

	| transferLeg |
	
	transferLeg _ self new initializeWithValue: aValueToTransfer on: anAccount.
	
	anAccount register: transferLeg.
	
	^transferLeg.
	! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #DepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #ExtractionLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #ExtractionLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ExtractionLeg methodsFor: 'associating' stamp: 'sm 6/5/2022 20:08:26'!
initializeWithValue: aValueToTransfer on: anAccount 
	valueToTransfer := aValueToTransfer.! !
