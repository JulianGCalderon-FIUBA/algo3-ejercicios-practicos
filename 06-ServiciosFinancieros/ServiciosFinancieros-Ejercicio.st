!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:00:22'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 * peso equals: account1 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:00:28'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
		
	self assert: 100 * peso equals: account1 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:00:31'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
		
	self assert: 50 * peso equals: account1 balance.
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/6/2022 00:28:20'!
test04WithdrawValueMustBePositive 

	| withdraw value |

	value _ 50 * peso.
	Deposit register: value on: account1.

	withdraw _ Withdraw register: value on: account1.	
	
	self assert: value equals: withdraw value.
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:01:04'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit _ Deposit register: 100 * peso on: account1.
	withdraw _ Withdraw register: 50 * peso on: account1.
		
	self assert: (account1 hasRegistered: deposit).
	self assert: (account1 hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:01:11'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit _ Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
		
	self deny: (account1 hasRegistered: deposit).
	self deny: (account1 hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:01:18'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit _ Deposit register: 50 * peso on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JGC 6/5/2022 23:49:00'!
test08RegistraConValor

	| transfer value |
	
	value _ 50 * peso.
	Deposit register: value on: account1.
	
	transfer _ AccountTransfer registerWith: value from: account1 to: account2.
	
	self assert: value equals: transfer value.
	
	! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JGC 6/5/2022 23:48:55'!
test09RegistraEnLasCuentas

	| transfer value |
	
	value _ 50 * peso.
	Deposit register: value on: account1.
	
	transfer _ AccountTransfer registerWith: value from: account1 to: account2.
	
	self assert: (account1 hasRegistered: transfer extractionLeg).
	self assert: (account2 hasRegistered: transfer depositLeg).! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JGC 6/5/2022 23:50:05'!
test10BalanceCorrecto

	| value |
	
	value _ 50 * peso.
	Deposit register: value on: account1.
	
	AccountTransfer registerWith: value from: account1 to: account2.
	
	self assert: 0 * peso equals: account1 balance.
	self assert: value equals: account2 balance.! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JGC 6/5/2022 23:52:26'!
test11Contrapartes

	| value transfer |
	
	value _ 50 * peso.
	Deposit register: value on: account1.
	
	transfer _ AccountTransfer registerWith: value from: account1 to: account2.
	
	self assert: transfer depositLeg equals: account1 transactions last counterpart.
	self assert: transfer extractionLeg equals: account2 transactions last counterpart.! !


!ReceptiveAccountTest methodsFor: 'tests - multiple operations' stamp: 'JGC 6/6/2022 00:08:58'!
test12MuchasTransferencias
	
	Deposit register: 1000 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	AccountTransfer registerWith: 300 * peso from: account1 to: account2.
	AccountTransfer registerWith: 200 * peso from: account1 to: account2.
	AccountTransfer registerWith: 150 * peso from: account1 to: account2.
	AccountTransfer registerWith: 200 * peso from: account2 to: account1.
	
	self assert: 550 * peso equals: account1 balance.
	self assert: 550 * peso equals: account2 balance.! !

!ReceptiveAccountTest methodsFor: 'tests - multiple operations' stamp: 'JGC 6/6/2022 00:12:50'!
test13SeRegistraronMuchasTransferencias
	
	| transfer1 transfer2 |
	Deposit register: 1000 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	transfer1 _ AccountTransfer registerWith: 300 * peso from: account1 to: account2.
	transfer2 _ AccountTransfer registerWith: 200 * peso from: account2 to: account1.
	
	self assert: (account1 hasRegistered: transfer1 extractionLeg).
	self assert: (account2 hasRegistered: transfer1 depositLeg).
	
	self assert: (account1 hasRegistered: transfer2 depositLeg).
	self assert: (account2 hasRegistered: transfer2 extractionLeg).
	
	! !


!ReceptiveAccountTest methodsFor: 'tests - invalid operations' stamp: 'JGC 6/6/2022 00:33:57'!
test14NoPuedoRetirarSiNoTengoPlata

	self should: [Withdraw register: 50 * peso on: account1] 
		raise: Error
		withExceptionDo: [:anError | self assert: AccountTransaction insufficientFundsErrorDescription equals: anError messageText ].! !

!ReceptiveAccountTest methodsFor: 'tests - invalid operations' stamp: 'JGC 6/6/2022 00:33:54'!
test15NoPuedoTransferirSiNoTengoPlata

	self should: [AccountTransfer registerWith: 50 * peso from: account1 to: account2 ] 
		raise: Error
		withExceptionDo: [:anError | self assert: AccountTransaction insufficientFundsErrorDescription equals: anError messageText ].! !

!ReceptiveAccountTest methodsFor: 'tests - invalid operations' stamp: 'JGC 6/6/2022 00:39:27'!
test16NoPuedoDepositarUnObjetoInvalido

	self should: [ Deposit register: #gallinas on: account1 ] 
		raise: Error
		withExceptionDo: [:anError | self assert: AccountTransaction cannotOperateWithInvalidValueErrorDescription equals: anError messageText ].! !

!ReceptiveAccountTest methodsFor: 'tests - invalid operations' stamp: 'JGC 6/6/2022 00:39:53'!
test17NoPuedoTransferirUnObjetoInvalido

	self should: [ AccountTransfer registerWith: #koalas from: account1 to: account2 ] 
		raise: Error
		withExceptionDo: [ :anError | self assert: AccountTransaction cannotOperateWithInvalidValueErrorDescription equals: anError messageText ].! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'sm 6/5/2022 19:53:12'!
setUp

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'accessing' stamp: 'JGC 6/5/2022 21:13:56'!
value 

	^ value.! !


!AccountTransaction methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:04:21'!
alter: aBalance
 
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'initialization' stamp: 'JGC 6/5/2022 21:13:12'!
initializeFor: aValue

	value _ aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'error description' stamp: 'JGC 6/6/2022 00:35:10'!
cannotOperateWithInvalidValueErrorDescription

	^ 'value is invalid'.! !

!AccountTransaction class methodsFor: 'error description' stamp: 'JGC 6/6/2022 00:18:10'!
insufficientFundsErrorDescription

	^ 'insufficient funds in account'.! !


!AccountTransaction class methodsFor: 'testing' stamp: 'JGC 6/6/2022 00:40:51'!
canPerformTransactionOn: anAccount withValue: aValue 

	self subclassResponsibility! !


!AccountTransaction class methodsFor: 'asserting' stamp: 'JGC 6/6/2022 00:41:18'!
assertCanOperateOn: anAccount withValue: aValue

	^ (self canPerformTransactionOn: anAccount withValue: aValue) ifFalse: [ self error: self insufficientFundsErrorDescription ]! !

!AccountTransaction class methodsFor: 'asserting' stamp: 'JGC 6/6/2022 00:38:27'!
assertValueIsValid: aValue

	^ (aValue isKindOf: SimpleMeasure) ifFalse: [ self error: self cannotOperateWithInvalidValueErrorDescription ]! !


!AccountTransaction class methodsFor: 'instance creation' stamp: 'JGC 6/5/2022 23:59:53'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JGC 6/6/2022 00:37:04'!
register: aValue on: anAccount

	| transaction |
	
	self assertValueIsValid: aValue.
	self assertCanOperateOn: anAccount withValue: aValue.
	
	transaction := self for: aValue.
	anAccount register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:03:56'!
alter: aBalance

	^ aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'testing' stamp: 'JGC 6/6/2022 00:40:57'!
canPerformTransactionOn: anAccount withValue: aValue 

	^ true.! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositLeg
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'JGC 6/5/2022 23:54:25'!
alter: aBalance

	^ aBalance + value.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'JGC 6/5/2022 23:57:43'!
associateCounterpart: aTransactionLeg

	counterpart _ aTransactionLeg.! !

!DepositLeg methodsFor: 'as yet unclassified' stamp: 'JGC 6/5/2022 23:54:49'!
counterpart
	
	^ counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositLeg class' category: 'ServiciosFinancieros-Ejercicio'!
DepositLeg class
	instanceVariableNames: ''!

!DepositLeg class methodsFor: 'testing' stamp: 'JGC 6/6/2022 00:41:00'!
canPerformTransactionOn: anAccount withValue: aValue 

	^ true.! !


!classDefinition: #ExtractionLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #ExtractionLeg
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ExtractionLeg methodsFor: 'as yet unclassified' stamp: 'JGC 6/5/2022 23:54:33'!
alter: aBalance

	^ aBalance - value.! !

!ExtractionLeg methodsFor: 'as yet unclassified' stamp: 'JGC 6/5/2022 23:57:33'!
associateCounterpart: aTransactionLeg

	counterpart _ aTransactionLeg.! !

!ExtractionLeg methodsFor: 'as yet unclassified' stamp: 'JGC 6/5/2022 23:55:17'!
counterpart

	^ counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ExtractionLeg class' category: 'ServiciosFinancieros-Ejercicio'!
ExtractionLeg class
	instanceVariableNames: ''!

!ExtractionLeg class methodsFor: 'testing' stamp: 'JGC 6/6/2022 00:40:51'!
canPerformTransactionOn: anAccount withValue: aValue 

	^ (anAccount balance < aValue) not.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:03:47'!
alter: aBalance

	^ aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'testing' stamp: 'JGC 6/6/2022 00:41:08'!
canPerformTransactionOn: anAccount withValue: aValue 

	^ (anAccount balance < aValue) not.! !


!classDefinition: #AccountTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'valueToTransfer value extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransfer methodsFor: 'initialization' stamp: 'JGC 6/5/2022 23:59:12'!
initializeWithValue: aValueToTransfer from: aTransferringAccount to: aReceivingAccount   

	value _ aValueToTransfer.
	
	extractionLeg _ ExtractionLeg register: value on: aTransferringAccount.
	depositLeg _ DepositLeg register: value on: aReceivingAccount.
	
	extractionLeg associateCounterpart: depositLeg.
	depositLeg associateCounterpart: extractionLeg.! !


!AccountTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 23:46:27'!
depositLeg
	
	^ depositLeg.! !

!AccountTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 23:46:18'!
extractionLeg

	^ extractionLeg.! !

!AccountTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 21:14:30'!
value

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer class
	instanceVariableNames: ''!

!AccountTransfer class methodsFor: 'instance creation' stamp: 'JGC 6/5/2022 23:46:05'!
registerWith: aValueToTransfer from: aTransferringAccount to: aReceivingAccount

	^ self new initializeWithValue: aValueToTransfer from: aTransferringAccount to: aReceivingAccount.! !


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
