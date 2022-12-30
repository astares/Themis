"
A themis object
"
Class {
	#name : #THObject,
	#superclass : #Object,
	#instVars : [
		'oid',
		'classID'
	],
	#category : #'Themis-Core-Model-Base'
}

{ #category : #accessing }
THObject >> classID [

	^ classID
]

{ #category : #accessing }
THObject >> classID: anObject [

	classID := anObject
]

{ #category : #accessing }
THObject >> oid [

	^ oid
]

{ #category : #accessing }
THObject >> oid: anObject [

	oid := anObject
]
