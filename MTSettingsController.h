#import <UIKit/UIKit.h>
#import "MTAppDelegate.h"

@interface UIColor (MTerminal) 
+ (id)tableCellGroupedBackgroundColor;
@end

@interface MTSettingsController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIFontPickerViewControllerDelegate, UIColorPickerViewControllerDelegate> {
    NSString *_selectedColorKey;
}
@end
