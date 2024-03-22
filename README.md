# SoftwareHeritage
I am a project holding an integration of Software Heritage with Moose tools.

For now I mostly includes an interface to search Software Heritage projects, select a java project, select some releases, tags or branches and import models from them.

## Installation

To install the project in your Pharo image execute:

```Smalltalk
    Metacello new
    	githubUser: 'moosetechnology' project: 'SoftwareHeritage' commitish: 'main' path: 'src';
    	baseline: 'SoftwareHeritage';
    	load
```

To add it to your baseline:

```Smalltalk
    spec
    	baseline: 'SoftwareHeritage'
    	with: [ spec repository: 'github://moosetechnology/SoftwareHeritage:main/src' ]
```

Note that you can replace the #v1.x.x by another branch such as #development or a tag such as #v1.0.0, #v1.? or #v1.1.?.
