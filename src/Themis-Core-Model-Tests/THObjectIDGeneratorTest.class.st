"
A THObjectIDGeneratorTest is a test class for testing the behavior of THObjectIDGenerator
"
Class {
	#name : #THObjectIDGeneratorTest,
	#superclass : #TestCase,
	#category : #'Themis-Core-Model-Tests-Utilities'
}

{ #category : #tests }
THObjectIDGeneratorTest >> testIsLowercase [ 

	| oid |
	oid := THObjectIDGenerator newObjectID.	
	self assert: oid asLowercase equals: oid
]

{ #category : #tests }
THObjectIDGeneratorTest >> testOIDLength [

	self assert: THObjectIDGenerator newObjectID size equals: 32
]
