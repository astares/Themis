"
Image builder utility class
"
Class {
	#name : #THImageBuilder,
	#superclass : #Object,
	#instVars : [
		'image',
		'symbolTable'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : #'Themis-Bootstrap-Base'
}

{ #category : #building }
THImageBuilder class >> build [

	|builder|
	builder := self new.
	builder
		addSymbolicObject: 'nil' asInstanceOf: 'UndefinedObject';
		addSymbolicObject: 'true' asInstanceOf: 'True';
		addSymbolicObject: 'false' asInstanceOf: 'False';

		addSymbolicObject: 'Metaclass' asInstanceOf: 'Metaclass class';

		addClass: 'UndefinedObject';
		addClass: 'Metaclass';
		addClass: 'Boolean';
		addClass: 'True';
		addClass: 'False'.

	builder inspect
]

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
	   'UndefinedObject' -> '5f179b7473b00d008e05bbc8091aea72'.

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

{ #category : #accessing }
THImageBuilder >> addClass: aClassName [

	self addSymbolicObject: aClassName asInstanceOf: aClassName, ' class'.
	self addSymbolicObject: aClassName, ' class' asInstanceOf: 'Metaclass'
]

{ #category : #accessing }
THImageBuilder >> addSymbolicObject: instanceName asInstanceOf: className [ 
		
	| obj cls |
	obj := self symbolicObjectFor: instanceName.
	cls := self symbolicObjectFor: className.
	obj classID: cls oid 
]

{ #category : #accessing }
THImageBuilder >> image [

	^ image ifNil: [ image := THImage new ]
]

{ #category : #initialization }
THImageBuilder >> initialize [

	super initialize.
	symbolTable := Dictionary new
]

{ #category : #'private - accessing' }
THImageBuilder >> knownOrNewOID: aString [

	^ KnownObjects at: aString ifAbsent: [ THObjectIDGenerator newObjectID ]
]

{ #category : #registration }
THImageBuilder >> registerObjectWithID: oid [

	| object |
	object := THObject new oid: oid.
	self image registerObject: object.
	^ object
]

{ #category : #accessing }
THImageBuilder >> symbolTable [

	^ symbolTable
]

{ #category : #accessing }
THImageBuilder >> symbolicObjectFor: aString [

	| oid |
	oid := self knownOrNewOID: aString.
	^ symbolTable at: aString ifAbsentPut: [ self registerObjectWithID: oid ]
]
