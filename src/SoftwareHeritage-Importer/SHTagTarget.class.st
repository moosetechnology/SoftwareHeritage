Class {
	#name : 'SHTagTarget',
	#superclass : 'SHProjectTarget',
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'testing' }
SHTagTarget class >> isValidFor: aReference [

	^ aReference beginsWith: 'refs/tags'
]

{ #category : 'testing' }
SHTagTarget class >> newWith: aReference [

	^ self new
		  name: (aReference withoutPrefix: 'refs/tags/');
		  yourself
]

{ #category : 'accessing' }
SHTagTarget class >> priority [

	^ 3
]

{ #category : 'accessing' }
SHTagTarget >> iconName [

	^ #glamorousBookmark
]

{ #category : 'accessing' }
SHTagTarget >> kind [

	^ #Tag
]

{ #category : 'action' }
SHTagTarget >> revisionToDownload [

	^ self revision revision
]
