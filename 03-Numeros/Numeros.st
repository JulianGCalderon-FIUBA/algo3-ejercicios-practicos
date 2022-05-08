!classDefinition: #NumeroTest category: 'Numeros'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Numero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:56:52'!
* aMultiplicand

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:56:56'!
+ anAdder

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:56:58'!
- aSubtrahend

	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:57:02'!
/ aDivisor

	self subclassResponsibility. ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:57:06'!
negated
	
	^self * (Entero with: -1).! !


!Numero methodsFor: 'testing' stamp: 'MS 5/8/2022 16:57:10'!
isNegative

	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'MS 5/8/2022 16:57:13'!
isOne

	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'MS 5/8/2022 16:57:16'!
isZero

	self subclassResponsibility.! !


!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 20:59:17'!
addMeToEntero: anEnteroAugend

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 20:59:24'!
addMeToFraccion: aFraccionAugend

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 20:59:12'!
divideMeToEntero: anEnteroDividend

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 20:59:36'!
divideMeToFraccion: aFraccionDividend

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/8/2022 16:57:25'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 21:02:20'!
multiplyMeToEntero: anEnteroMultiplier
	
	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 21:00:13'!
multiplyMeToFraccion: aFraccionMultiplier
	
	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 21:01:23'!
substractMeToEntero: anEnteroMinuend

	self subclassResponsibility.! !

!Numero methodsFor: 'private' stamp: 'MS 5/5/2022 21:01:27'!
substractMeToFraccion: aFraccionMinuend

	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'MS 5/8/2022 16:56:42'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'.! !

!Numero class methodsFor: 'error descriptions' stamp: 'MS 5/8/2022 16:56:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'.! !


!classDefinition: #Entero category: 'Numeros'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 21:06:05'!
* aMultiplicand
	
	^aMultiplicand multiplyMeToEntero: self.	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 20:04:14'!
+ anAdder 
	
	^anAdder addMeToEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 20:51:21'!
- aSubtrahend 
	
	^ aSubtrahend substractMeToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 20:33:26'!
/ aDivisor 
	
	^aDivisor divideMeToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:58:19'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 15:52:09'!
fibonacci

	self subclassResponsibility.
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 16:58:23'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue).! !


!Entero methodsFor: 'comparing' stamp: 'MS 5/8/2022 16:59:00'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ].! !

!Entero methodsFor: 'comparing' stamp: 'MS 5/8/2022 16:59:03'!
hash

	^value hash.! !


!Entero methodsFor: 'initialization' stamp: 'MS 5/8/2022 16:59:13'!
initializeWith: aValue 
	
	value := aValue.! !


!Entero methodsFor: 'accessing' stamp: 'MS 5/8/2022 16:59:22'!
integerValue

	^value.! !


!Entero methodsFor: 'printing' stamp: 'MS 5/8/2022 16:59:26'!
printOn: aStream

	aStream print: value.! !


!Entero methodsFor: 'testing' stamp: 'MS 5/8/2022 15:53:17'!
isNegative
	
	^self isKindOf: Negativo.! !

!Entero methodsFor: 'testing' stamp: 'MS 5/8/2022 16:05:40'!
isOne
	
	^self isKindOf: Uno.! !

!Entero methodsFor: 'testing' stamp: 'MS 5/8/2022 16:05:56'!
isZero
	
	^self isKindOf: Cero.! !


!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:03:35'!
addMeToEntero: anEnteroAugend

	^self class with: anEnteroAugend integerValue + value.
	
	! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:03:47'!
addMeToFraccion: aFraccionAugend
	
	^((self * aFraccionAugend denominator) + aFraccionAugend numerator) / aFraccionAugend denominator.! !

!Entero methodsFor: 'private' stamp: 'MS 5/8/2022 17:07:00'!
createFraccionWithSelfOver: aDivisor

	| greatestCommonDivisor numerator denominator aDividend |
	
	aDividend := self.
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion new initializeWith: numerator over: denominator.! !

!Entero methodsFor: 'private' stamp: 'MS 5/8/2022 17:07:12'!
createFraccionWithSelfUnder: aDividend

	^aDividend createFraccionWithSelfOver: self.
	

	! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:03:58'!
divideMeToEntero: anEnteroDividend

	^Fraccion with: anEnteroDividend over: self.! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:04'!
divideMeToFraccion: aFraccionDividend

	^(aFraccionDividend numerator) / (aFraccionDividend denominator * self).! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:14'!
multiplyMeToEntero: anEnteroMultiplier

	^self class with: anEnteroMultiplier integerValue * value.! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:22'!
multiplyMeToFraccion: aFraccionMultiplier

	^ (aFraccionMultiplier numerator * self) / aFraccionMultiplier denominator.! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:30'!
substractMeToEntero: anEnteroMinuend

	^ self class with: anEnteroMinuend integerValue - value.! !

!Entero methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:35'!
substractMeToFraccion: aFraccionMinuend

	^(aFraccionMinuend numerator - (aFraccionMinuend denominator * self)) / aFraccionMinuend denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'MS 5/8/2022 16:57:40'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'.! !

