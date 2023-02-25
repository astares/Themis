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

	| oid |
	oid := self oidForNamedObject: object.

	entries add: (Array with: oid with: object with: 'id' with: oid with: 'V' ).
	entries add: (Array with: oid with: object with: relation with: class with: 'R').
	entries add: (Array with: oid with: object with: 'name' with: object with: 'V')
]

{ #category : #'private - building' }
THAbstractImageDescription >> buildClass: aClass asSubclassOf: superclass [

	| metaSuperclass root |
	(nameCache includesKey: aClass) ifTrue: [ ^self ].
	self buildObject: aClass asInstanceOf: aClass, ' class'.
	self setRelation: 'superclass' for: aClass to: superclass.

	metaSuperclass := superclass, ' class'.
	root := protoAsRoot ifTrue: [ 'ProtoObject' ] ifFalse: [ 'Object' ].
	aClass = root ifTrue: [ metaSuperclass := 'Class' ].

	self buildObject: aClass, ' class' asInstanceOf: 'Metaclass'.
	self setRelation: 'superclass' for: aClass, ' class' to: metaSuperclass
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
	<inspectorPresentationOrder: 0 title: 'ENTRIES'>

	^ aBuilder newTable
		addColumn: (SpStringTableColumn new
			title: 'Object';
			evaluated: [:each | each second asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Relation';
			evaluated: [ :each | each third asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Value';
			evaluated: [:each | each fourth asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Type';
			evaluated: [:each | each fifth asString ];
			yourself);
		items: entries;
		yourself
]

{ #category : #'private - building' }
THAbstractImageDescription >> inspectionReadableItems: aBuilder [
	<inspectorPresentationOrder: 1 title: 'ENTRIES (R)'>

	^ aBuilder newTable
		addColumn: (SpStringTableColumn new
			title: 'O';
			evaluated: [:each | each first asString ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'R';
			evaluated: [ :each | self oidForNamedObject: (each third asString) ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'V';
			evaluated: [:each |

				(each fifth asString) = 'V'
					ifTrue: [ each fourth asString ]
					ifFalse: [  self oidForNamedObject: each fourth asString ]
				 ];
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'T';
			evaluated: [:each | each fifth asString ];
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

{ #category : #'private - utilities' }
THAbstractImageDescription >> setRelation: aString for: object to: aString3 [

	| oid |
	oid := self oidForNamedObject: object.

	entries add: (Array with: oid with: object with: aString with: aString3 with: 'R' )
]
