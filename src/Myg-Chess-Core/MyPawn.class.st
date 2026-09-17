Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

    | nextSquare secondSquare |

    nextSquare := self isWhite
        ifTrue: [ self square up ]
        ifFalse: [ self square down ].

    "Sécurité : si on est sur la dernière rangée ou hors plateau"
    (nextSquare isNil or: [ nextSquare hasPiece ]) ifTrue: [ ^ #() ].

    "Vérifie si le pion est sur sa rangée de départ ($2 pour les blancs, $7 pour les noirs)"
    ((self isWhite and: [ self square file = $2 ])
        or: [ self isWhite not and: [ self square file = $7 ] ])
        ifTrue: [
            secondSquare := self isWhite
                ifTrue: [ nextSquare up ]
                ifFalse: [ nextSquare down ].

            (secondSquare notNil and: [ secondSquare hasPiece not ]) ifTrue: [
                ^ { nextSquare. secondSquare } ] ].

    "Déplacement simple d'une seule case"
    ^ { nextSquare }
]
