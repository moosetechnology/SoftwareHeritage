Class {
	#name : 'SHHeadTarget',
	#superclass : 'SHProjectTarget',
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'testing' }
SHHeadTarget class >> isValidFor: aReference [

	^ aReference = 'HEAD'
]

{ #category : 'testing' }
SHHeadTarget class >> newWith: aReference [

	^ self new
		  name: 'Default branch';
		  yourself
]

{ #category : 'accessing' }
SHHeadTarget class >> priority [

	^ 1
]

{ #category : 'accessing' }
SHHeadTarget >> data: aDictionary [

	super data: aDictionary.

	self name: ((aDictionary at: #target) withoutPrefix: 'refs/heads/')
]

{ #category : 'accessing' }
SHHeadTarget >> iconName [

	^ #smallHome
]

{ #category : 'accessing' }
SHHeadTarget >> kind [

	^ #Head
]
