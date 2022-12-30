"
Commmon superclass for remote object stores
"
Class {
	#name : #THRemoteObjectStore,
	#superclass : #THObjectStore,
	#category : #'Themis-Core-Persistence-Base'
}

{ #category : #testing }
THRemoteObjectStore class >> isAbstract [
		
	^ self == THRemoteObjectStore
]
