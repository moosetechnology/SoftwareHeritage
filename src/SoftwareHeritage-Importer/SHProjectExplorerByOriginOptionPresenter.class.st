Class {
	#name : 'SHProjectExplorerByOriginOptionPresenter',
	#superclass : 'SHProjectExplorerOptionPresenter',
	#instVars : [
		'textField',
		'searchButton',
		'targetImporter'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'accessing' }
SHProjectExplorerByOriginOptionPresenter class >> priority [

	^ 5
]

{ #category : 'initialization' }
SHProjectExplorerByOriginOptionPresenter >> connectPresenters [

	searchButton action: [ self searchOrigin ]
]

{ #category : 'layout' }
SHProjectExplorerByOriginOptionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: textField;
				   add: searchButton expand: false)
		  expand: false;
		  add: targetImporter;
		  yourself
]

{ #category : 'layout' }
SHProjectExplorerByOriginOptionPresenter >> errorLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: textField;
				   add: searchButton expand: false)
		  expand: false;
		  add: 'The provided origin does not match any project on Software heritage. Please, try again.';
		  yourself
]

{ #category : 'initialization' }
SHProjectExplorerByOriginOptionPresenter >> initializePresenters [

	super initializePresenters.

	textField := self newTextInput
		             placeholder: 'Origin URL (ex: https://github.com/apache/commons-collections)';
		             whenTextChangedDo: [ :text | searchButton enabled: text isNotEmpty ];
		             whenSubmitDo: [ :text | self searchOrigin ];
		             yourself.

	searchButton := self newButton
		                label: 'Search';
		                disable;
		                yourself.

	targetImporter := self instantiate: SHProjectExplorerTargetSelectionPresenter new
]

{ #category : 'actions' }
SHProjectExplorerByOriginOptionPresenter >> searchOrigin [

	[
	targetImporter forProject: (SHProject fromOrigin: textField text).
	self layout: self defaultLayout ]
		on: SHQueryException
		do: [ self layout: self errorLayout ]
]

{ #category : 'initialization' }
SHProjectExplorerByOriginOptionPresenter >> titleForWindow [

	^ 'Search by origin'
]
