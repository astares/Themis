"
An image
"
Class {
	#name : #THImage,
	#superclass : #Object,
	#instVars : [
		'objectMap'
	],
	#category : #'Themis-Bootstrap-Base'
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
THImage >> objectMap [

	^ objectMap
]

{ #category : #accessing }
THImage >> registerObject: anObject [

	^ objectMap at: anObject oid put: anObject
]
