"
Baseline for [https://github.com/astares/Themis/](https://github.com/astares/Themis/)
"
Class {
	#name : #BaselineOfThemis,
	#superclass : #BaselineOf,
	#category : #BaselineOfThemis
}

{ #category : #baselines }
BaselineOfThemis >> baseline: spec [
	<baseline>
	
	spec for: #common do: [ 
		spec
			package: 'Themis-Core-Model';
			package: 'Themis-Core-Model-Tests'
			with: [ spec requires: #( 'Themis-Core-Model' ) ].

		spec
			group: 'Core' with: #( 'Themis-Core-Model' );
			group: 'Tests' with: #( 'Themis-Core-Model-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]
