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

!ReceptiveAccountTest methodsFor: 'tests - transactions' stamp: 'JGC 6/5/2022 21:00:18'!
test04WithdrawValueMustBePositive 

	| withdraw value |

	value _ 50 * peso.
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


!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JGC 6/5/2022 21:09:21'!
test08RegistraConValor

	| transfer value |
	
	value _ 50 * peso.
	transfer _ AccountTransfer registerWith: value from: account1 to: account2.
	
	self assert: value equals: transfer value.
	
	! !

!ReceptiveAccountTest methodsFor: 'tests - transfers' stamp: 'JGC 6/5/2022 21:20:30'!
test09RegistraEnLasCuentas

	| transfer value |
	
	transfer _ AccountTransfer registerWith: 50 * peso from: account1 to: account2.
	
	self assert: (account1 hasRegistered: transfer withdraw).
	self assert: (account1 hasRegistered: transfer deposit).! !


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

!Deposit methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:03:56'!
alter: aBalance

	^ aBalance + value.! !

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

!Withdraw methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:03:47'!
alter: aBalance

	^ aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #AccountTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransfer
	instanceVariableNames: 'valueToTransfer value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransfer methodsFor: 'initialization' stamp: 'JGC 6/5/2022 21:10:53'!
initializeWithValue: aValueToTransfer 

	value := aValueToTransfer.! !


!AccountTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 21:14:30'!
value

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransfer class
	instanceVariableNames: ''!

!AccountTransfer class methodsFor: 'instance creation' stamp: 'JGC 6/5/2022 21:10:34'!
registerWith: aValueToTransfer from: aReceivingAccount to: aTransferringAccount

	^self new initializeWithValue: aValueToTransfer.! !


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
