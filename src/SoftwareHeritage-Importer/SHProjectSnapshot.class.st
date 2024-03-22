Class {
	#name : 'SHProjectSnapshot',
	#superclass : 'SHObject',
	#instVars : [
		'branches'
	],
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'branches' }
SHProjectSnapshot >> branches [

	^ branches ifNil: [ branches := SHProjectTarget allTargetsFrom: (data at: #branches) ]
]
