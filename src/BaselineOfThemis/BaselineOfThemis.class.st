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

		"Dependencies"		
		self 
			sqlite3: spec;
			tealight: spec.
		
		"Packages"
		spec
			package: 'Themis-Core-Model' with: [ spec requires: #('SQLite3' 'Tealight')];
			package: 'Themis-Core-Model-Tests' with: [ spec requires: #( 'Themis-Core-Model' ) ];
			package: 'Themis-Core-Persistence' with: [ spec requires: #( 'Themis-Core-Model' ) ];
			package: 'Themis-Core-Web' with: [ spec requires: #( 'Themis-Core-Model' 'Themis-Core-Persistence' ) ];
			package: 'Themis-Core-Tools' with: [ spec requires: #( 'Themis-Core-Persistence' 'Themis-Core-Web') ].

		"Groups"
		spec
			group: 'Core' with: #( 'Themis-Core-Model' );
			group: 'Persistence' with: #( 'Themis-Core-Persistence' );
			group: 'Web' with: #( 'Themis-Core-Web' );			
			group: 'Tools' with: #( 'Themis-Core-Tools' );			
			group: 'Tests' with: #( 'Themis-Core-Model-Tests' );
		"Virtual groups"	
			group: 'all' with: #( 'Core' 'Persistence' 'Web' 'Tools' 'Tests' );
			group: 'default' with: #( 'all' ) ]
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

{ #category : #dependencies }
BaselineOfThemis >> tealight: spec [

	spec
			baseline: 'Tealight'
			with: [
				spec
					repository: 'github://astares/Tealight:main/src';
					loads: #('Tools') ]
]