!Entero class methodsFor: 'instance creation' stamp: 'MS 5/8/2022 16:58:48'!
with: aValue 
	
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	aValue = 0 ifTrue: [ ^Cero new initializeWith: aValue].
	aValue  = 1 ifTrue: [ ^Uno new initializeWith: aValue].
	aValue > 0 ifTrue: [ ^Positivo new initializeWith: aValue].
	aValue < 0 ifTrue: [ ^Negativo new initializeWith: aValue].! !


!classDefinition: #Cero category: 'Numeros'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Cero methodsFor: 'private' stamp: 'MS 5/8/2022 17:07:00'!
createFraccionWithSelfOver: aDivisor
	
	^self.! !

!Cero methodsFor: 'private' stamp: 'MS 5/8/2022 17:07:12'!
createFraccionWithSelfUnder: aDividend
	
	Numero error: Numero canNotDivideByZeroErrorDescription.! !


!Cero methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 15:50:37'!
fibonacci
	^Entero with: 1.! !


!classDefinition: #Negativo category: 'Numeros'!
Entero subclass: #Negativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Negativo methodsFor: 'private' stamp: 'MS 5/8/2022 17:07:12'!
createFraccionWithSelfUnder: aDividend
	
	| aDivisor |
	
	aDivisor := self.
	
	^aDividend negated / aDivisor negated.! !


!Negativo methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 17:01:24'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !


!classDefinition: #Positivo category: 'Numeros'!
Entero subclass: #Positivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Positivo methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 17:01:28'!
fibonacci
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci.! !


!classDefinition: #Uno category: 'Numeros'!
Positivo subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Uno methodsFor: 'arithmetic operations' stamp: 'MS 5/8/2022 17:01:45'!
fibonacci

	^self.! !


!classDefinition: #Fraccion category: 'Numeros'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 21:05:55'!
* aMultiplicand
	
	^aMultiplicand multiplyMeToFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 20:04:27'!
+ anAdder 

	^anAdder addMeToFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 20:51:05'!
- aSubtrahend 
	
	^aSubtrahend substractMeToFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'MS 5/5/2022 20:33:09'!
/ aDivisor 
	
	^aDivisor divideMeToFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'MS 5/8/2022 17:02:00'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ].! !

!Fraccion methodsFor: 'comparing' stamp: 'MS 5/8/2022 17:02:07'!
hash

	^(numerator hash / denominator hash) hash.! !


!Fraccion methodsFor: 'accessing' stamp: 'MS 5/8/2022 17:02:10'!
denominator

	^ denominator.! !

!Fraccion methodsFor: 'accessing' stamp: 'MS 5/8/2022 17:02:13'!
numerator

	^ numerator.! !


!Fraccion methodsFor: 'initialization' stamp: 'MS 5/8/2022 17:02:34'!
initializeWith: aNumerator over: aDenominator
	
	numerator := aNumerator.
	denominator := aDenominator.! !


!Fraccion methodsFor: 'testing' stamp: 'MS 5/8/2022 17:02:52'!
isNegative
	
	^self isKindOf: Negativo.! !

!Fraccion methodsFor: 'testing' stamp: 'MS 5/8/2022 17:03:01'!
isOne
	
	^false.! !

!Fraccion methodsFor: 'testing' stamp: 'MS 5/8/2022 17:03:04'!
isZero
	
	^false.! !


!Fraccion methodsFor: 'printing' stamp: 'MS 5/8/2022 17:03:44'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator.! !


!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:48'!
addMeToEntero: anEnteroAugend

	^anEnteroAugend addMeToFraccion: self.! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:04:54'!
addMeToFraccion: aFraccionAugend
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aFraccionAugend denominator) + (denominator * aFraccionAugend numerator).
	newDenominator := denominator * aFraccionAugend denominator.
	
	^newNumerator / newDenominator.! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:05:02'!
divideMeToEntero: anEnteroDividend
	
	^(anEnteroDividend * denominator ) / numerator.
	! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:05:08'!
divideMeToFraccion: aFraccionDividend
	
	^(denominator * aFraccionDividend numerator ) / (numerator * aFraccionDividend denominator).! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:05:14'!
multiplyMeToEntero: anEnteroMultiplier
	
	^anEnteroMultiplier multiplyMeToFraccion: self.! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:05:22'!
multiplyMeToFraccion: aFraccionMultiplier

	^(numerator * aFraccionMultiplier numerator) / (denominator * aFraccionMultiplier denominator).! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:05:30'!
substractMeToEntero: anEnteroMinuend
	
	^(anEnteroMinuend substractMeToFraccion: self) negated. ! !

!Fraccion methodsFor: 'private' stamp: 'MS 5/5/2022 21:05:35'!
substractMeToFraccion: aFraccionMinuend
	
	| newNumerator newDenominator |
	
	newNumerator := (aFraccionMinuend numerator * denominator) - (aFraccionMinuend denominator * numerator).
	newDenominator := aFraccionMinuend denominator * denominator.
	
	^newNumerator / newDenominator.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'MS 5/8/2022 17:07:12'!
with: aDividend over: aDivisor

	^aDivisor createFraccionWithSelfUnder: aDividend.
! !
