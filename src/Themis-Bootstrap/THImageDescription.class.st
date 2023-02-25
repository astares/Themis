"
A spec to describe an image
"
Class {
	#name : #THImageDescription,
	#superclass : #THAbstractImageDescription,
	#category : #'Themis-Bootstrap-Descriptions'
}

{ #category : #building }
THImageDescription >> build [

	self
		buildObjects;
		buildClassses
]

{ #category : #'private - building' }
THImageDescription >> buildClassses [

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
		buildClass: 'Metaclass' asSubclassOf: 'ClassDescription';
		buildClass: 'Package' asSubclassOf: 'Object'
]

{ #category : #'private - building' }
THImageDescription >> buildObjects [

	self
		buildObject: 'ojo.lang' asInstanceOf: 'Namespace';
		buildObject: 'nil' asInstanceOf: 'UndefinedObject';
		buildObject: 'true' asInstanceOf: 'True';
		buildObject: 'false' asInstanceOf: 'False'
]
