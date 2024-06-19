"
I am an interface to allow one to search software heritage database using a pattern and to display the matching projects from SoftwareHeritage API.
"
Class {
	#name : 'SHProjectExplorerByNameOptionPresenter',
	#superclass : 'SHProjectExplorerOptionPresenter',
	#instVars : [
		'textField',
		'searchButton',
		'targetImporter',
		'projectsTable'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'accessing' }
SHProjectExplorerByNameOptionPresenter class >> priority [

	^ 1
]

{ #category : 'initialization' }
SHProjectExplorerByNameOptionPresenter >> connectPresenters [

	searchButton action: [ self updateListWithSearchPattern ]
]

{ #category : 'layout' }
SHProjectExplorerByNameOptionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: textField;
				   add: searchButton expand: false)
		  expand: false;
		  add: 'Projects' expand: false;
		  add: projectsTable;
		  add: targetImporter;
		  yourself
]

{ #category : 'initialization' }
SHProjectExplorerByNameOptionPresenter >> initializePresenters [

	super initializePresenters.
	textField := self newTextInput
		             placeholder: 'Search string';
		             whenTextChangedDo: [ :text | searchButton enabled: text isNotEmpty ];
		             whenSubmitDo: [ :text | self updateListWithSearchPattern ];
		             yourself.

	searchButton := self newButton
		                label: 'Search';
		                disable;
		                yourself.

	projectsTable := self newTable
		                 addColumn: ((SpStringTableColumn title: 'Kind' evaluated: #kind)
				                  width: 60;
				                  yourself);
		                 addColumn: (SpStringTableColumn title: 'Origin' evaluated: #url);
		                 whenSelectionChangedDo: [ :selection | targetImporter forProject: selection selectedItem ].

	targetImporter := self instantiate: SHProjectExplorerTargetSelectionPresenter new
]

{ #category : 'initialization' }
SHProjectExplorerByNameOptionPresenter >> titleForWindow [

	^ 'Search by name'
]

{ #category : 'initialization' }
SHProjectExplorerByNameOptionPresenter >> updateListWithSearchPattern [

	(SHProject projectsFromSearchPattern: textField text) ifNotEmpty: [ :projects |
		projectsTable
			items: projects;
			selectFirst ]
]
