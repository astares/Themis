"
Provide items in world menu
"
Class {
	#name : #THWorldMenu,
	#superclass : #Object,
	#category : #'Themis-Core-Tools'
}

{ #category : #'world menu' }
THWorldMenu class >> idMenuCommandOn: aBuilder [
	<worldMenu>
	| parent |
	parent := self mainMenuSymbol.
	
	(aBuilder item: #'Generate OID')
		parent: parent;
		action: [ 
				Clipboard clipboardText: THObjectIDGenerator newObjectID.
				Clipboard clipboardText inspect ]
]

{ #category : #'accessing - defaults' }
THWorldMenu class >> mainMenuSymbol [

	^ #Themis
]

{ #category : #'world menu' }
THWorldMenu class >> menuCommandOn: aBuilder [ 
	<worldMenu>
	
	| parent |
	parent := self mainMenuSymbol.
	(aBuilder item: parent)
		order: 3.0. 
	 
]

{ #category : #'world menu' }
THWorldMenu class >> restAPIMenuCommandOn: aBuilder [
	<worldMenu>
	| parent |
	parent := self mainMenuSymbol.
	
	(aBuilder item: #'Regenerate REST API')
		parent: parent;
		action: [ THRestAPI regenerateAPI ]
]

{ #category : #'world menu' }
THWorldMenu class >> serverMenuCommandOn: aBuilder [
	<worldMenu>
	| parent |
	parent := self mainMenuSymbol.
	(aBuilder item: #Webserver)
		parent: parent;
		order: 2;
		icon: TLIconCache serverIcon.

	(aBuilder item: #'Start webserver')
		parent: #Webserver;
		icon: TLIconCache serverStartIcon;
		action: [ THWebserver start ].

	(aBuilder item: #'Stop webserver')
		parent: #Webserver;
		icon: TLIconCache serverStopIcon;
		action: [ THWebserver stop ].

	aBuilder withSeparatorAfter.

	(aBuilder item: #'Browse webserver')
		parent: #Webserver;
		icon: TLIconCache serverIcon;
		action: [ THWebserver openWebbrowser ]
]
