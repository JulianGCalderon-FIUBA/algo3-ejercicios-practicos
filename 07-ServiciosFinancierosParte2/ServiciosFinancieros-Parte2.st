!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:05:32'!
test01AccountSummaryFromAccountWithNoTransactionsPrintsBalance
	
	| expectedReport |
	expectedReport _ {'Balance: 0'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsAccount: account1 AccountSummaryAfter: []..! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:06:16'!
test02AccountSummaryFromAccountWithDepositPrintsDepositAndBalance

	| expectedReport | 
	expectedReport _ {'Depósito por 50 * pesos'. 'Balance: 50 * pesos'} asOrderedCollection.

	self assertAReport: expectedReport equalsAccount: account1 AccountSummaryAfter: [Deposit register: 50 * peso on: account1].
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:06:41'!
test03AccountSummaryFromAccountWithWithdrawPrintsWithdrawAndBalance

	| expectedReport | 
	expectedReport _ {'Extracción por 50 * pesos'. 'Balance: -50 * pesos'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsAccount: account1 AccountSummaryAfter: [Withdraw register: 50 * peso on: account1].
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:07:12'!
test04AccountSummaryFromAccountWithTransferWithdrawLegPrintsWithdrawLegAndBalance

	| expectedReport | 
	expectedReport _ {'Salida por transferencia de 50 * pesos'. 'Balance: -50 * pesos'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsAccount: account1 AccountSummaryAfter: [Transfer amount: 50 * peso from: account1 to: account2].
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:07:31'!
test05AccountSummaryFromAccountWithTransferDepositLegPrintsDepositLegAndBalance

	| expectedReport | 
	expectedReport _ {'Entrada por transferencia de 50 * pesos'. 'Balance: 50 * pesos'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsAccount: account1 AccountSummaryAfter: [Transfer amount: 50 * peso from: account2 to: account1].
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:08:08'!
test06AccountSummaryFromAccountWithManyTransactionsPrintsManyTransactionsAndBalance

	| expectedReport | 
	expectedReport _ {'Depósito por 200 * pesos'. 
					'Extracción por 100 * pesos'. 
					'Salida por transferencia de 50 * pesos'. 
					'Entrada por transferencia de 50 * pesos'.
					'Balance: 100 * pesos'} asOrderedCollection.

	self assertAReport: expectedReport equalsAccount: account1 AccountSummaryAfter: [Deposit register: 200 * peso on: account1.
																		Withdraw register: 100 * peso on: account1.
																		Transfer amount: 50 * peso from: account1 to: account2.
																		Transfer amount: 50 * peso from: account2 to: account1].
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:08:56'!
test07AccountSummaryFromPortfolioPrintsTransactionsAndBalanceFromAccountInside

	| expectedReport portfolio | 

	portfolio _ Portfolio with: account1 with: account2.
	expectedReport _ {'Depósito por 200 * pesos'. 
					'Extracción por 100 * pesos'.
					'Balance: 100 * pesos'} asOrderedCollection.

	self assertAReport: expectedReport equalsAccount: portfolio AccountSummaryAfter: [Deposit register: 200 * peso on: account1.
																		Withdraw register: 100 * peso on: account2].
	
	! !


!AccountSummaryTest methodsFor: 'asserts' stamp: 'JGC 6/14/2022 17:04:18'!
assertAReport: anExpectedReport equalsAccount: anAccount AccountSummaryAfter: aTransactionBlock

	aTransactionBlock value.
	self assert: anExpectedReport equals: (AccountSummary from: anAccount) report.! !


!AccountSummaryTest methodsFor: 'setUp' stamp: 'JGC 6/14/2022 17:09:24'!
setUp
	
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros-Parte2'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: 'portfolioZoologico portfolioAves accountFlamenco accountOso'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:49:49'!
test01PortfolioDetailedTreePrinterFromEmptyPortfolioPrintsNameAndZeroBalance

	| expectedReport |
	expectedReport _ {'Portfolio del zoológico'.
					  '    Balance: 0'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsPortfolioZoologicoDetailedTreePrinterAfter: [].! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:53:26'!
test02PortfolioDetailedTreePrinterFromPortfolioWithAccoutPrintsAccountNamesAccountSummaryAndTotalBalance

	| expectedReport |
	expectedReport _ {'Portfolio del zoológico'.
					'    Cuenta del flamenco'.
					'        Depósito por 50 * pesos'.
					'        Balance: 50 * pesos'.
					'    Balance: 50 * pesos'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsPortfolioZoologicoDetailedTreePrinterAfter: [
						portfolioZoologico add: accountFlamenco.
						Deposit register: 50 * peso on: accountFlamenco].! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:53:22'!
test03PortfolioDetailedTreePrinterFromPortfolioWithInnerPortfolioWithAccountPrintsAccountNamesAccountSummaryAndBalances

	| expectedReport |
	expectedReport _ {'Portfolio del zoológico'.
					'    Portfolio de las aves'.
					'        Cuenta del flamenco'.
					'            Depósito por 50 * pesos'.
					'            Balance: 50 * pesos'.
					'        Balance: 50 * pesos'.
					'    Balance: 50 * pesos'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsPortfolioZoologicoDetailedTreePrinterAfter: [
	portfolioAves add: accountFlamenco.
	portfolioZoologico add: portfolioAves.
	Deposit register: 50 * peso on: accountFlamenco.
].! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:58:03'!
test04PortfolioDetailedTreePrinterFromPortfolioWithTwoAccountsPrintsAccountNamesAccountSummariesAndBalance

	| expectedReport |
	expectedReport _ {'Portfolio del zoológico'.
					'    Cuenta del flamenco'.
					'        Depósito por 50 * pesos'.
					'        Balance: 50 * pesos'.
					'    Cuenta del oso'.
					'        Extracción por 30 * pesos'.
					'        Balance: -30 * pesos'.
					'    Balance: 20 * pesos'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsPortfolioZoologicoDetailedTreePrinterAfter: [
	portfolioZoologico add: accountFlamenco.
	portfolioZoologico add: accountOso.
	Deposit register: 50 * peso on: accountFlamenco.
	Withdraw register: 30 * peso on: accountOso.
].! !


!PortfolioDetailedTreePrinterTest methodsFor: 'setUp' stamp: 'sm 6/14/2022 20:56:32'!
setUp

	portfolioZoologico _ Portfolio named: 'Portfolio del zoológico'.
	portfolioAves _ Portfolio named: 'Portfolio de las aves'.
	
	accountFlamenco _ ReceptiveAccount named: 'Cuenta del flamenco'.
	accountOso _ ReceptiveAccount named: 'Cuenta del oso'.
	! !


!PortfolioDetailedTreePrinterTest methodsFor: 'asserts' stamp: 'sm 6/14/2022 20:47:45'!
assertAReport: anExpectedReport equalsPortfolioZoologicoDetailedTreePrinterAfter: aBlockToBeEvaluated

	aBlockToBeEvaluated value.
	self assert: anExpectedReport equals: (PortfolioDetailedTreePrinter from: portfolioZoologico) report.! !


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
	instanceVariableNames: 'portfolioGranja accountVaca portfolioGallinas accountGallinaClara accountGallinaXimena'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTreePrinterTest methodsFor: 'setUp' stamp: 'sm 6/14/2022 20:23:57'!
setUp

	portfolioGranja _ Portfolio named: 'Portfolio de la granja'.
	portfolioGallinas _ Portfolio named: 'Portfolio de las gallinas'.
	
	accountVaca _ ReceptiveAccount named: 'Cuenta de la vaca'.
	accountGallinaClara _ ReceptiveAccount named: 'Cuenta de la gallina Clara'.
	accountGallinaXimena _ ReceptiveAccount named: 'Cuenta de la gallina Ximena'.! !


!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:39:46'!
test01PortfolioTreePrinterFromEmptyPortfolioPrintsPortfolioName

	| expectedReport |
	expectedReport _ {'Portfolio de la granja'} asOrderedCollection.
	
	self assertAReport: expectedReport equalsPortfolioGranjaTreePrinterAfter: [].! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:40:16'!
test02PortfolioTreePrinterFromPortfolioWithAccountPrintsBothNames

	| expectedReport accountAdding |
	expectedReport _ {'Portfolio de la granja'. 
					'    Cuenta de la vaca'} asOrderedCollection.
	accountAdding _ [portfolioGranja add: accountVaca].
	
	self assertAReport: expectedReport equalsPortfolioGranjaTreePrinterAfter: accountAdding.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:41:22'!
test03PortfolioTreePrinterFromPortfolioWithAccountAndInnerPortfolioPrintsNames

	| expectedReport accountAdding |
	expectedReport _ {'Portfolio de la granja'. 
					'    Cuenta de la vaca'.
					'    Portfolio de las gallinas'} asOrderedCollection.
	accountAdding _ [portfolioGranja add: accountVaca. 
							portfolioGranja add: portfolioGallinas].
						
	self assertAReport: expectedReport equalsPortfolioGranjaTreePrinterAfter: accountAdding.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'sm 6/14/2022 20:41:15'!
test04PortfolioTreePrinterFromPortfolioWithInnerPortfolioWithTwoAccountsPrintsNames

	| expectedReport accountAdding |
	expectedReport _ {'Portfolio de la granja'. 
					'    Portfolio de las gallinas'.
					'        Cuenta de la gallina Clara'.
					'        Cuenta de la gallina Ximena'} asOrderedCollection.
	accountAdding _ [portfolioGallinas add: accountGallinaClara.
				portfolioGallinas add: accountGallinaXimena.
				portfolioGranja add: portfolioGallinas.].
						
	self assertAReport: expectedReport equalsPortfolioGranjaTreePrinterAfter: accountAdding.! !


!PortfolioTreePrinterTest methodsFor: 'asserts' stamp: 'sm 6/14/2022 20:34:11'!
assertAReport: anExpectedReport equalsPortfolioGranjaTreePrinterAfter: aBlockToBeEvaluated

	aBlockToBeEvaluated value.
	self assert: anExpectedReport equals: (PortfolioTreePrinter from: portfolioGranja ) report.! !


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
	instanceVariableNames: 'account1 account2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test01TransferNetFromAccountWithNoTransfersReturnsZeroTransferNet

	self assertATransferNet: 0 equalsAccount: account1 transferNetAfter: [].! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test02TransferWithdrawLegDecreasesTransferNet

	self assertATransferNet: -50 * peso equalsAccount: account1 transferNetAfter: [Transfer amount: 50 * peso from: account1 to: account2].! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test03TransferDepositLegIncreasesTransferNet

	self assertATransferNet: 50 * peso equalsAccount: account1 transferNetAfter: [Transfer amount: 50 * peso from: account2 to: account1].! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test04DepositDoesNotAffectTransferNet

	self assertATransferNet: 0 equalsAccount: account1 transferNetAfter: [Deposit register: 50 * peso on: account1].! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test05WithdrawDoesNotAffectTransferNet

	self assertATransferNet: 0 equalsAccount: account1 transferNetAfter: [Withdraw register: 50 * peso on: account1.].! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test06ManyTransactionsAffectTransferNetCorrespondingly

	
	self assertATransferNet: 50 * peso equalsAccount: account1 transferNetAfter: [{Deposit register: 200 * peso on: account1.
																	Withdraw register: 20 * peso on: account1.
																	Transfer amount: 50 * peso from: account1 to: account2.
																	Transfer amount: 100 * peso from: account2 to: account1.}]! !

!TransferNetTest methodsFor: 'tests' stamp: 'JGC 6/14/2022 17:02:10'!
test07TransferNetFromPortfolioReturnsCorrectTransferNet

	| portfolio |

	portfolio _ Portfolio with: account1 with: account2.
	
	self assertATransferNet: 0 equalsAccount: portfolio transferNetAfter: [Deposit register: 200 * peso on: account1.
																	Withdraw register: 20 * peso on: account1.
																	Transfer amount: 50 * peso from: account1 to: account2.
																	Transfer amount: 100 * peso from: account2 to: account1.]! !


!TransferNetTest methodsFor: 'asserts' stamp: 'JGC 6/14/2022 17:02:10'!
assertATransferNet: aTransferNet equalsAccount: anAccount transferNetAfter: aTransactionBlock

	aTransactionBlock value.
	self assert: aTransferNet equals: (TransferNet from: anAccount) report.! !


!TransferNetTest methodsFor: 'setUp' stamp: 'JGC 6/14/2022 17:01:57'!
setUp

	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
! !


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


!Account methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 14:48:34'!
visitTransactionsFor: aVisitor

	^self transactions collect: [ :aTransaction | aTransaction visitWith: aVisitor].! !

!Account methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:47:11'!
visitWith: aReport

	self subclassResponsibility.! !


!Account methodsFor: 'accessing' stamp: 'sm 6/12/2022 17:36:38'!
name

	^ name.! !

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


!Portfolio methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 15:26:58'!
visitAccountsFor: aVisitor

	^ accounts inject: OrderedCollection new 
		into: [ :fullReport :anAccount | fullReport, (anAccount visitWith: aVisitor)].
! !

!Portfolio methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:45:32'!
visitWith: aReport

	^ aReport visitPortfolio: self.! !

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


!ReceptiveAccount methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:45:32'!
visitWith: aReport

	^ aReport visitReceptiveAccount: self.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Parte2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:43:46'!
visitWith: aReport

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

!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:43:46'!
visitWith: aReport

	^ aReport visitDeposit: self.! !

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


!TransferDepositLeg methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:43:46'!
visitWith: aReport

	^ aReport visitTransferDepositLeg: self.! !


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


!TransferWithdrawLeg methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:43:46'!
visitWith: aReport

	^ aReport visitTransferWithdrawLeg: self.! !


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


!Withdraw methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:43:46'!
visitWith: aReport
	
	^ aReport visitWithdraw: self.! !

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


!classDefinition: #Report category: 'ServiciosFinancieros-Parte2'!
Object subclass: #Report
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!Report methodsFor: 'initialization' stamp: 'JGC 6/14/2022 13:12:18'!
initializeFrom: anAccount 
	
	account := anAccount.! !


!Report methodsFor: 'main protocol' stamp: 'JGC 6/14/2022 13:12:37'!
report 

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Parte2'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'instance creation' stamp: 'JGC 6/14/2022 13:11:31'!
from: anAccount

	^self new initializeFrom: anAccount.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Parte2'!
Report subclass: #AccountSummary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!AccountSummary methodsFor: 'main protocol' stamp: 'JGC 6/14/2022 14:46:04'!
report

	| report |
	report _ OrderedCollection new.
	
	report _ account visitTransactionsFor: self.
	report add: 'Balance: ', account balance asString.
	
	^report.! !


!AccountSummary methodsFor: 'private' stamp: 'JGC 6/14/2022 13:25:50'!
visitDeposit: aDeposit

	^ 'Depósito por ', aDeposit value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'JGC 6/14/2022 13:35:15'!
visitTransferDepositLeg: aTransferDepositLeg

	^ 'Entrada por transferencia de ', aTransferDepositLeg value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'JGC 6/14/2022 13:35:20'!
visitTransferWithdrawLeg: aTransferWithdrawLeg

	^ 'Salida por transferencia de ', aTransferWithdrawLeg value asString.! !

!AccountSummary methodsFor: 'private' stamp: 'JGC 6/14/2022 13:26:00'!
visitWithdraw: aWithdraw

	^ 'Extracción por ', aWithdraw value asString.! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Parte2'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'JGC 6/14/2022 15:41:24'!
accountReports

	| reports indentation |
	
	indentation _ '    '.
	reports _ account visitAccountsFor: self.
	
	^ reports collect: [:aReport | indentation, aReport]. ! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'JGC 6/14/2022 15:50:31'!
report

	| report |
	
	report _ OrderedCollection new.
	
	report add: account name.
	
	report addAll: self accountReports.
	
	report add: '    Balance: ', account balance asString.
	
	^ report.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'JGC 6/14/2022 15:52:28'!
visitPortfolio: aPortfolio

	^ (PortfolioDetailedTreePrinter from: aPortfolio) report.
	! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'JGC 6/14/2022 15:49:23'!
visitReceptiveAccount: aReceptiveAccount

	| report indentation accountSummary |
	
	indentation _ '    '.
	report _ OrderedCollection with: aReceptiveAccount name.
	
	accountSummary _ (AccountSummary from: aReceptiveAccount) report. 
	
	report addAll: ( accountSummary collect: [:aTransaction | indentation, aTransaction]).
	
	^report.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Parte2'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!PortfolioTreePrinter methodsFor: 'main protocol' stamp: 'JGC 6/14/2022 15:26:44'!
report

	| report |
	
	report _ OrderedCollection new.
	
	report add: account name.
	
	report addAll: self accountReports.
	
	
	^ report.! !


!PortfolioTreePrinter methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:42:24'!
visitPortfolio: aPortfolio

	^ (PortfolioTreePrinter from: aPortfolio) report.
	! !

!PortfolioTreePrinter methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 15:18:26'!
visitReceptiveAccount: aReceptiveAccount

	^ OrderedCollection with: aReceptiveAccount name.
	! !


!PortfolioTreePrinter methodsFor: 'private' stamp: 'JGC 6/14/2022 14:56:04'!
accountReports

	| reports indentation |
	
	indentation _ '    '.
	reports _ account visitAccountsFor: self.
	
	^ reports collect: [:aReport | indentation, aReport]. ! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Parte2'!
Report subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Parte2'!

!TransferNet methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:34:56'!
visitDeposit: aDeposit

	^ 0.! !

!TransferNet methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:35:30'!
visitTransferDepositLeg: aTransferDepositLeg

	^ aTransferDepositLeg value.! !

!TransferNet methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:35:27'!
visitTransferWithdrawLeg: aTransferWithdrawLeg

	^ aTransferWithdrawLeg value negated.! !

!TransferNet methodsFor: 'visit behaviour' stamp: 'JGC 6/14/2022 13:30:37'!
visitWithdraw: aWithdraw

	^0.! !


!TransferNet methodsFor: 'main protocol' stamp: 'JGC 6/14/2022 14:54:23'!
report

	| transferNetValues |
	
	transferNetValues _ account visitTransactionsFor: self.
	^ transferNetValues sum: [ :aValue | aValue ] ifEmpty: [0].
	
	
	
	! !


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
