"
I am an interface that takes a SoftwareHeritage project as entry and display the possible targets to download and import (it can be branch heads, PR, releases, tags...)
"
Class {
	#name : 'SHProjectExplorerTargetSelectionPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'importButton',
		'targetsTable',
		'selectedTargets'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'initialization' }
SHProjectExplorerTargetSelectionPresenter >> connectPresenters [

	importButton action: [ SHImporter downloadAndImport: selectedTargets ]
]

{ #category : 'layout' }
SHProjectExplorerTargetSelectionPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: 'Targets' expand: false;
		  add: targetsTable;
		  add: importButton expand: false;
		  yourself
]

{ #category : 'accessing' }
SHProjectExplorerTargetSelectionPresenter >> forProject: aProject [

	selectedTargets := OrderedCollection new.
	targetsTable
		items: (aProject
				 ifNil: [ #(  ) ]
				 ifNotNil: [ aProject targets ]);
		selectFirst
]

{ #category : 'initialization' }
SHProjectExplorerTargetSelectionPresenter >> initializePresenters [

	super initializePresenters.

	targetsTable := self newTable
		                addColumn: ((SpCheckBoxTableColumn evaluated: [ :target | selectedTargets includes: target ])
				                 onActivation: [ :target | selectedTargets add: target ];
				                 onDeactivation: [ :target | selectedTargets remove: target ];
				                 width: 20);
		                addColumn: (SpImageTableColumn new
				                 evaluated: [ :project | self iconNamed: project iconName ];
				                 beNotExpandable;
				                 width: 20;
				                 yourself);
		                addColumn: ((SpStringTableColumn title: 'Kind' evaluated: #kind)
				                 width: 80;
				                 yourself);
		                addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		                whenSelectionChangedDo: [ :selection | importButton enabled: selection isEmpty not ];
		                yourself.

	importButton := self newButton
		                label: 'Import';
		                disable;
		                yourself
]
