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


!AccountsTransferTest methodsFor: 'setup' stamp: 'JGC 6/8/2022 23:48:14'!
setUp

	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	! !


!AccountsTransferTest methodsFor: 'asserts' stamp: 'JGC 6/8/2022 23:48:52'!
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
	instanceVariableNames: 'account1 account2 account3 portfolioWithAccount1 portfolioWithAccounts1And2 portfolioWithInnerPortfolioWithAccounts1And2 portfolioWithAccount3AndInnerPortfolioWithAccounts1And2 portfolioEmpty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTests methodsFor: 'setup' stamp: 'JGC 6/8/2022 23:52:29'!
setUp

	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	account3 _ ReceptiveAccount new.
	
	Deposit register: 50 * peso on: account1.
	Deposit register: 75 * peso on: account2.
	Deposit register: 100 * peso on: account3.
	
	portfolioWithAccount1 _ Portfolio createWith: {account1}.
	portfolioWithAccounts1And2 _ Portfolio createWith: {account1. account2}.
	portfolioWithInnerPortfolioWithAccounts1And2 _ Portfolio createWith: {portfolioWithAccounts1And2}.
	portfolioWithAccount3AndInnerPortfolioWithAccounts1And2 _ Portfolio createWith: {portfolioWithAccounts1And2. account3}.
	
	portfolioEmpty _ Portfolio new.
! !


!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:10'!
test01PortfolioWithOneAccountHasSameBalanceAsAccount

	self assert: account1 balance equals: portfolioWithAccount1 balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:27'!
test02PortfolioWithTwoAccountsSumsBalanceFromBothAccounts
	
	self assert: account1 balance + account2 balance equals: portfolioWithAccounts1And2 balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:38'!
test03PortfolioWithInnerPortfolioSumsBalanceFromInnerPortfolio
		
	self assert: portfolioWithAccounts1And2 balance equals: portfolioWithInnerPortfolioWithAccounts1And2 balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:09:19'!
test04PortfolioWithInnerPortfolioAndAnAccountSumsBalanceFromAllEntities
		
	self assert: portfolioWithAccounts1And2 balance + account3 balance equals: portfolioWithAccount3AndInnerPortfolioWithAccounts1And2 balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:15:46'!
test05PortfolioWithOneAccountKnowsRegisteredTransactions

	| deposit | 
	
	deposit := Deposit register: 50 * peso on: account1.
	
	self assert: (self portfolio: portfolioWithAccount1 hasRegistered: {deposit}).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:15:46'!
test06PortfolioWithTwoAccountsKnowsRegisteredTransactions

	| deposit1 deposit2 | 
	
	deposit1 _ Deposit register: 50 * peso on: account1.
	deposit2 _ Deposit register: 50 * peso on: account2.
	
	self assert: (self portfolio: portfolioWithAccounts1And2 hasRegistered: {deposit1. deposit2}).! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:15:46'!
test07PortfolioWithInnerPortfolioKnowsRegisteredTransactions

	| deposit1 deposit2 | 
	
	deposit1 _ Deposit register: 50 * peso on: account1.
	deposit2 _ Deposit register: 50 * peso on: account2.

	self assert: (self portfolio: portfolioWithInnerPortfolioWithAccounts1And2 hasRegistered: {deposit1. deposit2}).! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:15:46'!
test08PortfolioWithInnerPortfolioAndAnAccountKnowsRegisteredTransactions

	| value deposit1 deposit2 deposit3 |
	 
	value _ 50 * peso.
	deposit1 _ Deposit register: value on: account1.
	deposit2 _ Deposit register: value on: account2.
	deposit3 _ Deposit register: value on: account3.
		
	self assert: (self portfolio: portfolioWithAccount3AndInnerPortfolioWithAccounts1And2 hasRegistered: {deposit1. deposit2. deposit3}).
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:10'!
test09PortfolioWithOneAccountCanAccessAccountTransactions

	self assert: account1 transactions equals: portfolioWithAccount1 transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:27'!
test10PortfolioWithTwoAccountsCanAccessAccountTransactions

	self assert: account1 transactions, account2 transactions equals: portfolioWithAccounts1And2 transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:38'!
test11PortfolioWithInnerPortfolioCanAccessAccountTransactions
	
	self assert: portfolioWithAccounts1And2 transactions equals: portfolioWithInnerPortfolioWithAccounts1And2 transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:09:19'!
test12PortfolioWithInnerPortfolioAndAnAccountCanAccessAccountTransactions

	self assert: portfolioWithAccounts1And2 transactions, account3 transactions equals: portfolioWithAccount3AndInnerPortfolioWithAccounts1And2 transactions.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:01:37'!
test13PortfolioCanAddAccountAfterCreation

	portfolioEmpty add: account1.
	
	self assert: account1 balance equals: portfolioEmpty balance.
	! !

!PortfolioTests methodsFor: 'tests' stamp: 'JGC 6/8/2022 20:08:10'!
test14PortfolioCanAddPortfolioAfterCreation

	portfolioEmpty add: portfolioWithAccount1.
	
	self assert: portfolioWithAccount1 balance equals: portfolioEmpty balance.
	! !


