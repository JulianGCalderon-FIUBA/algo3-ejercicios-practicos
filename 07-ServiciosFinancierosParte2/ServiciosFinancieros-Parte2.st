!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/10/2022 14:20:17'!
test01

	| accountSummary account1 | 
	
	account1 := ReceptiveAccount new.
	
	accountSummary := AccountSummary from: account1.
	
	self assert: 'Balance: 0' equals: accountSummary report first.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sm 6/9/2022 21:56:17'!
test02

	| accountSummary account1 expectedReport | 
	
	account1 _ ReceptiveAccount new.
	Deposit register: 50 * peso on: account1.
	
	accountSummary _ AccountSummary from: account1.
	
	expectedReport _ {'Depósito por 50 * pesos'. 'Balance: 50 * pesos'} asOrderedCollection.
	
	self assert: expectedReport equals: accountSummary report.
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sm 6/9/2022 21:56:24'!
test03

	| accountSummary account1 expectedReport | 
	
	account1 _ ReceptiveAccount new.
	Withdraw register: 50 * peso on: account1.
	
	accountSummary _ AccountSummary from: account1.
	
	expectedReport _ {'Extracción por 50 * pesos'. 'Balance: -50 * pesos'} asOrderedCollection.
	
	self assert: expectedReport equals: accountSummary report.
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sm 6/9/2022 23:52:06'!
test04

	| accountSummary account1 expectedReport account2 | 
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Transfer amount: 50 * peso from: account1 to: account2.
	
	accountSummary _ AccountSummary from: account1.
	
	expectedReport _ {'Salida por transferencia de 50 * pesos'. 'Balance: -50 * pesos'} asOrderedCollection.
	
	self assert: expectedReport equals: accountSummary report.
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sm 6/9/2022 23:53:29'!
test05

	| accountSummary account1 expectedReport account2 | 
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Transfer amount: 50 * peso from: account1 to: account2.
	
	accountSummary _ AccountSummary from: account2.
	
	expectedReport _ {'Entrada por transferencia de 50 * pesos'. 'Balance: 50 * pesos'} asOrderedCollection.
	
	self assert: expectedReport equals: accountSummary report.
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sm 6/12/2022 17:03:14'!
test06

	| accountSummary account1 expectedReport account2 | 
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 200 * peso on: account1.
	Withdraw register: 100 * peso on: account1.
	Transfer amount: 50 * peso from: account1 to: account2.
	Transfer amount: 50 * peso from: account2 to: account1.
	
	accountSummary _ AccountSummary from: account1.
	
	expectedReport _ {'Depósito por 200 * pesos'. 
					'Extracción por 100 * pesos'. 
					'Salida por transferencia de 50 * pesos'. 
					'Entrada por transferencia de 50 * pesos'.
					'Balance: 100 * pesos'} asOrderedCollection.
	
	self assert: expectedReport equals: accountSummary report.
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'sm 6/12/2022 17:03:19'!
test07

	| accountSummary account1 expectedReport account2 portfolio | 
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.

	portfolio _ Portfolio with: account1 with: account2.
	
	Deposit register: 200 * peso on: account1.
	Withdraw register: 100 * peso on: account2.
	
	accountSummary _ AccountSummary from: portfolio.
	
	expectedReport _ {'Depósito por 200 * pesos'. 
					'Extracción por 100 * pesos'.
					'Balance: 100 * pesos'} asOrderedCollection.
	
	self assert: expectedReport equals: accountSummary report.
	
	! !


!AccountSummaryTest methodsFor: 'setUp' stamp: 'sm 6/13/2022 23:41:51'!
setUp

	" 1. código repetido de los tests (TODOS) y cambiarle el nombre en los nuestros
	  2. mensaje general para account summary y transfer net (quizas transfer net tiene un colaborador interno net y bla bla)
	 3. parte 2 del extra (reutiliza account summary)."! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'sm 6/13/2022 21:13:35'!
test16PortfolioCanBeCreatedWithAName

	| portfolio name |
	
	name _ 'Portfolio de la granja'.
	
	portfolio _ Portfolio named: name.
	
	self assert: name equals: portfolio name.! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/13/2022 20:21:28'!
