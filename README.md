# Multipla-API
A guide of the API included with Multipla!

## Getting Started
Multipla loads bundles of widgets located at /Library/Multipla/Widgets. To add your own widget, simply make a DragonBuild/Theos bundle project. An example of a DragonMake for a third party widget is as follows (don't make a Battery Widget, Multipla already has one):

```yaml

package_name: Multipla_API_Example
install_command: killall -9 SpringBoard

ExternalBatteryWidget:
    dir: Widget
    type: bundle
    files:
        - BatteryWidget.m
    archs:
        - arm64
        - arm64e
    frameworks:
        - BatteryCenter
    stage: 
        - mkdir -p .dragon/_/Library/Multipla/Widgets/BatteryWidget.bundle/
        - cp Resources/Info.plist .dragon/_/Library/Multipla/Widgets/BatteryWidget.bundle/
    install_location: "/Library/Multipla/Widgets/BatteryWidget.bundle/"

 ```

Your bundle must have an Info.plist with the following information:
- NSPrincipalClass (the class of which your widget is, for example: EXPExternalWidget)
- CFBundleExecutable (the executable name of the compiled widget class)
- name (the display name you want to show on the dock label and in Settings

Example of a Info.plist for the battery widget class shown above in the DragonMake example:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleExecutable</key>
	<string>ExternalBatteryWidget</string>
	<key>NSPrincipalClass</key>
	<string>ExternalBatteryWidget</string>
	<key>name</key>
	<string>Batteries 3rd Party</string>
</dict>
</plist>
```

Multipla will get the compiled version of your class and create an instance of it on the dock for use when needed.

In order to make this possible, have your class include the following methods:
```objc
    -(instancetype)initWithFrame:(CGRect)arg1;
    -(void)updateWidget;
```
The update widget method does not have to include anything if your widget does not need to update it's data when it is about to show. You can leave this method blank, but make sure to include it..

You can do anything you like in the init method, and you may include other methods as you see fit. In order to tell if your widget is hidden or showing from the class itself, you can override the setter method for the property `alpha`. Note you do not need to manually call `[self updateWidget];` in most cases, with some exceptions, as Multipla calls this when your widget is about to show.

For example:
```objc
-(void)setAlpha:(CGFloat)arg1 {
  if(arg1==0) {
    //it is hidden
    //do stuff here
  } else {
    //not hidden
  }
  %orig;
}
```

If you need to refresh your widget while it is showing, you can make use of system post notifications being sent, or even include a tweak subproject for the purpose of sending these notifications to update whenever you choose. Just add an observer in the init method for the notification you want to listen for, and have it call the selector `updateWidget`.

## Closing notes
If you are confused, pm me or take a look at the example project in this repository. The widget will appear in the select widgets page in Multipla's settings.
