"
I am a class used to manage the importation of SoftwareHeritage projects.

I take a list of SoftwareHeritage targets and I create a model from them and import them in MooseIDE.

Note: For now this only works for java projects. Work is needed to support more languages.
"
Class {
	#name : 'SHImporter',
	#superclass : 'Object',
	#instVars : [
		'downloadedFolders'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'actions' }
SHImporter class >> downloadAndImport: aListOfTargets [

	^ self new downloadAndImport: aListOfTargets
]

{ #category : 'actions' }
SHImporter >> download: aListOfTargets [

	[ :job |
	| revisionsToDownloadMap |
	job title: 'Requesting cooking'.
	WorldMorph doOneCycle.

	revisionsToDownloadMap := (aListOfTargets collect: [ :target | target downloadFolderName -> target revisionToDownload ]) asDictionary.

	"We start by requesting the cooking of all revisions."
	revisionsToDownloadMap valuesDo: [ :revision | revision requestCooking ].

	job
		progress: 0.33;
		title: 'Waiting for Software Heritage download availability'.

	WorldMorph doOneCycle.

	"Then we wait until all revisions are ready. We could optimize by starting the download of cooked revisions directly but this will be a further optimization. Not for now."
	[ revisionsToDownloadMap values allSatisfy: [ :revision | revision isAvailableForDownload ] ] whileFalse: [
		10 seconds wait.
		revisionsToDownloadMap valuesDo: [ :revision | revision isAvailableForDownload ifFalse: [ revision checkAvailability ] ] ].
	job
		progress: 0.66;
		title: 'Downloading'.
	WorldMorph doOneCycle.
	revisionsToDownloadMap keysAndValuesDo: [ :folderName :revision |
		revision downloadInFolderNamed: folderName.
		downloadedFolders add: folderName asFileReference ] ] asJob run
]

{ #category : 'actions' }
SHImporter >> downloadAndImport: aListOfTargets [

	self download: aListOfTargets.

	FamixJavaFoldersImporter importAndInstallFolders: downloadedFolders
]

{ #category : 'initialization' }
SHImporter >> initialize [

	super initialize.
	downloadedFolders := OrderedCollection new
]
