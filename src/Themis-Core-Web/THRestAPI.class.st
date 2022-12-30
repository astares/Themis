Class {
	#name : #THRestAPI,
	#superclass : #Object,
	#category : #'Themis-Core-Web-REST-Base'
}

{ #category : #accessing }
THRestAPI class >> greeting: aRequest [
	<REST_API: 'GET' versions: #('v1') pattern: 'hello'>
	
	^'HelloWorld from Themis'
]

{ #category : #initialization }
THRestAPI class >> initialize [ 

	self regenerateAPI 
]

{ #category : #'private - initialization' }
THRestAPI class >> regenerateAPI [
	<script>
  	
	TLRESTAPIBuilder buildAPI.
	self inform: 'API regenerated'
]
