!classDefinition: #AccountsTransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #AccountsTransferTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountsTransferTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 20:16:19'!
test01TransferKnowsItsValue

	| transfer value |
	
	value _ 50 * peso.
	transfer _ AccountsTransfer registerWith: value from: account1 to: account2.
	
	self assert: value equals: transfer value.
	
	! !

!AccountsTransferTest methodsFor: 'tests' stamp: 'sm 6/7/2022 23:10:34'!
test02DepositLegsIsRegisteredInReceivingAccount

	self assertAccount: account2 registered: #depositLeg afterTransferringFrom: account1 to: account2.! !

!AccountsTransferTest methodsFor: 'tests' stamp: 'sm 6/7/2022 23:10:17'!
test03ExtractionLegsIsRegisteredInTransferringAccount

	self assertAccount: account1 registered: #extractionLeg afterTransferringFrom: account1 to: account2.! !

!AccountsTransferTest methodsFor: 'tests' stamp: 'sm 6/7/2022 23:20:57'!
test04TransferDecreasesBalanceFromTransferringAccount

	| value |
	value _ 50 * peso.
	
	self assertBalanceInAccount: account1 equals: value negated
		afterTransferring: value from: account1 to: account2.
	! !

!AccountsTransferTest methodsFor: 'tests' stamp: 'sm 6/7/2022 23:21:37'!
test05TransferIncreasesBalanceFromReceivingAccount

	| value |
	value _ 50 * peso.
	
	self assertBalanceInAccount: account2 equals: value 
		afterTransferring: value from: account1 to: account2.
	! !


!AccountsTransferTest methodsFor: 'setup' stamp: 'JGC 6/7/2022 20:14:47'!
setUp

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	! !


!AccountsTransferTest methodsFor: 'asserts' stamp: 'sm 6/7/2022 23:09:46'!
assertAccount: anAccount registered: aTransferCollaborator afterTransferringFrom: aTransferringAccount to: aReceivingAccount 
	
	| transfer |
	
	transfer _ AccountsTransfer registerWith: 50 * peso from: aTransferringAccount to: aReceivingAccount.
	
	self assert: (anAccount hasRegistered: (aTransferCollaborator asMessage sendTo: transfer)).! !

!AccountsTransferTest methodsFor: 'asserts' stamp: 'sm 6/7/2022 23:19:31'!
assertBalanceInAccount: anAccount equals: aBalance afterTransferring: anAmountToTransfer from: aTransferringAccount to: aReceivingAccount

	AccountsTransfer registerWith: anAmountToTransfer from: aTransferringAccount to: aReceivingAccount.

	self assert: aBalance equals: anAccount balance.! !


!classDefinition: #PortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTests
	instanceVariableNames: 'account1 account2 account3 portfolioWithOneAccount portfolioWithTwoAccounts portfolioWithInnerPortfolio portfolioWithInnerPortfolioAndAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'setup' stamp: 'sm 6/7/2022 23:34:30'!
setUp

	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	Deposit register: 50 * peso on: account2.
	Deposit register: 50 * peso on: account3.
	
	portfolioWithOneAccount _ Portfolio createWithEntities: {account1}.
	portfolioWithTwoAccounts _ Portfolio createWithEntities: {account1. account2}.
	portfolioWithInnerPortfolio _ Portfolio createWithEntities: {portfolioWithTwoAccounts}.
	portfolioWithInnerPortfolioAndAccount _ Portfolio createWithEntities: {portfolioWithTwoAccounts. account3}.
! !


!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:34:47'!
test01PortfolioWithOneAccountHasSameBalanceAsAccount

	self assert: account1 balance equals: portfolioWithOneAccount balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:35:09'!
test02PortfolioWithTwoAccountsSumsBalanceFromBothAccounts
	
	self assert: account1 balance + account2 balance equals: portfolioWithTwoAccounts balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:35:18'!
