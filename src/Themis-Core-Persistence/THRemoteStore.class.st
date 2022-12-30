Class {
	#name : #THRemoteStore,
	#superclass : #THObjectStore,
	#category : #'Themis-Core-Persistence'
}

{ #category : #testing }
THRemoteStore class >> isAbstract [
		
	^ self == THRemoteStore
]
