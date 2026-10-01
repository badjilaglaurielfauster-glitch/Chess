Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyPawn >> canMoveForwardTo: aSquare [

    ^ aSquare notNil and: [ aSquare hasPiece not ]
]

{ #category : 'testing' }
MyPawn >> canMoveTwoSquares [

    ^ self isWhite
        ifTrue: [ self square file = $2 ]
        ifFalse: [ self square file = $7 ]
]

{ #category : 'as yet unclassified' }
MyPawn >> captureDiagonalSquares [

    | left right |

    left := self isWhite
        ifTrue: [ self square up left ]
        ifFalse: [ self square down left ].

    right := self isWhite
        ifTrue: [ self square up right ]
        ifFalse: [ self square down right ].

    ^ { left. right } select: [ :s |
        s notNil and: [
            s hasPiece and: [
                s contents color ~= self color ] ] ]
]

{ #category : 'as yet unclassified' }
MyPawn >> forwardSquare [

    ^ self isWhite
        ifTrue: [ self square up ]
        ifFalse: [ self square down ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'as yet unclassified' }
MyPawn >> secondForwardSquare [

    ^ self isWhite
        ifTrue: [ self forwardSquare up ]
        ifFalse: [ self forwardSquare down ]
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

    | nextSquare secondSquare forwardSquares captureSquares |

    forwardSquares := #().

    nextSquare := self forwardSquare.

    (self canMoveForwardTo: nextSquare)
        ifTrue: [
            forwardSquares := { nextSquare }.

            (self canMoveTwoSquares)
                ifTrue: [
                    secondSquare := self secondForwardSquare.

                    (self canMoveForwardTo: secondSquare)
                        ifTrue: [
                            forwardSquares := { nextSquare. secondSquare } ] ] ].

    captureSquares := self captureDiagonalSquares .

    ^ forwardSquares , captureSquares
]