test03PortfolioWithInnerPortfolioSumsBalanceFromInnerPortfolio
		
	self assert: portfolioWithTwoAccounts balance equals: portfolioWithInnerPortfolio balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:33:04'!
test04PortfolioWithInnerPortfolioAndAnAccountSumsBalanceFromAllEntities
		
	self assert: portfolioWithTwoAccounts balance + account3 balance equals: portfolioWithInnerPortfolioAndAccount balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:39:02'!
test05PortfolioWithOneAccountKnowsRegisteredTransactions

	| deposit | 
	
	deposit := Deposit register: 50 * peso on: account1.
	
	self assert: (self entity: portfolioWithOneAccount hasRegistered: {deposit}).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:39:42'!
test06PortfolioWithTwoAccountsKnowsRegisteredTransactions

	| deposit1 deposit2 | 
	
	deposit1 _ Deposit register: 50 * peso on: account1.
	deposit2 _ Deposit register: 50 * peso on: account2.
	
	self assert: (self entity: portfolioWithTwoAccounts hasRegistered: {deposit1. deposit2}).! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:39:53'!
test07PortfolioWithInnerPortfolioKnowsRegisteredTransactions

	| deposit1 deposit2 | 
	
	deposit1 _ Deposit register: 50 * peso on: account1.
	deposit2 _ Deposit register: 50 * peso on: account2.

	self assert: (self entity: portfolioWithInnerPortfolio hasRegistered: {deposit1. deposit2}).! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:40:12'!
test08PortfolioWithInnerPortfolioAndAnAccountKnowsRegisteredTransactions

	| value deposit1 deposit2 deposit3 |
	 
	value _ 50 * peso.
	deposit1 _ Deposit register: value on: account1.
	deposit2 _ Deposit register: value on: account2.
	deposit3 _ Deposit register: value on: account3.
		
	self assert: (self entity: portfolioWithInnerPortfolioAndAccount hasRegistered: {deposit1. deposit2. deposit3}).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:35:49'!
test09PortfolioWithOneAccountCanAccessAccountTransactions

	self assert: account1 transactions equals: portfolioWithOneAccount transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:35:53'!
test10PortfolioWithTwoAccountsCanAccessAccountTransactions

	self assert: account1 transactions, account2 transactions equals: portfolioWithTwoAccounts transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:35:58'!
test11PortfolioWithInnerPortfolioCanAccessAccountTransactions
	
	self assert: portfolioWithTwoAccounts transactions equals: portfolioWithInnerPortfolio transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'sm 6/7/2022 23:36:03'!
test12PortfolioWithInnerPortfolioAndAnAccountCanAccessAccountTransactions

	self assert: portfolioWithTwoAccounts transactions, account3 transactions equals: portfolioWithInnerPortfolioAndAccount transactions.
	! !


!PortfolioTests methodsFor: 'testing' stamp: 'sm 6/7/2022 23:38:23'!
entity: anEntity hasRegistered: transactions

	^ transactions allSatisfy: [ :aTransaction | anEntity hasRegistered: aTransaction ].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'asserts' stamp: 'JGC 6/7/2022 19:53:47'!
assertBalanceIsCorrectAfterDepositing: anAmountToDeposit andWithdrawing: anAmountToWithdraw from: anAccount.

	anAmountToDeposit > 0 ifTrue: [ Deposit register: anAmountToDeposit on: anAccount].
	anAmountToWithdraw > 0 ifTrue: [ Withdraw register: anAmountToWithdraw on: anAccount].
	
	self assert: anAmountToDeposit - anAmountToWithdraw equals: anAccount balance.! !

!ReceptiveAccountTest methodsFor: 'asserts' stamp: 'JGC 6/7/2022 20:33:37'!
should: aBlockThatShouldFail raiseErrorWithErrorDescription: errorMessage

	self should: aBlockThatShouldFail
		raise: Error
		withExceptionDo: [:anError | self assert: errorMessage equals: anError messageText ].! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 19:54:15'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 
	
	self assertBalanceIsCorrectAfterDepositing: 0 * peso andWithdrawing: 0 * peso from: account1.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 19:54:25'!
