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

Multipla will get the compiled version of your class and create an instance of it on the dock for use when needed.

In order to make this possible, have your class include the following methods:
```objc
    -(instancetype)initWithFrame:(CGRect)arg1;
    -(void)updateWidget;
```
The update widget method does not have to include anything if your widget does not need to update it's data when it is about to show. You can leave this method blank, but make sure to include it, for Multipla will attempt to call this method when your widget is on queue to show.

You can do anything you like in the init method, and you may include other methods as you see fit. In order to tell if your widget is hidden or showing from the class itself, you can override the setter method for the property `alpha`.

For example:
```objc
-(void)setAlpha:(CGFloat)arg1 {
  if(arg1==0) {
    isHidden=YES;
  } else {
    isHidden=NO;
  }
  %orig;
}
```
