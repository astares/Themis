"
A THImageBuilderTest is a test class for testing the behavior of THImageBuilder
"
Class {
	#name : #THOldImageBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'builder'
	],
	#category : #'Themis-Bootstrap-Tests-Legacy'
}

{ #category : #running }
THOldImageBuilderTest >> setUp [

	super setUp.
	builder := THImageBuilderOld new
]

{ #category : #tests }
THOldImageBuilderTest >> testCreateKnownObject [

	| nilObject |
	builder addSymbolicObject: 'nil' asInstanceOf: 'UndefinedObject'.

	nilObject := builder symbolicObjectFor: 'nil'.

	self
		assert: nilObject oid equals: 'c349c34970ad0d00a0df7c0b0fbdbb13';
		assert: (builder symbolicObjectFor: 'UndefinedObject') oid equals: '54e8a45c70ad0d00a0e0cf4a0fbdbb13';
		assert: nilObject classID equals: '54e8a45c70ad0d00a0e0cf4a0fbdbb13'
]

{ #category : #tests }
THOldImageBuilderTest >> testCreateMetacycle [

	| metaClass undefClass |
	builder
		addSymbolicObject: 'nil' asInstanceOf: 'UndefinedObject';
		addSymbolicObject: 'Metaclass' asInstanceOf: 'Metaclass class';

		addClass: 'UndefinedObject';
		addClass: 'Metaclass'.

	self
		assert: builder image objectMap size equals: 5.

	metaClass := builder symbolicObjectFor: 'Metaclass'.
	undefClass := builder symbolicObjectFor: 'UndefinedObject class'.

	self assert: undefClass classID equals: metaClass oid
]

{ #category : #tests }
THOldImageBuilderTest >> testImage [

	self assert: builder image notNil
]

{ #category : #tests }
THOldImageBuilderTest >> testKnownObjectsHaveUniqueKeys [

	|map|
	map := THImageBuilderOld knownObjects.
	self assert: map size equals: map values asSet size
]

{ #category : #tests }
THOldImageBuilderTest >> testSymbolTable [

	self assert: builder symbolTable isEmpty
]
