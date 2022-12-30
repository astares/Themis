"
An abstract superclass for an object store
"
Class {
	#name : #THObjectStore,
	#superclass : #Object,
	#category : #'Themis-Core-Persistence-Base'
}

{ #category : #testing }
THObjectStore class >> isAbstract [
		
	^ self == THObjectStore
]
