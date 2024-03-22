Class {
	#name : 'SHProjectVisit',
	#superclass : 'SHObject',
	#category : 'SoftwareHeritage-Importer',
	#package : 'SoftwareHeritage-Importer'
}

{ #category : 'accessing' }
SHProjectVisit >> snapshotID [

	^ self data at: #snapshot
]
