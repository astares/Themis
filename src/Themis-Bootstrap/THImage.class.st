"
An image
"
Class {
	#name : #THImage,
	#superclass : #Object,
	#instVars : [
		'symbolTable',
		'objectMap'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : #'Themis-Bootstrap'
}

{ #category : #accessing }
THImage >> hasObjectWithId: anOID [

	^ objectMap includesKey: anOID
]

{ #category : #initialization }
THImage >> initialize [

	super initialize.
	objectMap := Dictionary new
]

{ #category : #accessing }
THImage >> registerObject: anObject [

	^ objectMap at: anObject oid put: anObject
]
