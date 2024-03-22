Class {
	#name : 'SHPullRequestTarget',
	#superclass : 'SHProjectTarget',
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'testing' }
SHPullRequestTarget class >> isValidFor: aReference [

	^ aReference beginsWith: 'refs/pull'
]

{ #category : 'testing' }
SHPullRequestTarget class >> newWith: aReference [

	^ self new
		  name: ((aReference withoutPrefix: 'refs/pull/') withoutSuffix: '/head');
		  yourself
]

{ #category : 'accessing' }
SHPullRequestTarget class >> priority [

	^ 10
]

{ #category : 'accessing' }
SHPullRequestTarget >> iconName [

	^ #merge
]

{ #category : 'accessing' }
SHPullRequestTarget >> kind [

	^ #'Pull request'
]
