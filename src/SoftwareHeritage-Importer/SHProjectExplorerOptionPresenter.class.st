"
I am an abstract UI class to represent exploration options for SoftwareHeritage.

My subclasses will provide interfaces to query and select a project of SoftwareHeritage in different ways.
"
Class {
	#name : 'SHProjectExplorerOptionPresenter',
	#superclass : 'SpPresenter',
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'accessing' }
SHProjectExplorerOptionPresenter class >> allTypes [

	^ (self allSubclasses sort: #priority ascending) collect: [ :class | class new ]
]

{ #category : 'accessing' }
SHProjectExplorerOptionPresenter class >> priority [

	^ self subclassResponsibility
]

{ #category : 'initialization' }
SHProjectExplorerOptionPresenter >> titleForWindow [

	self subclassResponsibility
]
