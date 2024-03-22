Class {
	#name : 'SHObject',
	#superclass : 'Object',
	#instVars : [
		'data'
	],
	#classVars : [
		'BearerAuthentificationToken'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'accessing' }
SHObject class >> bearerAuthentificationToken [

	^ BearerAuthentificationToken ifNil: [ BearerAuthentificationToken := '' ]
]

{ #category : 'accessing' }
SHObject class >> bearerAuthentificationToken: aString [

	BearerAuthentificationToken := aString
]

{ #category : 'instance creation' }
SHObject class >> fromDictionary: aDictionary [

	^ self new
		  data: aDictionary;
		  yourself
]

{ #category : 'accessing' }
SHObject class >> jsonForQuery: aQuery [

	| aSHObject |
	aSHObject := self new.

	^ STONJSON fromString: (aSHObject querySH: aQuery)
]

{ #category : 'accessing' }
SHObject class >> newClient [

	| client |
	client := ZnClient new.

	self bearerAuthentificationToken ifNotEmpty: [ :token | client setBearerAuthentication: token ].

	^ client
]

{ #category : 'accessing' }
SHObject class >> query: aQuery [

	| client |
	client := self newClient
		          get: aQuery;
		          yourself.

	client isSuccess ifFalse: [ SHQueryException signalForData: (STONJSON fromString: client contents) ].

	^ client contents
]

{ #category : 'accessing' }
SHObject class >> querySH: aQuery [

	^ self query: 'https://archive.softwareheritage.org/api/1/' , aQuery
]

{ #category : 'settings' }
SHObject class >> softwareHeritageSettingsOn: aBuilder [

	<systemsettings>
	(aBuilder group: #SoftwareHeritage)
		label: 'SoftwareHeritage';
		with: [
			(aBuilder setting: #bearerAuthentificationToken)
				type: #Password;
				label: 'Bearer authentification token';
				default: '';
				description: 'Software heritage bearer authentification token to authentificate request and increase API limit rate.' ]
]

{ #category : 'accessing' }
SHObject >> data [

	^ data
]

{ #category : 'accessing' }
SHObject >> data: aDictionary [

	data := aDictionary
]

{ #category : 'accessing' }
SHObject >> jsonForQuery: aQuery [ 
	^ self class jsonForQuery: aQuery 
]

{ #category : 'accessing' }
SHObject >> query: aQuery [ 
	^ self class query: aQuery 
]

{ #category : 'accessing' }
SHObject >> querySH: aQuery [ 
	^ self class querySH: aQuery 
]
