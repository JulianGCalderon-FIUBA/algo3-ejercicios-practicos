!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account1 account2 account3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:05:32'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	self assert: 0 equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:05:52'!
test02DepositIncreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
		
	self assert: 100 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:06:00'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	Deposit register: 100 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
		
	self assert: 50 * peso equals: account1 balance
! !

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:06:16'!
test04WithdrawValueMustBePositive 

	| withdrawValue |

	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account1) value
! !

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:35:45'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit := Deposit register: 100 * peso on: account1.
	withdraw := Withdraw register: 50 * peso on: account1.
		
	self assert: (account1 hasRegisteredATransaction: deposit).
	self assert: (account1 hasRegisteredATransaction: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:35:45'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account1 hasRegisteredATransaction: deposit).
	self deny: (account1 hasRegisteredATransaction: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests - transaction' stamp: 'sm 6/5/2022 17:06:51'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	account1 := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit).
! !


!ReceptiveAccountTest methodsFor: 'tests - invalid operations' stamp: 'sm 6/5/2022 19:13:19'!
test20NoPodesExtraerMasPlataDeLaQueTenes

	Withdraw register: 100 * peso on: account1.! !


!ReceptiveAccountTest methodsFor: 'tests - multiple operations' stamp: 'sm 6/5/2022 18:27:11'!
test16SeRegistranMuchasTransferencias

	| transfer1 transfer2 transfer3 |
	Deposit register: 1000 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	transfer1 := AccountTransfer registerWith: 120 * peso from: account1 to: account2.
	transfer2 := AccountTransfer registerWith: 3 * peso from: account1 to: account2.
	transfer3 := AccountTransfer registerWith: 600 * peso from: account1 to: account2.
	
	self assert: (account1 hasRegisteredATransfer: transfer1).
	self assert: (account1 hasRegisteredATransfer: transfer2).
	self assert: (account1 hasRegisteredATransfer: transfer3).! !

!ReceptiveAccountTest methodsFor: 'tests - multiple operations' stamp: 'sm 6/5/2022 18:23:36'!
test17MuchasTransferenciasConDevoluciones

	Deposit register: 1000 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	AccountTransfer registerWith: 700 * peso from: account1 to: account2.
	AccountTransfer registerWith: 750 * peso from: account2 to: account1.

	self assert: 1050 * peso equals: account1 balance.
	self assert: 50 * peso equals: account2 balance.! !

!ReceptiveAccountTest methodsFor: 'tests - multiple operations' stamp: 'sm 6/5/2022 18:26:36'!
test18MuchasTransferenciasACuentaConPlata

	Deposit register: 1000 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	AccountTransfer registerWith: 120 * peso from: account1 to: account2.
	AccountTransfer registerWith: 3 * peso from: account1 to: account2.
	AccountTransfer registerWith: 600 * peso from: account1 to: account2.
	
	self assert: 823 * peso equals: account2 balance.! !

!ReceptiveAccountTest methodsFor: 'tests - multiple operations' stamp: 'sm 6/5/2022 18:30:33'!
test19TransferenciasEntreMultiplesCuentas

	Deposit register: 1000 * peso on: account1.
	Deposit register: 100 * peso on: account2.
	
	AccountTransfer registerWith: 120 * peso from: account1 to: account2.
	AccountTransfer registerWith: 700 * peso from: account1 to: account3.
	
	AccountTransfer registerWith: 400 * peso from: account3 to: account1. 
	
	self assert: 580 * peso equals: account1 balance.
	self assert: 220 * peso equals: account2 balance.
	self assert: 300 * peso equals: account3 balance.! !


!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 17:12:06'!
test08registrar

	| transfer aValue |
	
	aValue := 50 * peso.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: aValue equals: transfer value.
	
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 18:10:37'!
test09laPataDeExtraccionEsLaCorrecta

	| transfer aValue |
	
	aValue := 50 * peso.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: account1 equals: transfer extractionLeg account.
	
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 18:11:09'!
test10laPataDeDepositoEsLaCorrecta

	| transfer aValue |
	
	aValue := 50 * peso.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: account2 equals: transfer depositLeg account.
	
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 17:37:09'!
test11laPataDeExtraccionRegistraLaTransferencia

	| transfer aValue |
	
	aValue := 50 * peso.
	Deposit register: aValue on: account1.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: (account1 hasRegisteredATransfer: transfer).
	self assert: (account2 hasRegisteredATransfer: transfer).
	
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 17:48:58'!
test12SeRestaPlataDeLaPataDeExtraccion

	| transfer aValue |
	
	aValue := 50 * peso.
	Deposit register: aValue on: account1.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: 0 * peso equals: account1 balance.
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 17:54:14'!
test13SeSumaPlataDeLaPataDeDeposito

	| transfer aValue |
	
	aValue := 50 * peso.
	Deposit register: aValue on: account1.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: 50 * peso equals: account2 balance.
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 18:02:32'!
test14LaPataDeExtraccionConoceASuContraparte

	| transfer aValue |
	
	aValue := 50 * peso.
	Deposit register: aValue on: account1.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: account2 equals: transfer extractionLeg counterpart.
	 ! !

!ReceptiveAccountTest methodsFor: 'tests - transfer' stamp: 'sm 6/5/2022 18:13:13'!
test15LaPataDeDepositoConoceASuContraparte

	| transfer aValue |
	
	aValue := 50 * peso.
	Deposit register: aValue on: account1.
	transfer := AccountTransfer registerWith: aValue from: account1 to: account2.
	
	self assert: account1 equals: transfer depositLeg counterpart.
	 ! !


!ReceptiveAccountTest methodsFor: 'setUp' stamp: 'sm 6/5/2022 18:28:24'!
setUp

	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance alteration' stamp: 'sm 6/5/2022 17:46:45'!
alter: aBalance

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'sm 6/5/2022 17:34:08'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account registerTransaction: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance alteration' stamp: 'sm 6/5/2022 17:46:24'!
alter: aBalance

	^aBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'sm 6/5/2022 16:57:18'!
value

	^ value! !


!Withdraw methodsFor: 'balance alteration' stamp: 'sm 6/5/2022 17:46:31'!
alter: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'value extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransfer methodsFor: 'initialization' stamp: 'sm 6/5/2022 18:12:31'!
initializeTransferWith: aValueToTransfer from: aTransferringAccount to: aReceivingAccount 
	
	value := aValueToTransfer.
	extractionLeg := TransferLeg createWithAccount: aTransferringAccount andCounterpart: aReceivingAccount.
	depositLeg := TransferLeg createWithAccount: aReceivingAccount andCounterpart: aTransferringAccount .! !


!AccountTransfer methodsFor: 'accessing' stamp: 'sm 6/5/2022 17:22:14'!
depositLeg
	^depositLeg.! !

!AccountTransfer methodsFor: 'accessing' stamp: 'sm 6/5/2022 18:02:53'!
extractionLeg

	^extractionLeg! !

!AccountTransfer methodsFor: 'accessing' stamp: 'sm 6/5/2022 18:00:30'!
value

	^ value.! !


!AccountTransfer methodsFor: 'balance alteration' stamp: 'sm 6/5/2022 18:12:07'!
alter: aBalance as: aReceptiveAccount

	aReceptiveAccount = extractionLeg account ifTrue: [^aBalance - value ].
	aReceptiveAccount = depositLeg account ifTrue: [^aBalance + value ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer class
	instanceVariableNames: ''!

!AccountTransfer class methodsFor: 'instance creation' stamp: 'sm 6/5/2022 17:37:01'!
registerWith: aValueToTransfer from: aTransferingAccount to: aReceivingAccount 

	| transfer |
	 transfer := self new initializeTransferWith: aValueToTransfer from: aTransferingAccount to: aReceivingAccount. 

	aTransferingAccount registerTransfer: transfer.
	aReceivingAccount registerTransfer: transfer.
	
	^transfer.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions transfers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'sm 6/5/2022 17:35:03'!
initialize

	transactions := OrderedCollection new.
	transfers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sm 6/5/2022 17:51:48'!
balance

	| totalBalance |
	
	totalBalance _ 0.
	
	totalBalance _ transactions inject: totalBalance into: [ :balance :aTransaction | aTransaction alter: balance].
	totalBalance _ transfers inject: totalBalance into: [ :balance :aTransfer | aTransfer alter: balance as: self].
	
	^totalBalance.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sm 6/5/2022 17:35:45'!
hasRegisteredATransaction: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sm 6/5/2022 17:36:03'!
hasRegisteredATransfer: aTransfer

	^ transfers includes: aTransfer. 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sm 6/5/2022 17:34:08'!
registerTransaction: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'sm 6/5/2022 17:34:46'!
registerTransfer: aTransfer

	transfers add: aTransfer.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferLeg
	instanceVariableNames: 'account counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'sm 6/5/2022 18:05:41'!
initializeCreateWithAccount: aReceptiveAccount

	account := aReceptiveAccount.! !

!TransferLeg methodsFor: 'as yet unclassified' stamp: 'sm 6/5/2022 18:09:53'!
initializeCreateWithAccount: anAccount andCounterpart: aCounterpartAccount

	account := anAccount.
	counterpart := aCounterpartAccount.! !


!TransferLeg methodsFor: 'accessing' stamp: 'sm 6/5/2022 18:10:47'!
account
	^account! !

!TransferLeg methodsFor: 'accessing' stamp: 'sm 6/5/2022 18:10:15'!
counterpart
	^counterpart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'sm 6/5/2022 18:04:50'!
createWithAccount: aReceptiveAccount 

	^self new initializeCreateWithAccount: aReceptiveAccount ! !

!TransferLeg class methodsFor: 'instance creation' stamp: 'sm 6/5/2022 18:09:14'!
createWithAccount: anAccount andCounterpart: aCounterpartAccount 

	^self new initializeCreateWithAccount: anAccount andCounterpart: aCounterpartAccount ! !