test01

	| treePrinter portfolio  expectedReport name |

	name _ 'Portfolio de la granja'.
	portfolio _ Portfolio named: name.
	
	treePrinter _ PortfolioTreePrinter from: portfolio.
	
	expectedReport _ {name} asOrderedCollection.
	
	self assert: expectedReport equals: treePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/13/2022 20:21:51'!
test02

	| treePrinter portfolio  expectedReport account |

	account _ ReceptiveAccount named: 'Cuenta de la vaca'.
	portfolio _ Portfolio named: 'Portfolio de la granja' with: account.
	
	treePrinter _ PortfolioTreePrinter from: portfolio.
	
	expectedReport _ {'Portfolio de la granja'. 
					'    Cuenta de la vaca'} asOrderedCollection.
	
	self assert: expectedReport equals: treePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/13/2022 20:34:10'!
test03

	| treePrinter portfolio  expectedReport account1 innerPortfolio |

	account1 _ ReceptiveAccount named: 'Cuenta de la vaca'.
	innerPortfolio _ Portfolio named: 'Portfolio de las gallinas'.
	portfolio _ Portfolio named: 'Portfolio de la granja' with: account1 with: innerPortfolio.
	
	treePrinter _ PortfolioTreePrinter from: portfolio.
	
	expectedReport _ {'Portfolio de la granja'. 
					'    Cuenta de la vaca'.
					'    Portfolio de las gallinas'} asOrderedCollection.
	
	self assert: expectedReport equals: treePrinter report.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/13/2022 21:16:52'!
test04

	| treePrinter portfolio  expectedReport account1 account2 innerPortfolio |

	account1 _ ReceptiveAccount named: 'Cuenta de la gallina Clara'.
	account2 _ ReceptiveAccount named: 'Cuenta de la gallina Ximena'.
	innerPortfolio _ Portfolio named: 'Portfolio de las gallinas' with: account1 with: account2.
	portfolio _ Portfolio named: 'Portfolio de la granja' with: innerPortfolio.
	
	treePrinter _ PortfolioTreePrinter from: portfolio.
	
	expectedReport _ {'Portfolio de la granja'. 
					'    Portfolio de las gallinas'.
					'        Cuenta de la gallina Clara'.
					'        Cuenta de la gallina Ximena'} asOrderedCollection.
	
	self assert: expectedReport equals: treePrinter report.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'sm 6/13/2022 21:13:18'!
test08AccountCanBeCreatedWithAName

	| account name |
	
	name _ 'Cuenta de la oveja'.
	account := ReceptiveAccount named: name.
	
	self assert: name equals: account name.
	
! !


!classDefinition: #TransferNetTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/10/2022 14:20:29'!
test01

	| account1 transferNet |
	
	account1 _ ReceptiveAccount new.
	
	transferNet _ TransferNet from: account1.
	
	self assert: 0 equals: transferNet report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/10/2022 14:20:45'!
test02

	| account1 account2 transferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Transfer amount: 50 * peso from: account1 to: account2.
	
	transferNet _ TransferNet from: account1.
	
	self assert: -50 * peso equals: transferNet report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/10/2022 14:19:36'!
test03

	| account1 account2 transferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Transfer amount: 50 * peso from: account2 to: account1.
	
	transferNet _ TransferNet from: account1.
	
	self assert: 50 * peso equals: transferNet report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/10/2022 14:19:40'!
test04

	| account1 account2 transferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Transfer amount: 50 * peso from: account1 to: account2.
	Transfer amount: 100 * peso from: account2 to: account1.
	
	transferNet _ TransferNet from: account1.
	
	self assert: 50 * peso equals: transferNet report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/10/2022 14:19:42'!
test05

	| account1 account2 transferNet |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 200 * peso on: account1.
	Withdraw register: 20 * peso on: account1.
	Transfer amount: 50 * peso from: account1 to: account2.
	Transfer amount: 100 * peso from: account2 to: account1.
	
	transferNet _ TransferNet from: account1.
	
	self assert: 50 * peso equals: transferNet report.! !

