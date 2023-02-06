Class {
	#name : #THSymbolicImage,
	#superclass : #Object,
	#instVars : [
		'symbols',
		'objects'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : #'Themis-Bootstrap'
}

{ #category : #accessing }
THSymbolicImage >> addObject: aName class: aClass [


	symbols at: aName put: self createObject id
]

{ #category : #accessing }
THSymbolicImage >> createObject: id [

	self objects at: ''
]

{ #category : #initialization }
THSymbolicImage >> initialize [ 
	
	super initialize.
	symbols := Dictionary new.
	objects := Dictionary new.
]

{ #category : #accessing }
THSymbolicImage >> symbolReferenceFor: aString [

	^ symbols at: aString ifAbsent: nil
]
