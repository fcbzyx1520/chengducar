//
//  CustomerBaseInfo.h
//  JeepDemo
//
//  Created by fu on 12-11-11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"
#define kdid 0
@interface CustomerBaseInfo : UIViewController {
   NSMutableDictionary *dic;
	
	UIButton *cbxprovince;
	UIButton *cbxcity;
	UIButton *cbxcompony;
	UIView *pickerUIView;
	NSArray *pickerData;
  UIPickerView *picker;
	NSInteger pickertype;
}
@property (nonatomic,retain) NSMutableDictionary *dic;
@property (nonatomic,assign) NSInteger pickertype;
@property (nonatomic,retain) NSArray *pickerData;
@property (nonatomic,retain) IBOutlet UIView *pickerUIView;
@property (nonatomic,retain) IBOutlet UIPickerView *picker;
@property (nonatomic,retain) IBOutlet UIButton *cbxprovince;
@property (nonatomic,retain) IBOutlet UIButton *cbxcity;
@property (nonatomic,retain) IBOutlet UIButton *cbxcompony;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)cbxclickProvince;
-(IBAction)cbxclickCity;

@end
