//
//  Test.h
//  JeepDemo
//
//  Created by fu on 12-11-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassDelegare.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomerInfoModel.h"
#import "JeepDemoAppDelegate.h"
#import "MBProgressHUD.h"
#import "JSONKit.h"
#import "ZBarSDK.h"


@class CustomerBaseInfo;
@class CustomerInfoModel;
#define kdid 0
#define leftd 29
#define topd 155
#define topsex 275
@interface Test : UIViewController <NSURLConnectionDelegate,UITableViewDelegate, UITableViewDataSource,PassValueDelegate,MBProgressHUDDelegate, ZBarReaderDelegate,UIAlertViewDelegate>{
	NSString *_value;
	NSMutableDictionary *dic;
	UILabel *lblmsg;
	UIView *scrollviewinfo;
	CustomerBaseInfo *custmerinfo;
	CustomerInfoModel *custmerMode;
	UIAlertView *myalertView;
		IBOutlet UIView *view1;
		IBOutlet UIView *view2;
		IBOutlet UIView *view3;
    IBOutlet UIView *view5;
	IBOutlet UIView *view4;
	 UIView *pickerUIView;
	 NSArray *pickerData;
	UIPickerView *picker;
	UIButton *cbxprovince;
	UIButton *cbxcity;
	UIButton *cbxcompony;
	NSInteger pickertype;
	NSDictionary *stateZips;
	NSArray	*states;
	NSArray *zips;
	
	UITextField *txtName;
	UITextField *txtPhone;
	UITextField *txtEmail;
	NSString *Q1;
	NSString *Q2;
	NSString *iskeyi;
	NSString *sexc;
	
	NSArray *rbgroup1;
	NSArray *rbgroup2;
	NSArray *rbgroup3;
	NSArray *rbgroup4;
    NSArray *rbgroup5;
	NSMutableDictionary *dicrbvalue;
	
	NSArray *tableArray;
	
	UITableView *tableView1;
	UITableView *tableView2;
	UISegmentedControl *sc1;
	UISegmentedControl *sc2;
	UISegmentedControl *sc3;
	UISegmentedControl *sc4;
    
	BOOL Isupload;
	NSInteger IsExitAlert;
	BOOL IsTableView1;
    
    MBProgressHUD *HUD;
    NSThread* myThread;
     NSThread* myThread1;
      NSThread* myThreadCheckNet;
    NSString *iddata;
    BOOL ISHttpContent;
    UIButton *btnallupload;
    UIButton *btnalldele;
	NSString *selected;
    UIImageView *imagSaoMiao;
     UIControl *mybguiview;
    
    NSString *txtsaomiao;
    NSString *codeqr;
    
    UIToolbar *btncbx;
     NSString *cbxtxt;
    
    UILabel *lblcodeqr;
   
     CGFloat screenheight;
    
    BOOL isZanCun;
    NSInteger checktype;
    BOOL IsCheckTimeOut;
    NSMutableData *receivedData;
    NSURLConnection * connection;
}
@property (nonatomic,retain) IBOutlet UILabel *lblcodeqr;
@property (nonatomic, retain) NSString *cbxtxt;
@property (nonatomic,retain) IBOutlet UIToolbar *btncbx;

@property (nonatomic,retain) NSString *txtsaomiao;
@property (nonatomic,retain) NSString *codeqr;
@property (nonatomic,retain) IBOutlet UIButton *btnallupload;
@property (nonatomic,retain) IBOutlet UIButton *btnalldele;

@property (retain, nonatomic) IBOutlet UIImageView *imagSaoMiao;
@property (retain, nonatomic) IBOutlet UISegmentedControl *sc1;
@property (retain, nonatomic) IBOutlet UISegmentedControl *sc2;
@property (retain, nonatomic) IBOutlet UISegmentedControl *sc3;
@property (retain, nonatomic) IBOutlet UISegmentedControl *sc4;

@property (retain, nonatomic) IBOutlet UITableView *tableView1;
@property (retain, nonatomic) IBOutlet UITableView *tableView2;
@property (nonatomic,retain) NSArray *tableArray;
@property (nonatomic,retain) NSMutableDictionary *dicrbvalue;
@property (retain, nonatomic) NSArray *rbgroup1;
@property (retain, nonatomic) NSArray *rbgroup2;
@property (retain, nonatomic) NSArray *rbgroup3;
@property (retain, nonatomic) NSArray *rbgroup4;
@property (retain, nonatomic) NSArray *rbgroup5;

@property (retain, nonatomic) NSString *iskeyi;
@property (retain, nonatomic) NSString *sexc;
@property (retain, nonatomic) NSString  *Q2;
@property (retain, nonatomic) NSString  *Q1;
@property (retain,nonatomic) CustomerInfoModel *custmerMode;
@property (retain, nonatomic) IBOutlet UITextField *txtName;
@property (retain, nonatomic) IBOutlet UITextField *txtPhone;
@property (retain, nonatomic) IBOutlet UITextField *txtEmail;
@property (retain, nonatomic) NSDictionary *stateZips;
@property (retain, nonatomic) NSArray *states;
@property (retain, nonatomic) NSArray *zips;
@property (nonatomic,assign) NSInteger pickertype;
@property (nonatomic,retain) IBOutlet UIButton *cbxprovince;
@property (nonatomic,retain) IBOutlet UIButton *cbxcity;
@property (nonatomic,retain) IBOutlet UIButton *cbxcompony;
@property (nonatomic,retain) NSMutableDictionary *dic;
@property (nonatomic,retain) NSArray *pickerData;
@property (nonatomic,retain) IBOutlet UIView *pickerUIView;
@property (nonatomic,retain) IBOutlet UIPickerView *picker;
@property (nonatomic,retain) CustomerBaseInfo *custmerinfo;
@property (nonatomic,retain) UIAlertView *myalertView;
@property (nonatomic,retain) IBOutlet UILabel *lblmsg;
@property (nonatomic,retain) IBOutlet UIView *scrollviewinfo;
-(void)setValue:(NSString *)value;
- (IBAction)switchViews:(id)sender;
-(IBAction)exitapp;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundTap:(id)sender;
-(IBAction)cbxclickProvince;
-(IBAction)cbxclickCity;
-(IBAction)cbxclickCompney;
-(IBAction)testbtn;
-(IBAction)btnalluploadclick:(id)sender;
-(IBAction)btnalldeleclick:(id)sender;
-(IBAction)chkphonenum:(id)sender;
-(IBAction)chkemail:(id)sender;
-(IBAction)cbxfinished:(id)sender;
-(IBAction)btnclickSaoMiao:(id)sender;
@end