!TransferNetTest methodsFor: 'tests' stamp: 'sm 6/12/2022 17:04:44'!
test06

	| account1 account2 transferNet portfolio |
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	Deposit register: 200 * peso on: account1.
	Withdraw register: 20 * peso on: account1.
	Transfer amount: 50 * peso from: account1 to: account2.
	Transfer amount: 100 * peso from: account2 to: account1.
	
	portfolio _ Portfolio with: account1 with: account2.
	
	transferNet _ TransferNet from: portfolio.
	
	self assert: 0 * peso equals: transferNet report.! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Account
	instanceVariableNames: 'name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!Account methodsFor: 'initialization' stamp: 'sm 6/12/2022 17:35:58'!
initializeWithName: aName

	name _ aName.! !


!Account methodsFor: 'accessing' stamp: 'sm 6/12/2022 17:36:38'!
name

	^ name.! !

!Account methodsFor: 'accessing' stamp: 'sm 6/13/2022 20:53:05'!
reportForAccount

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Parte2'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'instance creation' stamp: 'sm 6/12/2022 17:30:16'!
named: aName

	^ self new initializeWithName: aName.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Parte2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'JGC 6/10/2022 14:18:34'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'report creation' stamp: 'sm 6/13/2022 20:57:02'!
reportForAccount: aReport

	^ aReport reportForAPortfolio: self.! !

!Portfolio methodsFor: 'report creation' stamp: 'sm 6/13/2022 20:55:35'!
reportForEachAccount: aReport

	^ accounts inject: OrderedCollection new 
		into: [ :fullReport :anAccount | fullReport, (anAccount reportForAccount: aReport)].! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'sm 6/13/2022 20:24:55'!
