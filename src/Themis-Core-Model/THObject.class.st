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

{ #category : #'instance creation' }
THObject class >> oid: objectID clsid: classID [

	^ self new
		  oid: objectID;
		  classID: classID;
		  yourself
]

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
