"
A spec to describe an image
"
Class {
	#name : #THImageSpec,
	#superclass : #Object,
	#instVars : [
		'entries',
		'protoAsRoot'
	],
	#category : #'Themis-Bootstrap-Image'
}

{ #category : #'private - utilities' }
THImageSpec >> addObject: object inRelation: relation to: class [

	entries add: (Array with: object with: relation with: class)
]

{ #category : #building }
THImageSpec >> build [

	self
		buildObjects;
		buildClassses
]

{ #category : #'private - building' }
THImageSpec >> buildClass: aClass asSubclassOf: superclass [

	| metaSuperclass root |
	self buildObject: aClass asInstanceOf: aClass, ' class'.
	self addObject: aClass inRelation: 'superclass' to: superclass.


	metaSuperclass := superclass, ' class'.
	root := protoAsRoot ifTrue: [ 'ProtoObject' ] ifFalse: [ 'Object' ].
	aClass = root ifTrue: [ metaSuperclass := 'Class' ].

	self buildObject: aClass, ' class' asInstanceOf: 'Metaclass'.
	self addObject: aClass, ' class' inRelation: 'superclass' to: metaSuperclass.
]

{ #category : #building }
THImageSpec >> buildClassses [

	protoAsRoot
		ifTrue: [
			self
				buildClass: 'ProtoObject' asSubclassOf: 'nil';
				buildClass: 'Object' asSubclassOf: 'ProtoObject' ]
		ifFalse: [ self buildClass: 'Object' asSubclassOf: 'nil' ].

	self
		buildClass: 'Boolean' asSubclassOf: 'Object';
		buildClass: 'True' asSubclassOf: 'Boolean';
		buildClass: 'False' asSubclassOf: 'Boolean';
		buildClass: 'UndefinedObject' asSubclassOf: 'Object';
		buildClass: 'Behavior' asSubclassOf: 'Object';
		buildClass: 'ClassDescription' asSubclassOf: 'Behavior';
		buildClass: 'Class' asSubclassOf: 'ClassDescription';
		buildClass: 'Metaclass' asSubclassOf: 'ClassDescription'
]

{ #category : #'private - building' }
THImageSpec >> buildObject: object asInstanceOf: class [

	self addObject: object inRelation: 'class' to: class
]

{ #category : #building }
THImageSpec >> buildObjects [

	self
		buildObject: 'nil' asInstanceOf: 'UndefinedObject';
		buildObject: 'true' asInstanceOf: 'True';
		buildObject: 'false' asInstanceOf: 'False'
]

{ #category : #initialization }
THImageSpec >> initialize [

	super initialize.
	entries := OrderedCollection new.
	protoAsRoot := true.
]

{ #category : #'private - building' }
THImageSpec >> inspectionItems: aBuilder [
	<inspectorPresentationOrder: 0 title: 'Instance of'>

	^ aBuilder newTable
		addColumn: (SpStringTableColumn new
			title: 'Object';
			evaluated: [:each | each first asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Relation';
			evaluated: [ :each | each second asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Related';
			evaluated: [:each | each third asString ];
			yourself);
		items: entries;
		yourself
]
