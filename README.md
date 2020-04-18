# Multipla-API
A guide of the API included with Multipla!

## Getting Started
Multipla loads bundles of widgets located at /Library/Multipla/Widgets. To add your own widget, simply make a DragonBuild/Theos bundle project. An example of a DragonMake for a third party widget is as follows:

```yaml
WIDGETNAME:
    dir: WIDGETNAME
    type: bundle
    files:
        - Widget.m
    archs:
        - arm64
        - arm64e
    stage: 
        - mkdir -p ".dragon/_/Library/Multipla/Widgets/"
        - cp Info.plist ".dragon/_/Library/Multipla/Widgets/WIDGETNAME"
    install_location: "/Library/Multipla/Widgets/WIDGETNAME/"
 ```

Your bundle must have an Info.plist with the following information:
- NSExecutable (the class of which your widget is, for example: EXPExternalWidget)
- name (the display name you want to show on the dock label and in Settings