isComposedBy: anAccount

	^ self = anAccount or: 
	[ accounts anySatisfy: 
		[ :composedAccount | (composedAccount isComposedBy: anAccount) 
						or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Parte2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error description' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'sm 6/12/2022 17:50:42'!
named: aName with: anAccount

	^(self named: aName)
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'sm 6/12/2022 17:50:51'!
named: aName with: anAccount with: anotherAccount

	^(self named: aName)
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Parte2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'JGC 6/10/2022 14:18:39'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'accessing' stamp: 'sm 6/13/2022 20:58:00'!
reportForAccount: aReport

	^ aReport reportForAReceptiveAccount: self.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountSummary
	instanceVariableNames: 'receptiveAccount account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummary methodsFor: 'initialization' stamp: 'sm 6/9/2022 21:32:16'!
initializeFrom: anAccount 
	
	account := anAccount.! !


!AccountSummary methodsFor: 'main protocol' stamp: 'sm 6/12/2022 16:35:18'!
report

	| report |
	report _ OrderedCollection new.
	
	account transactions do: [ :aTransaction | report add: (aTransaction toStringFor: self) ].
	
	report add: 'Balance: ', account balance asString.
	
	^report.! !


!AccountSummary methodsFor: 'private' stamp: 'sm 6/12/2022 16:26:47'!
depositToString: aDeposit

	^ 'Depósito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'sm 6/12/2022 16:32:56'!
transferDepositLegToString: aTransferDepositLeg

	^ 'Entrada por transferencia de ', aTransferDepositLeg value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'sm 6/12/2022 16:32:52'!
transferWithdrawLegToString: aTransferWithdrawLeg

	^ 'Salida por transferencia de ', aTransferWithdrawLeg value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'sm 6/12/2022 16:27:07'!
withdrawToString: aWithdraw

	^ 'Extracción por ', aWithdraw value asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Parte2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'sm 6/10/2022 00:05:50'!
from: anAccount 

	^self new initializeFrom: anAccount.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:43:04'!
affectNet: aNet for: aReport

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:20:26'!
toStringFor: aReport

	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:43:27'!
affectNet: aValue for: aReport

	^ aReport deposit: self affectTransferNet: aValue. ! !

!Deposit methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:24:29'!
toStringFor: aReport

	^ aReport depositToString: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Parte2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Parte2'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Parte2'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:43:47'!
affectNet: aValue for: aReport

	^ aReport transferDepositLeg: self affectTransferNet: aValue. ! !

!TransferDepositLeg methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:28:30'!
toStringFor: aReport

	^ aReport transferDepositLegToString: self.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Parte2'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'JGC 6/10/2022 14:18:20'!
affectBalance: aBalance

	^aBalance + self value negated! !


!TransferWithdrawLeg methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:44:27'!
affectNet: aValue for: aReport

	^ aReport transferWithdrawLeg: self affectTransferNet: aValue. ! !

!TransferWithdrawLeg methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:28:41'!
toStringFor: aReport

	^ aReport transferWithdrawLegToString: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Parte2'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'JGC 6/10/2022 14:18:13'!
affectBalance: aBalance

	^aBalance + value negated! !


!Withdraw methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:44:42'!
affectNet: aValue for: aReport

	^ aReport withdraw: self affectTransferNet: aValue. ! !

!Withdraw methodsFor: 'report behaviour' stamp: 'sm 6/12/2022 16:31:02'!
toStringFor: aReport

	^ aReport withdrawToString: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Parte2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Parte2'!
Object subclass: #PortfolioTreePrinter
	instanceVariableNames: 'account portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTreePrinter methodsFor: 'initialization' stamp: 'sm 6/12/2022 17:45:23'!
initializeFrom: aPortfolio 

	portfolio := aPortfolio.! !


!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'sm 6/13/2022 21:30:04'!
report

	| report indentedReports |
	
	report _ OrderedCollection new.
	
	report add: portfolio name.
	indentedReports _ self indentedAccountReports.
	report addAll: indentedReports.
	
	^ report.! !


!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'sm 6/13/2022 21:31:07'!
indentedAccountReports

	| reports indentation |
	
	indentation _ '    '.
	
	reports _ portfolio reportForEachAccount: self.
	
	^ reports collect: [:aReport | indentation, aReport]. ! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'sm 6/13/2022 20:57:43'!
reportForAPortfolio: aPortfolio

	^ (PortfolioTreePrinter from: aPortfolio) report.
	! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'sm 6/13/2022 20:57:37'!
reportForAReceptiveAccount: aReceptiveAccount

	^ OrderedCollection with: aReceptiveAccount name.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Parte2'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'instance creation' stamp: 'sm 6/12/2022 17:45:02'!
from: aPortfolio 
	^self new initializeFrom: aPortfolio.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Parte2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Parte2'!
Object subclass: #TransferNet
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferNet methodsFor: 'initialization' stamp: 'sm 6/12/2022 16:57:56'!
initializeFrom: anAccount 
	
	account := anAccount.! !


!TransferNet methodsFor: 'private' stamp: 'sm 6/12/2022 16:44:04'!
deposit: aDeposit affectTransferNet: aTransferNet
		
	^ aTransferNet. ! !

!TransferNet methodsFor: 'private' stamp: 'sm 6/12/2022 16:44:16'!
transferDepositLeg: aTransferDepositLeg affectTransferNet: aTransferNet

	^ aTransferNet + aTransferDepositLeg value.! !

!TransferNet methodsFor: 'private' stamp: 'sm 6/12/2022 16:44:32'!
transferWithdrawLeg: aTransferiWithdrawLeg affectTransferNet: aTransferNet

	^ aTransferNet + aTransferiWithdrawLeg value negated.! !

!TransferNet methodsFor: 'private' stamp: 'sm 6/12/2022 16:44:49'!
withdraw: aWithdraw affectTransferNet: aTransferNet
		
	^ aTransferNet. ! !


!TransferNet methodsFor: 'main protocol' stamp: 'sm 6/12/2022 16:57:56'!
report

	^account transactions inject: 0 into: 
		[ :aValue :aTransaction | aTransaction affectNet: aValue for: self ].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Parte2'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'sm 6/10/2022 00:05:21'!
from: anAccount 

	^self new initializeFrom: anAccount ! !
