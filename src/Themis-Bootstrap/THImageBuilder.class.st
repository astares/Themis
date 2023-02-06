"
Image builder utility class
"
Class {
	#name : #THImageBuilder,
	#superclass : #Object,
	#instVars : [
		'image'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : #'Themis-Bootstrap'
}

{ #category : #'class initialization' }
THImageBuilder class >> initialize [

	self initializeKnownObjects
]

{ #category : #'private - initialization' }
THImageBuilder class >> initializeKnownObjects [
	<script: 'KnownObjects inspect'>
	KnownObjects := {
		'nil' -> 'c349c34970ad0d00a0df7c0b0fbdbb13'.
		'UndefinedObject' -> '54e8a45c70ad0d00a0e0cf4a0fbdbb13'.

		'true' -> '9605c19970ad0d00a0e8cb220fbdbb13'.
		'True' -> '3f459e9d70ad0d00a0ebe6710fbdbb13'.

		'false	' -> '504d0d9c70ad0d00a0e94f5d0fbdbb13'.
		'False	' -> 'a7adaca070ad0d00a0ed4b840fbdbb13'.
		'False	 class' -> '022ab0a270ad0d00a0ee02920fbdbb13'.

		'Object' -> 'dbc5266d70ad0d00a0e26a4e0fbdbb13'.
		'Object class' -> 'd07edf6d70ad0d00a0e3449f0fbdbb13'.

		'Metaclass' -> 'b4cacf7870ad0d00a0e509060fbdbb13'.
		'Metaclass class' -> '1a7fc9eb5eb00d00ab9abc5c0644a934'.		
		
		'Boolean' -> '9f782a9470ad0d00a0e67d680fbdbb13'.
		'Boolean class' -> 'cfdb0a9570ad0d00a0e75bd80fbdbb13'.

		'Behavior' -> '16b2a7c570ad0d00a0f187db0fbdbb13'.
		'Behavior class' -> 'bffc36c670ad0d00a0f254930fbdbb13'.

		'ClassDescription' -> 'c4f00dca70ad0d00a0f3bcf70fbdbb13'.
		'ClassDescription class' -> '90ba85ca70ad0d00a0f423990fbdbb13'.

	 } asDictionary
]

{ #category : #adding }
THImageBuilder >> addNewSymbolicObject: aString asInstanceOf: classObject [

	| oid clsid |
	oid := KnownObjects at: aString ifAbsent: [ THObjectIDGenerator newObjectID ].
	clsid := KnownObjects at: aString ifAbsent: [ THObjectIDGenerator newObjectID ].
	image symbolTableAt: aString put: oid.
	image symbolTableAt: classObject put: clsid.
	
]

{ #category : #adding }
THImageBuilder >> addSymbolicObject: aString [ 

	| oid |
	oid := KnownObjects at: aString ifAbsent: [ THObjectIDGenerator newObjectID ].
	oid addSymbolicObject: 11
]

{ #category : #accessing }
THImageBuilder >> image [

	^ image ifNil: [ image := THSymbolicImage new ]
]
