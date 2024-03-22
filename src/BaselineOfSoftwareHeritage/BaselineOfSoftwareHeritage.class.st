"
I am a baseline to define the structure and dependencies of the SoftwareHeritage project.
"
Class {
	#name : 'BaselineOfSoftwareHeritage',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSoftwareHeritage',
	#package : 'BaselineOfSoftwareHeritage'
}

{ #category : 'baselines' }
BaselineOfSoftwareHeritage >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages" spec package: 'SoftwareHeritage-Importer' ]
]

{ #category : 'accessing' }
BaselineOfSoftwareHeritage >> projectClass [
	^ MetacelloCypressBaselineProject
]