test02DepositIncreasesBalanceOnTransactionValue 
	
	self assertBalanceIsCorrectAfterDepositing: 100 * peso andWithdrawing: 0 * peso from: account1.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 19:54:36'!
test03WithdrawDecreasesBalanceOnTransactionValue 
	
	self assertBalanceIsCorrectAfterDepositing: 100 * peso andWithdrawing: 50 * peso from: account1.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 19:57:44'!
test04WithdrawValueMustBePositive 

	| withdraw value |
	value _ 50 * peso.
	
	withdraw _ Withdraw register: value on: account1.	
	
	self assert: value equals: withdraw value.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 20:06:31'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| deposit withdraw |
	
	deposit _ Deposit register: 100 * peso on: account1.
	withdraw _ Withdraw register: 50 * peso on: account1.
		
	self assert: (self account: account1 hasRegistered: {deposit.withdraw}).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 20:06:47'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw |
	
	deposit _ Deposit for: 100 * peso.
	withdraw _ Withdraw for: 50 * peso.
	
	self deny: (self account: account1 hasRegistered: {deposit.withdraw}).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 20:09:48'!
test07AccountKnowsItsTransactions 

	| deposit |
	
	deposit _ Deposit register: 50 * peso on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 20:36:57'!
test08CannotRegisterATransactionWithInvalidObject
		
	self should: [ Deposit register: #pandas on: account1 ] raiseErrorWithErrorDescription: AccountTransaction invalidValueErrorDescription.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'JGC 6/7/2022 20:36:53'!
test09CannotRegisterATransactionOnInvalidAccount
		
	self should: [ Deposit register: 50 * peso on: #koalas ] raiseErrorWithErrorDescription: AccountTransaction invalidAccountErrorDescription.! !


!ReceptiveAccountTest methodsFor: 'setup' stamp: 'JGC 6/7/2022 20:03:18'!
account: anAccount hasRegistered: transactions

	^ transactions allSatisfy: [ :aTransaction | anAccount hasRegistered: aTransaction ].! !

!ReceptiveAccountTest methodsFor: 'setup' stamp: 'sm 6/6/2022 21:12:33'!
setUp

	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	! !


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

!AccountTransaction class methodsFor: 'error description' stamp: 'JGC 6/7/2022 20:31:14'!
invalidAccountErrorDescription

	^ 'account is invalid'.! !

!AccountTransaction class methodsFor: 'error description' stamp: 'JGC 6/7/2022 19:38:36'!
invalidValueErrorDescription

	^ 'value is invalid'.! !


!AccountTransaction class methodsFor: 'asserting' stamp: 'JGC 6/7/2022 20:31:06'!
assertAccountIsValid: anAccount

	^ (anAccount isKindOf: ReceptiveAccount ) ifFalse: [ self error: self invalidAccountErrorDescription. ].! !

!AccountTransaction class methodsFor: 'asserting' stamp: 'JGC 6/7/2022 19:39:34'!
assertValueIsValid: aValue

	^ (aValue isKindOf: SimpleMeasure) ifFalse: [ self error: self invalidValueErrorDescription. ].! !


!AccountTransaction class methodsFor: 'instance creation' stamp: 'JGC 6/7/2022 19:39:43'!
for: aValue

	^ self new initializeFor: aValue.! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JGC 6/7/2022 20:30:22'!
register: aValue on: anAccount

	| transaction |
	
	self assertValueIsValid: aValue.
	self assertAccountIsValid: anAccount.
	
	transaction := self for: aValue.
	
	anAccount register: transaction.
		
	^ transaction.! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:03:56'!
alter: aBalance

	^ aBalance + value.! !


!classDefinition: #DepositLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositLeg
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositLeg methodsFor: 'counterpart' stamp: 'JGC 6/5/2022 23:57:43'!
associateCounterpart: aTransactionLeg

	counterpart _ aTransactionLeg.! !

!DepositLeg methodsFor: 'counterpart' stamp: 'JGC 6/5/2022 23:54:49'!
counterpart
	
	^ counterpart.! !


!DepositLeg methodsFor: 'balance altering' stamp: 'JGC 6/7/2022 19:41:31'!
alter: aBalance

	^ aBalance + value.
	
	" ^Deposit new alter: aBalance. "! !


!classDefinition: #ExtractionLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #ExtractionLeg
	instanceVariableNames: 'counterpart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ExtractionLeg methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 23:54:33'!
alter: aBalance

	^ aBalance - value.! !


!ExtractionLeg methodsFor: 'counterpart' stamp: 'JGC 6/5/2022 23:57:33'!
associateCounterpart: aTransactionLeg

	counterpart _ aTransactionLeg.! !

!ExtractionLeg methodsFor: 'counterpart' stamp: 'JGC 6/5/2022 23:55:17'!
counterpart

	^ counterpart.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'balance altering' stamp: 'JGC 6/5/2022 21:03:47'!
alter: aBalance

	^ aBalance - value.! !


!classDefinition: #AccountsTransfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountsTransfer
	instanceVariableNames: 'valueToTransfer value extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountsTransfer methodsFor: 'initialization' stamp: 'JGC 6/7/2022 19:45:29'!
initializeWithValue: aValueToTransfer from: aTransferringAccount to: aReceivingAccount   

	value _ aValueToTransfer.
	
	extractionLeg _ ExtractionLeg register: value on: aTransferringAccount.
	depositLeg _ DepositLeg register: value on: aReceivingAccount.
	
	extractionLeg associateCounterpart: depositLeg.
	depositLeg associateCounterpart: extractionLeg.
	
	" rompe heuristica objetos completos "! !


!AccountsTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 23:46:27'!
depositLeg
	
	^ depositLeg.! !

!AccountsTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 23:46:18'!
extractionLeg

	^ extractionLeg.! !

!AccountsTransfer methodsFor: 'accessing' stamp: 'JGC 6/5/2022 21:14:30'!
value

	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountsTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
AccountsTransfer class
	instanceVariableNames: ''!

!AccountsTransfer class methodsFor: 'instance creation' stamp: 'JGC 6/5/2022 23:46:05'!
registerWith: aValueToTransfer from: aTransferringAccount to: aReceivingAccount

	^ self new initializeWithValue: aValueToTransfer from: aTransferringAccount to: aReceivingAccount.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios entities'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'JGC 6/7/2022 19:25:31'!
initializeWithEntities: entitiesToGroup 
	
	entities _ entitiesToGroup.! !


!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:35:36'!
balance
	
	^ entities sum: [ :anEntity | anEntity balance. ] ifEmpty: [ 0 * peso. ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:35:26'!
hasRegistered: aTransaction 
	
	^ entities anySatisfy: [ :anEntity | anEntity hasRegistered: aTransaction. ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:46:35'!
transactions
	
	^ entities inject: OrderedCollection new into: [ :transactions :anEntity | transactions, anEntity transactions ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'JGC 6/7/2022 19:25:31'!
createWithEntities: entitiesToGroup 
	
	^self new initializeWithEntities: entitiesToGroup asOrderedCollection.! !


!Portfolio class methodsFor: 'error descriptions' stamp: 'sm 6/6/2022 21:09:58'!
accountIsNotInPortfolioErrorDescription

	^ 'account is not in portfolio'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:44:02'!
balance

	^ transactions inject: 0 into: [:balance :aTransaction | aTransaction alter: balance]. ! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:44:12'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:44:15'!
register: aTransaction

	transactions add: aTransaction.
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JGC 6/7/2022 19:44:18'!
transactions 

	^ transactions copy.! !
