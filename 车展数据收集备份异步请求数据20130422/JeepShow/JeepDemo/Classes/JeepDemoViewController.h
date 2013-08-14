//
//  JeepDemoViewController.h
//  JeepDemo
//
//  Created by fu on 12-11-10.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassDelegare.h"
#define kdid 0
@class Test;
@interface JeepDemoViewController : UIViewController{

	Test *testcontroller;
	UIButton *lblchezhu;
	UIButton *lblcar;
	NSArray *pickerData;
	UIPickerView *picker;
	UIView *pickerUIView;
	id<PassValueDelegate> passDelegate;
	BOOL IsChezhu;
    NSString *cbxtxt;
    CGFloat screenheight;
}
@property (nonatomic, retain) NSString *cbxtxt;
@property (nonatomic, retain) Test *testcontroller;
@property (nonatomic, assign) BOOL IsChezhu;
-(IBAction)btnLogionClick:(id)sender;
@property (nonatomic,retain) IBOutlet UIButton *lblchezhu;
@property (nonatomic,retain) IBOutlet UIButton *lblcar;
@property (nonatomic, retain) NSArray *pickerData;
@property (nonatomic,retain) IBOutlet  UIPickerView *picker;
@property (nonatomic,retain) IBOutlet  UIView *pickerUIView;
@property (nonatomic,retain) id<PassValueDelegate> passDelegate;
-(IBAction)cbxclickchezhu;
-(IBAction)cbxclickcar;
-(IBAction)cbxfished;
-(IBAction)backgroundTap:(id)sender;
@end

