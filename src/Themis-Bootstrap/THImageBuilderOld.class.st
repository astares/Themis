"
Image builder utility class
"
Class {
	#name : #THImageBuilderOld,
	#superclass : #Object,
	#instVars : [
		'image',
		'symbolTable'
	],
	#classVars : [
		'KnownObjects'
	],
	#category : #'Themis-Bootstrap-Legacy'
}

{ #category : #building }
THImageBuilderOld class >> build [
	<script>
	|builder|
	builder := self new.
	builder
		addSymbolicObject: #'nil' asInstanceOf: #'UndefinedObject';
		addSymbolicObject: #'true' asInstanceOf: #'True';

		addSymbolicObject: #'false' asInstanceOf: #'False';

		addSymbolicObject: #'Metaclass' asInstanceOf: 'Metaclass class';
		addSymbolicObject: #'Metaclass class' asInstanceOf: #'Metaclass';

		addClass: #'UndefinedObject';
		addClass: #'Object';
		addClass: #'Behavior';
		addClass: #'ClassDescription';
		addClass: #'Class';
		addClass: #'Metaclass';
		addClass: #'Boolean';
		addClass: #'True';
		addClass: #'False'.

	builder inspect
]

{ #category : #'class initialization' }
THImageBuilderOld class >> initialize [

	self initializeKnownObjects
]

{ #category : #'private - initialization' }
THImageBuilderOld class >> initializeKnownObjects [
	<script: 'self initializeKnownObjects. KnownObjects inspect'>
	KnownObjects := {
		#'nil' -> 'c349c34970ad0d00a0df7c0b0fbdbb13'.
		#'UndefinedObject' -> '54e8a45c70ad0d00a0e0cf4a0fbdbb13'.
	   #'UndefinedObject class' -> '5f179b7473b00d008e05bbc8091aea72'.

		#'true' -> '9605c19970ad0d00a0e8cb220fbdbb13'.
		#'True' -> '3f459e9d70ad0d00a0ebe6710fbdbb13'.
		#'True class' -> '48f8179efdb00d00b8a7edb6087deccc'.

		#'false' -> '504d0d9c70ad0d00a0e94f5d0fbdbb13'.
		#'False' -> 'a7adaca070ad0d00a0ed4b840fbdbb13'.
		#'False class' -> '022ab0a270ad0d00a0ee02920fbdbb13'.

		#'Object' -> 'dbc5266d70ad0d00a0e26a4e0fbdbb13'.
		#'Object class' -> 'd07edf6d70ad0d00a0e3449f0fbdbb13'.

		#'Behavior' -> '46169529fdb00d00b8356d1f087deccc'.
		#'Behavior class' -> '445f8b2afdb00d00b8363afa087deccc'.

		#'ClassDescription' -> 'a77d4b31fdb00d00b837f763087deccc'.
		#'ClassDescription class' -> 'a16ccc31fdb00d00b8389a7c087deccc'.

		#'Class' -> 'b3be5a60feb00d009124bf8b0c883767'.
		#'Class class' -> '2039dc60feb00d0091253f900c883767'.

		#'Metaclass' -> 'b4cacf7870ad0d00a0e509060fbdbb13'.
		#'Metaclass class' -> '1a7fc9eb5eb00d00ab9abc5c0644a934'.

		#'Boolean' -> '9f782a9470ad0d00a0e67d680fbdbb13'.
		#'Boolean class' -> 'cfdb0a9570ad0d00a0e75bd80fbdbb13'.

		#'Behavior' -> '16b2a7c570ad0d00a0f187db0fbdbb13'.
		#'Behavior class' -> 'bffc36c670ad0d00a0f254930fbdbb13'.

		#'ClassDescription' -> 'c4f00dca70ad0d00a0f3bcf70fbdbb13'.
		#'ClassDescription class' -> '90ba85ca70ad0d00a0f423990fbdbb13'.

	 } asOrderedDictionary
]

{ #category : #accessing }
THImageBuilderOld class >> knownObjects [

	^ KnownObjects
]

{ #category : #accessing }
THImageBuilderOld >> addClass: aClassName [

	self addSymbolicObject: aClassName asInstanceOf: aClassName, ' class'.
	self addSymbolicObject: aClassName, ' class' asInstanceOf: 'Metaclass'
]

{ #category : #accessing }
THImageBuilderOld >> addSymbolicObject: instanceName asInstanceOf: className [ 
		
	| obj cls |
	obj := self symbolicObjectFor: instanceName.
	cls := self symbolicObjectFor: className.
	obj classID: cls oid 
]

{ #category : #accessing }
THImageBuilderOld >> image [

	^ image ifNil: [ image := THImage new ]
]

{ #category : #initialization }
THImageBuilderOld >> initialize [

	super initialize.
	symbolTable := Dictionary new
]

{ #category : #accessing }
THImageBuilderOld >> inspectionItems: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Instance of'>

	^ aBuilder newTable
		addColumn: (SpIndexTableColumn new
			title: 'Index';
			beNotExpandable;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Instance';
			evaluated: [:each | KnownObjects keyAtValue: each key ifAbsent: '' ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Instance ID';
			evaluated: [ :each | each key asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Class';
			evaluated: [:each | KnownObjects keyAtValue: each value classID ifAbsent: '' ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Class ID';
			evaluated: [ :each | each value classID asString ];
			yourself);
		items: self image objectMap associations;
		yourself
]

{ #category : #'private - accessing' }
THImageBuilderOld >> knownOrNewOID: aString [

	^ KnownObjects at: aString ifAbsent: [ THObjectIDGenerator newObjectID ]
]

{ #category : #registration }
THImageBuilderOld >> registerObjectWithID: oid [

	| object |
	object := THObject new oid: oid.
	self image registerObject: object.
	^ object
]

{ #category : #accessing }
THImageBuilderOld >> symbolTable [

	^ symbolTable
]

{ #category : #accessing }
THImageBuilderOld >> symbolicObjectFor: aString [

	| oid |
	oid := self knownOrNewOID: aString.
	^ symbolTable at: aString ifAbsentPut: [ self registerObjectWithID: oid ]
]
