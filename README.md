# Multipla-API
A guide of the API included with Multipla!

## Getting Started
Multipla loads bundles of widgets located at /Library/Multipla/Widgets. To add your own widget, simply make a DragonBuild/Theos bundle project. An example of a DragonMake for a third party widget is as follows:

//HERE IS WHERE I PUT IT 

Your bundle must have an Info.plist with the following information:
- NSExecutable (the class of which your widget is, for example: EXPExternalWidget)
- name (the display name you want to show on the dock label and in Settings
