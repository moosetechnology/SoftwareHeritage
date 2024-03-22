Class {
	#name : 'SHProjectExplorerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'typeList',
		'selectedType',
		'contentLayout'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'examples' }
SHProjectExplorerPresenter class >> example [

	self new open
]

{ #category : 'accessing' }
SHProjectExplorerPresenter >> allTypes [

	^ SHProjectExplorerOptionPresenter allTypes
]

{ #category : 'layout' }
SHProjectExplorerPresenter >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 30 percent;
		  add: typeList;
		  add: contentLayout;
		  yourself
]

{ #category : 'initialization' }
SHProjectExplorerPresenter >> initializePresenters [

	(typeList := self newList)
		items: self allTypes;
		display: [ :aType | aType titleForWindow ];
		"displayIcon: [ :aType | aType iconForWindow ];"
		whenSelectionChangedDo: [ :selection | self selectionChanged: selection selectedItem ].

	contentLayout := SpBoxLayout newTopToBottom
]

{ #category : 'initialization' }
SHProjectExplorerPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	aSpWindowPresenter initialExtent: (900 @ 500) scaledByDisplayScaleFactor.
	aSpWindowPresenter whenOpenedDo: [ typeList selectIndex: 1 ]
]

{ #category : 'event handling' }
SHProjectExplorerPresenter >> replacePanel [

	contentLayout
		removeAll;
		add: selectedType 
]

{ #category : 'event handling' }
SHProjectExplorerPresenter >> selectionChanged: aType [

	selectedType := aType.
	aType ifNotNil: [
		self updateWindowTitle.
		self replacePanel ]
]

{ #category : 'event handling' }
SHProjectExplorerPresenter >> updateWindowTitle [

	self window title: selectedType titleForWindow
]
