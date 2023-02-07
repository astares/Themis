"
A THSymbolicImageTest is a test class for testing the behavior of THSymbolicImage
"
Class {
	#name : #THImageTest,
	#superclass : #TestCase,
	#instVars : [
		'image'
	],
	#category : #'Themis-Bootstrap-Tests'
}

{ #category : #'accessing - defaults' }
THImageTest >> defaultTestClass [

	^ THImage
]

{ #category : #running }
THImageTest >> setUp [

	super setUp.
	image := self defaultTestClass new
]

{ #category : #tests }
THImageTest >> testRegisterObject [

	|object result |
	object := THObject oid: '1' clsid: '2'.

	self
		deny: (image hasObjectWithId: '1');
		deny: (image hasObjectWithId: '2').

	result := image registerObject: object.

	self
		assert: (image hasObjectWithId: '1');
		deny: (image hasObjectWithId: '2').

	self assert: result identicalTo: object
]
