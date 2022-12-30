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
		
		self sqlite3: spec.
		
		spec
			package: 'Themis-Core-Model' with: [ spec requires: 'SQLite3' ];
			package: 'Themis-Core-Model-Tests' with: [ spec requires: #( 'Themis-Core-Model' ) ].

		spec
			group: 'Core' with: #( 'Themis-Core-Model' );
			group: 'Tests' with: #( 'Themis-Core-Model-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]

{ #category : #dependencies }
BaselineOfThemis >> sqlite3: spec [

	spec
			baseline: 'SQLite3'
			with: [
				spec
					repository: 'github://pharo-rdbms/Pharo-SQLite3:v2.2.3/src';
					loads: #('Core') ]
]
