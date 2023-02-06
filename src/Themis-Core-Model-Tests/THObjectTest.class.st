"
A THObjectTest is a test class for testing the behavior of THObject
"
Class {
	#name : #THObjectTest,
	#superclass : #TestCase,
	#category : #'Themis-Core-Model-Tests-Base'
}

{ #category : #tests }
THObjectTest >> testInstanceCreation [

	| obj |
	obj := THObject oid: '1' clsid: '2'.

	self 
		assert: obj oid equals: '1'; 
		assert: obj classID equals: '2' 
	 
]