!PortfolioTests methodsFor: 'testing' stamp: 'JGC 6/9/2022 12:15:55'!
portfolio: aPortfolio hasRegistered: transactions

	^ transactions allSatisfy: [ :aTransaction | aPortfolio hasRegistered: aTransaction ].! !


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


!classDefinition: #ValidPortfolioTests category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ValidPortfolioTests
	instanceVariableNames: 'account1 portfolioWithAccount1 portfolioEmpty portfolioWithInnerPortfolioWithAccount1 portfolioWithAccount2 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ValidPortfolioTests methodsFor: 'setup' stamp: 'JGC 6/8/2022 23:39:35'!
setUp

	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	portfolioWithAccount1 _ Portfolio createWith: {account1}.
	portfolioWithAccount2 _ Portfolio createWith: {account2}.
	portfolioEmpty _ Portfolio new.
	portfolioWithInnerPortfolioWithAccount1 _ Portfolio createWith: {portfolioWithAccount1}.! !


!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:23'!
test01PortfolioWithAccountCannotAddSameAccount

	self shouldAdding: account1 to: portfolioWithAccount1 raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:23'!
test02PortfolioWithInnerPortfolioWithAnAccountCannotAddSameAccount

	self shouldAdding: account1 to: portfolioWithInnerPortfolioWithAccount1 raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:23'!
test03PortfolioCannotAddItself

	self shouldAdding: portfolioEmpty to: portfolioEmpty raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:23'!
test04PortfolioCannotAddAccountWhenAccountIsAlreadyInRootPorfolio


	Portfolio createWith: {account1. portfolioEmpty}.
	
	self shouldAdding: account1 to: portfolioEmpty raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:33'!
test05PortfolioWithAnAccountCannotAddPortfolioWithSameAccount


	| portfolio |

	portfolio _ Portfolio createWith: {account1}.
	
	self shouldAdding: portfolioWithAccount1 to: portfolio raiseErrorWithDescription: Portfolio portfolioIncludesFinancialEntityAlreadyInPortfolioHierarchyErrorDescription.! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:23'!
test06InnerPortfolioCannotAddRootPortfolio


	| portfolio |

	portfolio _ Portfolio createWith: {portfolioEmpty}.
	
	self shouldAdding: portfolio to: portfolioEmpty raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.! !

!ValidPortfolioTests methodsFor: 'tests' stamp: 'JGC 6/9/2022 12:18:23'!
test07PortfolioIncludedInTwoDifferentPortfoliosCannotAddAccountIncludedInAnyOfBothHierarchies


	| portfolio |
	
	portfolio _ Portfolio new.

	portfolioWithAccount1 add: portfolio.
	portfolioWithAccount2 add: portfolio.
	
	self shouldAdding: account1 to: portfolio raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.
	self shouldAdding: account2 to: portfolio raiseErrorWithDescription: Portfolio financialEntityAlreadyInPortfolioHierarchyErrorDescription.! !


!ValidPortfolioTests methodsFor: 'asserts' stamp: 'JGC 6/8/2022 19:57:32'!
shouldAdding: anEntity to: aPortfolio raiseErrorWithDescription: anErrorDescription 

	self should: [aPortfolio add: anEntity ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anErrorDescription equals: anError messageText ].! !


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

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JGC 6/8/2022 23:47:23'!
register: aValue on: anAccount

	| transaction |
	
	self assertValueIsValid: aValue.
	self assertAccountIsValid: anAccount.
	
	transaction _ self for: aValue.
	
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


!DepositLeg methodsFor: 'balance altering' stamp: 'JGC 6/8/2022 23:40:36'!
alter: aBalance

	^ aBalance + value.! !


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
	instanceVariableNames: 'value extractionLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountsTransfer methodsFor: 'initialization' stamp: 'JGC 6/8/2022 23:40:19'!
initializeWithValue: aValueToTransfer from: aTransferringAccount to: aReceivingAccount   

	value _ aValueToTransfer.
	
	extractionLeg _ ExtractionLeg register: value on: aTransferringAccount.
	depositLeg _ DepositLeg register: value on: aReceivingAccount.
	
	extractionLeg associateCounterpart: depositLeg.
	depositLeg associateCounterpart: extractionLeg.! !


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
	instanceVariableNames: 'financialEntities portfoliosContainingSelf'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'JGC 6/9/2022 00:16:37'!
initialize
	
	financialEntities _ OrderedCollection new.
	portfoliosContainingSelf _ OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'JGC 6/9/2022 12:10:50'!
initializeWith: financialEntitiesToAdd 
	
	financialEntitiesToAdd do: [ :aFinancialEntity | self add: aFinancialEntity].! !


!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/9/2022 12:11:17'!
add: anFinancialEntityToBeAdded 

	self assertFinancialEntityCanBeAdded: anFinancialEntityToBeAdded.
	
	(anFinancialEntityToBeAdded isKindOf: Portfolio) ifTrue:
		[ anFinancialEntityToBeAdded addContainingPortfolio: self	].

	financialEntities add: anFinancialEntityToBeAdded.! !

