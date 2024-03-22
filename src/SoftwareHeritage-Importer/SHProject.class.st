Class {
	#name : 'SHProject',
	#superclass : 'SHObject',
	#instVars : [
		'latestVisit',
		'latestSnapshot'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'instance creation' }
SHProject class >> fromOrigin: aString [

	^ self fromDictionary: (self jsonForQuery: 'origin/' , aString , '/get/')
]

{ #category : 'instance creation' }
SHProject class >> projectsFromSearchPattern: aString [

	^ (self jsonForQuery: 'origin/search/' , aString , '/?with_visit=true&limit=1000') collect: [ :dictionary | self fromDictionary: dictionary ]
]

{ #category : 'accessing' }
SHProject >> kind [

	^ (data at: #visit_types) anyOne
]

{ #category : 'accessing' }
SHProject >> latestSnapshot [

	^ latestSnapshot ifNil: [ latestSnapshot := SHProjectSnapshot fromDictionary: (self jsonForQuery: 'snapshot/' , self latestVisit snapshotID) ]
]

{ #category : 'accessing' }
SHProject >> latestVisit [

	^ latestVisit ifNil: [ latestVisit := SHProjectVisit fromDictionary: (self jsonForQuery: 'origin/' , self url , '/visit/latest/') ]
]

{ #category : 'accessing' }
SHProject >> targets [

	^ self latestSnapshot branches
]

{ #category : 'accessing' }
SHProject >> url [

	^ data at: #url
]
