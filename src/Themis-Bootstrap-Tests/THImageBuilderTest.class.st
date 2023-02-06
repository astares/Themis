"
A THImageBuilderTest is a test class for testing the behavior of THImageBuilder
"
Class {
	#name : #THImageBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Themis-Bootstrap-Tests'
}

{ #category : #running }
THImageBuilderTest >> setUp [

	super setUp.
	builder := THImageBuilder new
]

{ #category : #tests }
THImageBuilderTest >> testCreateKnownObject [

	builder addSymbolicObject: 'nil' asInstanceOf: 'UndefinedObject'.
	self assert: (builder image symbolReferenceFor: 'nil') id equals: ''
]

{ #category : #tests }
THImageBuilderTest >> testImage [

	self assert: THImageBuilder new image notNil
]
