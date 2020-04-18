#import <UIKit/UIKit.h>

@interface ExternalBatteryWidget : UIView
-(instancetype)initWithFrame:(CGRect)arg1;
-(void)updateWidget;
@end

@implementation ExternalBatteryWidget

-(instancetype)initWithFrame:(CGRect)arg1 {
    self = [super initWithFrame:arg1];
    if (self) {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45,20,300,25)];
            [label setFont:[UIFont systemFontOfSize:15]];
        [label setTextColor:[UIColor whiteColor]];
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.numberOfLines = 0;
        [label setText:@"3rd party not a battery widget lol"];

        [self addSubview:label];
        //Optionally you can run [self updateWidget] here.
    }
    return self;
}


-(void)updateWidget {
}

@end