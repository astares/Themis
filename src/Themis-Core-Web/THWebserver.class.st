"
Themis webserver
"
Class {
	#name : #THWebserver,
	#superclass : #Object,
	#category : #'Themis-Core-Web-Base'
}

{ #category : #running }
THWebserver class >> openWebbrowser [
	<script>

	TLWebserver openWebbrowser
]

{ #category : #running }
THWebserver class >> start [ 
	<script>
	
	TLWebserver start
]

{ #category : #running }
THWebserver class >> stop [ 
	<script>
	
	TLWebserver stop
]
