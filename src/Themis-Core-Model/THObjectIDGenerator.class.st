"
Utility class to generate unique object ids
"
Class {
	#name : #THObjectIDGenerator,
	#superclass : #Object,
	#category : #'Themis-Core-Model-Utilities'
}

{ #category : #testing }
THObjectIDGenerator class >> isAbstract [
		
	^ self == THObjectIDGenerator
]

{ #category : #generating }
THObjectIDGenerator class >> newObjectID [
	<script: 'self newObjectID inspect'>
	
	^ (UUID new asString copyReplaceAll: '-' with: '')
]
