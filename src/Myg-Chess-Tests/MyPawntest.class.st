Class {
	#name : 'MyPawntest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

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
