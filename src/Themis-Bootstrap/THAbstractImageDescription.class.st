"
I'm an abstract description to build an image
"
Class {
	#name : #THAbstractImageDescription,
	#superclass : #Object,
	#instVars : [
		'entries',
		'idCache',
		'protoAsRoot',
		'nameCache'
	],
	#category : #'Themis-Bootstrap-Descriptions'
}

{ #category : #testing }
THAbstractImageDescription class >> isAbstract [

	^ self == THAbstractImageDescription
]

{ #category : #'private - utilities' }
THAbstractImageDescription >> addNamedObject: object inRelation: relation to: class [

	| id |
	id := self oidForNamedObject: object.

	entries add: (Array with: object with: 'id' with: id).
	entries add: (Array with: object with: relation with: class)
]

{ #category : #'private - building' }
THAbstractImageDescription >> buildClass: aClass asSubclassOf: superclass [

	| metaSuperclass root |
	self buildObject: aClass asInstanceOf: aClass, ' class'.
	self addNamedObject: aClass inRelation: 'superclass' to: superclass.

	metaSuperclass := superclass, ' class'.
	root := protoAsRoot ifTrue: [ 'ProtoObject' ] ifFalse: [ 'Object' ].
	aClass = root ifTrue: [ metaSuperclass := 'Class' ].

	self buildObject: aClass, ' class' asInstanceOf: 'Metaclass'.
	self addNamedObject: aClass, ' class' inRelation: 'superclass' to: metaSuperclass
]

{ #category : #'private - building' }
THAbstractImageDescription >> buildObject: object asInstanceOf: class [

	self addNamedObject: object inRelation: 'class' to: class
]

{ #category : #initialization }
THAbstractImageDescription >> initialize [

	super initialize.
	entries := OrderedCollection new.
	protoAsRoot := true.
	nameCache := Dictionary new
]

{ #category : #'private - building' }
THAbstractImageDescription >> inspectionItems: aBuilder [
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

{ #category : #'private - utilities' }
THAbstractImageDescription >> oidForNamedObject: object [

	^ nameCache
		  at: object
		  ifAbsentPut: [ THObjectIDGenerator newObjectID ]
]