!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/9/2022 12:11:45'!
balance
	
	^ financialEntities sum: [ :aFinancialEntity | aFinancialEntity balance. ] ifEmpty: [ 0 * peso. ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/9/2022 12:11:51'!
hasRegistered: aTransaction 
	
	^ financialEntities anySatisfy: [ :aFinancialEntity | aFinancialEntity hasRegistered: aTransaction. ].! !

!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/9/2022 12:12:00'!
transactions
	
	^ financialEntities inject: OrderedCollection new into: [ :transactions :aFinancialEntity | transactions, aFinancialEntity transactions ].
	
	! !


!Portfolio methodsFor: 'asserts' stamp: 'JGC 6/9/2022 12:12:55'!
assertFinancialEntityCanBeAdded: aFinancialEntityToBeAdded

	self assertFinancialEntityIsNotInPortfolioHierarchy: aFinancialEntityToBeAdded.
	self assertFinancialEntityDoesNotIncludeAFinancialEntityAlreadyInHierarchy: aFinancialEntityToBeAdded.! !

!Portfolio methodsFor: 'asserts' stamp: 'JGC 6/9/2022 12:29:38'!
assertFinancialEntityDoesNotIncludeAFinancialEntityAlreadyInHierarchy: aFinancialEntity

	((aFinancialEntity isKindOf: Portfolio) and: [self portfolioHierarchyIncludesFinancialEntitiesFrom: aFinancialEntity])
		ifTrue: [self class error: self class portfolioIncludesFinancialEntityAlreadyInPortfolioHierarchyErrorDescription ].! !

!Portfolio methodsFor: 'asserts' stamp: 'JGC 6/9/2022 12:29:45'!
assertFinancialEntityIsNotInPortfolioHierarchy: aFinancialEntity

	(self portfolioHierarchyIncludesFinancialEntity: aFinancialEntity)
		ifTrue: [ self class error: self class financialEntityAlreadyInPortfolioHierarchyErrorDescription ].! !


!Portfolio methodsFor: 'testing' stamp: 'JGC 6/9/2022 12:36:00'!
portfolioHierarchyIncludesFinancialEntitiesFrom: aPortfolio

	^ financialEntities anySatisfy: [ :aFinancialEntity | aPortfolio includes: aFinancialEntity].
	

	
	! !

!Portfolio methodsFor: 'testing' stamp: 'JGC 6/9/2022 12:29:45'!
portfolioHierarchyIncludesFinancialEntity: aFinancialEntity
	
	^ self highestLevelPortfolios anySatisfy: [ :aHighLevelPortfolio | (aHighLevelPortfolio includes: aFinancialEntity) or: [aHighLevelPortfolio = aFinancialEntity]].! !


!Portfolio methodsFor: 'private' stamp: 'JGC 6/9/2022 00:29:01'!
addContainingPortfolio: aPortfolioThatContainsSelf

	portfoliosContainingSelf add: aPortfolioThatContainsSelf.! !

!Portfolio methodsFor: 'private' stamp: 'JGC 6/9/2022 12:14:23'!
financialEntity: aFinancialEntity includes: aPotentialIncludedFinancialEntity

	^ (aFinancialEntity isKindOf: Portfolio) and: [aFinancialEntity includes: aPotentialIncludedFinancialEntity].! !

!Portfolio methodsFor: 'private' stamp: 'JGC 6/9/2022 00:23:32'!
highestLevelPortfolios

	portfoliosContainingSelf isEmpty ifTrue: [^Set with: self].
	
	^portfoliosContainingSelf inject: Set new 
		into: [ :highestLevelPortfolios :aPortfolioContainingSelf | highestLevelPortfolios, aPortfolioContainingSelf highestLevelPortfolios].
	
	! !

!Portfolio methodsFor: 'private' stamp: 'JGC 6/9/2022 12:14:52'!
includes: aPotentialIncludedEntity

	^ financialEntities anySatisfy: 
		[ :aFinancialEntity | 
			aFinancialEntity = aPotentialIncludedEntity or:
		        [self financialEntity: aFinancialEntity includes: aPotentialIncludedEntity].
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'JGC 6/9/2022 12:09:48'!
create

	^self new.! !

!Portfolio class methodsFor: 'instance creation' stamp: 'JGC 6/8/2022 23:49:11'!
createWith: entitiesToGroup 
	
	^ self new initializeWith: entitiesToGroup asOrderedCollection.! !


!Portfolio class methodsFor: 'error descriptions' stamp: 'JGC 6/9/2022 12:18:23'!
financialEntityAlreadyInPortfolioHierarchyErrorDescription
	
	^ 'cannot add entity already in portfolio hierarchy'.! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'JGC 6/9/2022 12:18:33'!
portfolioIncludesFinancialEntityAlreadyInPortfolioHierarchyErrorDescription

	^ 'cannot add portfolio when it includes an entity already in portfolio hierarchy'.! !


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
