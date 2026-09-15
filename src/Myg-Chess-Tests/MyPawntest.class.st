Class {
	#name : 'MyPawntest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawntest >> testCantMoveForwardInFrontOfBlackPawnAsWhitePawn [

|p1 p2 square board|
   board := MyChessBoard empty.
	board at: 'e4' put: (p1 := MyPawn white).
	board at: 'e5' put:  (p2:= MyPawn black ). 
	
	square := p1 targetSquares .
	self
		deny: (square includes: (board at: 'e5'))
]

{ #category : 'tests' }
MyPawntest >> testMovesBlackPawn [

| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e5' put: (pawn := MyPawn black).
	
	squares := pawn targetSquares.
	
	self 
		assertCollection: squares 
		includesAll: (#(e4) collect: [ :name | board at: name ]).
]

{ #category : 'tests' }
MyPawntest >> testMovesToTwoCasesBlackPawn [
| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black ).

	squares := pawn targetSquares.

	self
		assertCollection: squares
		includesAll: (#('e6' 'e5') collect: [ :name | board at: name ]).
	self assert: squares size equals: 2.

]

{ #category : 'tests' }
MyPawntest >> testMovesToTwoCasesWhitePawn [
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.

	self
		assertCollection: squares
		includesAll: (#('e3' 'e4') collect: [ :name | board at: name ]).
	self assert: squares size equals: 2.
]

{ #category : 'tests' }
MyPawntest >> testMovesWhitePawn [
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	
	squares := pawn targetSquares.
	
	self 
		assertCollection: squares 
		includesAll: (#(e5) collect: [ :name | board at: name ]).
]
