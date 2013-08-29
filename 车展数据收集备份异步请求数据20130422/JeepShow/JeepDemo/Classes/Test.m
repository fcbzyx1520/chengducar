//
//  Test.m
//  JeepDemo
//
//  Created by fu on 12-11-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Test.h"
#import "CustomerBaseInfo.h"
#import "RadioButton.h"
#import "CustomerInfoModel.h"
#import "JeepDemoAppDelegate.h"
#import "Reachability.h"
#import "ZBarSDK.h"
#import "QRCodeGenerator.h"
#import "base64.h"
@implementation Test

@synthesize stateZips;
@synthesize states;
@synthesize zips;
@synthesize pickertype;
@synthesize dic;
@synthesize lblmsg;
@synthesize scrollviewinfo;
@synthesize custmerinfo;
@synthesize myalertView;
@synthesize pickerData;
@synthesize picker;
@synthesize pickerUIView;
@synthesize cbxprovince;
@synthesize cbxcity;
@synthesize cbxcompony;
@synthesize txtName;
@synthesize txtPhone;
@synthesize txtEmail;
@synthesize Q1;
@synthesize Q2;
@synthesize iskeyi;
@synthesize sexc;
@synthesize custmerMode;
@synthesize rbgroup1;
@synthesize rbgroup2;
@synthesize rbgroup3;
@synthesize rbgroup4;
@synthesize rbgroup5;
@synthesize dicrbvalue;
@synthesize tableArray;
@synthesize tableView1;
@synthesize tableView2;
@synthesize sc1;
@synthesize sc2;
@synthesize sc3;
@synthesize sc4;
@synthesize imagSaoMiao;
@synthesize txtsaomiao;
@synthesize codeqr;
@synthesize btncbx;
@synthesize cbxtxt;
@synthesize lblcodeqr;
//saomiao
-(IBAction)btnclickSaoMiao:(id)sender
{
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    [self presentModalViewController: reader
                            animated: YES];

}
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
     NSLog(@"测试测试");
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    imagSaoMiao.image =
    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    [reader dismissModalViewControllerAnimated: YES];
    
  
@try
    {
        txtsaomiao=@"http://weixin.qq.com/r/8bxsY6LEqpzVh7MAn_nV";
       txtsaomiao=  symbol.data ;
        
        NSRange range1 =[txtsaomiao rangeOfString:@"klsl.l.cn"];
        if(range1.location!=NSNotFound)
        {
             NSArray *arraychezhunet=[txtsaomiao componentsSeparatedByString:@"?"];
            NSArray *arraychezhunet1=[[arraychezhunet objectAtIndex:1] componentsSeparatedByString:@"="];
            self.codeqr=[arraychezhunet1 objectAtIndex:1];
            lblcodeqr.text=self.codeqr;
            sc1.selectedSegmentIndex=0;
            [[self view] bringSubviewToFront:view1];
        }
        else
        {
            //不包含
        

   NSLog(@"code:%@",txtsaomiao);
    Byte inputData[[txtsaomiao lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];//prepare a Byte[]
    [[txtsaomiao dataUsingEncoding:NSUTF8StringEncoding] getBytes:inputData];//get the pointer of the data
    size_t inputDataSize = (size_t)[txtsaomiao length];
    size_t outputDataSize = EstimateBas64DecodedDataSize(inputDataSize);//calculate the decoded data size
    Byte outputData[outputDataSize];//prepare a Byte[] for the decoded data
    Base64DecodeData(inputData, inputDataSize, outputData, &outputDataSize);//decode the data
    NSData *theData = [[NSData alloc] initWithBytes:outputData length:outputDataSize];
        NSString *str2 = [[NSString alloc] initWithData:theData encoding:NSUTF8StringEncoding];
    txtsaomiao=str2;
            if([txtsaomiao compare:@""]==NSOrderedSame)
            {
                [self performSelectorOnMainThread:@selector(showAlert:) withObject:@"无法识别!" waitUntilDone:YES];
                
                
            }
            else {

     NSLog(@"code:%@",txtsaomiao);
            NSRange range2 =[txtsaomiao rangeOfString:@","];
            if(range2.location!=NSNotFound)
            {
                //包含
            

    NSArray *arraychezhu=[txtsaomiao componentsSeparatedByString:@","];
    NSString *biaoshi=[arraychezhu objectAtIndex:0];
    if([biaoshi compare:@"shcz"]==NSOrderedSame)
    {
        txtsaomiao=[arraychezhu objectAtIndex:1];
        self.codeqr=[arraychezhu objectAtIndex:2];
        txtPhone.text=txtsaomiao;
        lblcodeqr.text=self.codeqr;
        sc1.selectedSegmentIndex=0;
        
	    [[self view] bringSubviewToFront:view1];
    }
    else {
       
       [self performSelectorOnMainThread:@selector(showAlert:) withObject:@"无法识别!" waitUntilDone:YES];

    }
            }
            else {
                             [self performSelectorOnMainThread:@selector(showAlert:) withObject:@"无法识别!" waitUntilDone:YES];
                

            }
            }
        }
    }@catch(NSException *ex)
    {
         
                [self performSelectorOnMainThread:@selector(showAlert:) withObject:@"无法识别!" waitUntilDone:YES];

    }
}

//全部上传
-(IBAction)btnalluploadclick:(id)sender
{
    if(tableArray.count==0)
    {
        [self showAlert:@"没有数据!"];
        return;
    }
    else {
    IsTableView1=NO;
       HUD=[[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [self.view bringSubviewToFront:HUD];
    HUD.delegate=self;
    HUD.labelText=@"正在上传中";
    [HUD show:YES];
//myThread = [[NSThread alloc] initWithTarget:self selector:@selector(UploadAllData:) object:nil];
   //[myThread start]; 
        [self UploadAllData:nil];
    }

}
-(void)UploadAllData:(id)sender
{
    if(tableArray.count==0)
    {
        [self showAlert:@"没有数据!"];
        return;
    }
    else {
      
    NSMutableArray *array11 = [[NSMutableArray alloc] init];
	JeepDemoAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *context = [appDelegate managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"CustomerInfo"
														 inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
	
	NSError *error;
	NSArray *objects = [context executeFetchRequest:request error:&error];
	if (objects == nil)
	{
		NSLog(@"There was an error!");
		// Do whatever error handling is appropriate
        [self showAlert:@"没有数据!"];
        return;
	}
   
	NSMutableString *resultStr = [[NSMutableString alloc] init];
	[resultStr appendFormat:@"%@",@"["];
	for (NSManagedObject *oneObject in objects)
	{
		
        if(!IsTableView1)
        {
            if([[[oneObject valueForKey:@"iszancun"] stringValue] compare:@"1"]==NSOrderedSame)
            {
                continue;
            }
        }
        else {
            if([[[oneObject valueForKey:@"iszancun"] stringValue] compare:@"0"]==NSOrderedSame)
            {
                continue;
            }
        }
		
		CustomerInfoModel *model=[[CustomerInfoModel alloc] init];
		
		[model setValueforName:[oneObject valueForKey:@"name"]];
		[model setValueforId:[oneObject valueForKey:@"Id"]];
		[model setValueforIsupload:[[oneObject valueForKey:@"isupload"] intValue]];
		[model setValueforProvien:[oneObject valueForKey:@"provine"]];
		[model setValueforChezhu:[oneObject valueForKey:@"chezhu"]];
		
		[model setValueforCartype:[oneObject valueForKey:@"cartype"]];
		[model setValueforIskeyi:[oneObject valueForKey:@"iskeyi"]];
		[model setValueforCity:[oneObject valueForKey:@"city"]];
		[model setValueforSex:[oneObject valueForKey:@"sex"]];
        NSString *tempcbx=@"请选择";
        if([[[oneObject valueForKey:@"Q3"] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame)
        {
            [model setValueforQ3:@""];
        }
        else {
            
            
            [model setValueforQ3:[oneObject valueForKey:@"Q3"]];
        }
		//[model setValueforQ3:[oneObject valueForKey:@"Q3"]];
		[model setValueforEmail:[oneObject valueForKey:@"email"]];
		[model setValueforPhone:[oneObject valueForKey:@"phone"]];
		[model setValueforQ1:[oneObject valueForKey:@"Q1"]];
		[model setValueforQ2:[oneObject valueForKey:@"Q2"]];
		[model setValueforCreateTime:[oneObject valueForKey:@"createtime"]];
		[model setValueforIssms:[oneObject valueForKey:@"issms"]];
        [model setValueforCodeQR:[oneObject valueForKey:@"codeQR"]];
        NSString  *iskeyistring,*issmsstring;
        
        if([[model GetValueforIskeyi]compare:@"0"]==NSOrderedSame)
            {
                iskeyistring=@"1";
            }
            else
            {
                iskeyistring=@"2";
            }
             if([[model GetValueforIskeyi]compare:@"0"]==NSOrderedSame)
             {
                 issmsstring=@"1";
             }
             else {
               issmsstring=@"2";
             }
             NSString *JSONData=[NSString stringWithFormat:@"{\"name\":\"%@\",\"sex\":\"%@\",\"phone\":\"%@\",\"email\":\"%@\",\"province\":\"%@\",\"city\":\"%@\",\"is_havecar\":\"%@\",\"year\":\"%@\",\"brand\":\"%@\",\"models\":\"%@\",\"driven_age\":\"%@\",\"plan_time\":\"%@\",\"plan_budget\":\"%@\",\"interest_car\":\"%@\",\"dealer\":\"%@\",\"is_followup\":\"%@\",\"is_receive\":\"%@\",\"helper_id\":\"%@\",\"duty\":\"%@\",\"qrcode\":\"%@\",\"savetime\":\"%@\"}",[model  GetValueforName],[model GetValueforSex],[model GetValueforPhone],[model GetValueforEmail],[model GetValueforProvien],[model GetValueforCity],@"2",@"",@"",@"",@"",[model GetValueforQ1],@"",[model GetValueforQ2],[model GetValueforQ3],iskeyistring,issmsstring,[model GetValueforChezhu],[model GetValueforCarType],[model GetValueforCodeQR],[model GetValueforCreateTime]];
        
        
		[resultStr appendFormat:@"%@,",JSONData];
		
        
		[model release];
		
		
	}
    [resultStr appendFormat:@"%@]",@"{}"];
    
    [self sendHttp:resultStr];
    }

}
//全部清除
-(IBAction)btnalldeleclick:(id)sender
{
    if(tableArray.count==0)
    {
        [self showAlert:@"没有数据!"];
        return;
    }
    else
    {
    IsExitAlert=3;
    UIAlertView *alert= [[UIAlertView alloc] 
                         initWithTitle:@"提示" 
                         message:@"您确定要全部清楚吗?"
                         delegate:self 
                         cancelButtonTitle:@"否" 
                         otherButtonTitles:@"是",nil];
	alert.tag=4;
	[alert show];
	[alert release];
    IsTableView1=NO;
   }
   
}
-(void)ClearALLData
{
NSMutableArray *array11 = [[NSMutableArray alloc] init];
JeepDemoAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
NSManagedObjectContext *context = [appDelegate managedObjectContext];

NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"CustomerInfo"
                                                     inManagedObjectContext:context];
NSFetchRequest *request = [[NSFetchRequest alloc] init];
[request setEntity:entityDescription];

NSError *error;
NSArray *objects = [context executeFetchRequest:request error:&error];
	if (objects == nil)
	{
		NSLog(@"There was an error!");
		// Do whatever error handling is appropriate
        [self showAlert:@"没有数据!"];
        return;
	}
    if(objects.count==0)
    {
        [self showAlert:@"没有数据!"];
        return;
    }
NSMutableString *resultStr = [[NSMutableString alloc] init];
[resultStr appendFormat:@"%@",@"["];
for (NSManagedObject *oneObject in objects)
{
    
    if(!IsTableView1)
    {
        if([[[oneObject valueForKey:@"iszancun"] stringValue] compare:@"1"]==NSOrderedSame)
        {
            continue;
        }
    }
    else {
        if([[[oneObject valueForKey:@"iszancun"] stringValue] compare:@"0"]==NSOrderedSame)
        {
            continue;
        }
    }
    
    [context deleteObject:oneObject];
        
    
}
    [context save:&error];
    self.tableArray=[[NSArray alloc] initWithArray:array11];
	[array11 release];
    [self.tableView2 reloadData];
    sc3.selectedSegmentIndex=2;
    [[self view] bringSubviewToFront:view3];
[self showAlert:@"已经全部清除!"];

}
-(IBAction)chkphonenum:(id)sender
{
    if([self isMobileNumber:txtPhone.text]==NO)
    {
        UIAlertView *alertNotNet = [[UIAlertView alloc] 
                                    initWithTitle:@"提示" 
                                    message:@"请输入正确的电话号码!"
                                    delegate:self 
                                    cancelButtonTitle:@"确定" 
                                    otherButtonTitles:nil];
        
        [alertNotNet show];
        [alertNotNet release];
        txtPhone.text=nil;
    }
}
-(IBAction)chkemail:(id)sender
{
    if([self isEmail:txtEmail.text]==NO)
    {
        UIAlertView *alertNotNet = [[UIAlertView alloc] 
                                    initWithTitle:@"提示" 
                                    message:@"请输入正确的Email!"
                                    delegate:self 
                                    cancelButtonTitle:@"确定" 
                                    otherButtonTitles:nil];
        
        [alertNotNet show];
        [alertNotNet release];
        txtEmail.text=nil;
    }
}
-(BOOL)isEmail:(NSString *)Email
{
    NSString *emailRegex=@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTe=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTe evaluateWithObject:Email];
}
//判断手机号码
-(BOOL)isMobileNumber:(NSString *)moblieNum
{
 NSString *Moblie=@"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
  //移动
 NSString *CM=@"^1(34[0-8]|(3[5-9]|5[017-9]|8[123478]|4[7])\\d)\\d{7}$";
//联通
NSString *CU=@"^1(3[0-2]|5[256]|8[56]|4[5])\\d{8}$";
  //电信
NSString *CTs=@"^1((33|53|8[09])[0-9]|349)\\d{7}$";
//小灵通
NSString *PHS=@"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
NSPredicate *regextemmobile=[NSPredicate   predicateWithFormat:@"SELF MATCHES %@",Moblie];
NSPredicate *regextemCM=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
NSPredicate *regextemmCU=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
NSPredicate *regextemmCT=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",CTs];

if(([regextemmobile evaluateWithObject:moblieNum]==YES)||
   ([regextemCM evaluateWithObject:moblieNum]==YES)||
   ([regextemmCU evaluateWithObject:moblieNum]==YES)||
   ([regextemmCT evaluateWithObject:moblieNum]==YES))
{
    return YES;
}
else
{
    return NO;
}
}
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
-(IBAction)testbtn
{
    if([self validEmialandphone]==YES)
    {
    UIAlertView *alert= [[UIAlertView alloc] 
                         initWithTitle:@"提示" 
                         message:@"是否要暂存?"
                         delegate:self 
                         cancelButtonTitle:@"否" 
                         otherButtonTitles:@"是",nil];
	alert.tag=1;
	[alert show];
	[alert release];
    }
}
-(void)setValue:(NSString *)value
{
	_value=value;
}
-(IBAction)exitapp
{
	[self SetCutmerModeValue];
	NSString *tempempty=@"";
	NSString *tempcbx=@"请选择";
	if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame&&
	   [[[custmerMode GetValueforCity] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&
	   [[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ1] compare:tempempty]==NSOrderedSame&&
	   [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforEmail] compare:tempempty]==NSOrderedSame&&
	   [[custmerMode GetValueforQ3]  compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame)
	{
        NSMutableArray *array13 = [[NSMutableArray alloc] init];
        self.tableArray=[[NSArray alloc] initWithArray:array13];
        [array13 release];
        
        //if([self.tableArray count]>0)        
		[self.tableView1 reloadData];
    	[self.tableView2 reloadData];
		sc1.selectedSegmentIndex=0;
	    [[self view] bringSubviewToFront:view1];
		[self dismissModalViewControllerAnimated:YES];
	}
	else {
		IsExitAlert=1;
	UIAlertView *alert= [[UIAlertView alloc] 
						  initWithTitle:@"提示" 
						  message:@"是否要暂存?"
						  delegate:self 
						  cancelButtonTitle:@"否" 
						  otherButtonTitles:@"是",nil];
	alert.tag=1;
	[alert show];
	[alert release];
	}
}

- (void)alertView:(UIActionSheet *)alertView
 didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    isZanCun=NO;
    if(IsExitAlert==1||IsExitAlert==2||IsExitAlert==4||IsExitAlert==10)
    {
         if (buttonIndex != [alertView cancelButtonIndex])
         {
            
		     [self submitSave:nil];
                            
	     }
	    else 
         {
             isZanCun=YES;
		[self ClearDataForController];
	     }
    }
    if(isZanCun==YES)
    {
	if(IsExitAlert==1)
    {
        NSMutableArray *array14 = [[NSMutableArray alloc] init];
        self.tableArray=[[NSArray alloc] initWithArray:array14];
        [array14 release];
        
        //if([self.tableArray count]>0)        
		[self.tableView1 reloadData];
    	[self.tableView2 reloadData];
        sc1.selectedSegmentIndex=0;
	    [[self view] bringSubviewToFront:view1];
		[self dismissModalViewControllerAnimated:YES];
    }
	 if(IsExitAlert==2){
         IsTableView1=YES;         
		[self SetTableViewData];
	}
    if(IsExitAlert==4)
    {
        IsTableView1=NO;
        [self SetTableViewData];
    }
    if (IsExitAlert==10) {
        [self SaoQRcode];

    }
    }
    if(IsExitAlert==3)
    {
      if(buttonIndex != [alertView cancelButtonIndex])
      {
          [self ClearALLData];
      }
    }
    
	IsExitAlert=0;

}
- (IBAction)switchViews:(id)sender{
    NSMutableArray *array12 = [[NSMutableArray alloc] init];
    self.tableArray=[[NSArray alloc] initWithArray:array12];
	[array12 release];
    
        //if([self.tableArray count]>0)        
		[self.tableView1 reloadData];
    	[self.tableView2 reloadData];
	if([sender selectedSegmentIndex]==0)
	{
		//[self.view addSubview:view1];
		sc1.selectedSegmentIndex=0;
	    [[self view] bringSubviewToFront:view1];
		//[[self view] bringSubviewToFront:view1];
	}
	else if([sender selectedSegmentIndex]==1)
	{
				IsTableView1=YES;
		
		[self SetCutmerModeValue];
		NSString *tempempty=@"";
		NSString *tempcbx=@"请选择";
		if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame&&[[[custmerMode GetValueforCity]stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&
		   [[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ1] compare:tempempty]==NSOrderedSame&&
		   [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforEmail] compare:tempempty]==NSOrderedSame&&
		   [[custmerMode GetValueforQ3]  compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame)
		{
			[self SetTableViewData];
			
		}
		else {
          
			IsExitAlert=2;
			UIAlertView *alert= [[UIAlertView alloc] 
								 initWithTitle:@"提示" 
								 message:@"是否要暂存?"
								 delegate:self 
								 cancelButtonTitle:@"否" 
								 otherButtonTitles:@"是",nil];
			alert.tag=2;
			[alert show];
			[alert release];
            
		}
		
		
	}
   else  if([sender selectedSegmentIndex]==2)
    {
        IsTableView1=NO;
		[self SetCutmerModeValue];
		NSString *tempempty=@"";
		NSString *tempcbx=@"请选择";
		if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame&&
		   [[[custmerMode GetValueforCity] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ1] compare:tempempty]==NSOrderedSame&&
		   [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforEmail] compare:tempempty]==NSOrderedSame&&
		   [[custmerMode GetValueforQ3] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame)
		{
			
			[self SetTableViewData];
		}
		else {
            
			IsExitAlert=4;
			UIAlertView *alert= [[UIAlertView alloc] 
								 initWithTitle:@"提示" 
								 message:@"是否要暂存?"
								 delegate:self 
								 cancelButtonTitle:@"否" 
								 otherButtonTitles:@"是",nil];
			alert.tag=2;
			[alert show];
			[alert release];
            
           
		}
		

    }
	else {
	
        [self SetCutmerModeValue];
       
		NSString *tempempty=@"";
		NSString *tempcbx=@"请选择";
		if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame&&[[[custmerMode GetValueforCity]stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&
		   [[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ1] compare:tempempty]==NSOrderedSame&&
		   [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforEmail] compare:tempempty]==NSOrderedSame&&
		   [[custmerMode GetValueforQ3]  compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame)
		{
            [self SaoQRcode];
		}
		else {
           
			IsExitAlert=10;
			UIAlertView *alert= [[UIAlertView alloc] 
								 initWithTitle:@"提示" 
								 message:@"是否要暂存?"
								 delegate:self 
								 cancelButtonTitle:@"否" 
								 otherButtonTitles:@"是",nil];
			alert.tag=2;
			[alert show];
			[alert release];
            
             
		}

      	}

	
}
-(void)SaoQRcode
{
    
    [self ClearDataForController];
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    int i = 0;
    if(screenheight!=480)
    {
    for (UIView *temp in [reader.view subviews]) {        
        for (UIView *v in [temp subviews]) {
            if ([v isKindOfClass:[UIToolbar class]]) {
                for (UIView *ev in [v subviews]) {
                    
                    if (i== 3) {
                        [ev removeFromSuperview];
                    }
                    if (i== 2) {
                        for (UIButton *button in [ev subviews]) {
                            
                            button.titleLabel.text=@" 取消";
                        }
                    }
                    i++;
                }
            }
        }
    }
    }
    else {
        for (UIView *temp in [reader.view subviews]) {        
            for (UIView *v in [temp subviews]) {
                if ([v isKindOfClass:[UIToolbar class]]) {
                    for (UIView *ev in [v subviews]) {
                        
                        if (i==2) {
                            [ev removeFromSuperview];
                        }
                        if (i== 1) {
                            for (UIButton *button in [ev subviews]) {
                                
                                button.titleLabel.text=@" 取消";
                            }
                        }
                        i++;
                    }
                }
            }
        }

    }
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    [self presentModalViewController: reader
                            animated: YES];
    sc1.selectedSegmentIndex=0;
    sc2.selectedSegmentIndex=1;
    sc3.selectedSegmentIndex=2;
    //[[self view] bringSubviewToFront:view3];
    

}
-(void)SetTableViewData
{
	NSMutableArray *array11 = [[NSMutableArray alloc] init];
	JeepDemoAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	NSManagedObjectContext *context = [appDelegate managedObjectContext];
	
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"CustomerInfo"
														 inManagedObjectContext:context];
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entityDescription];
   NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:@"createtime"  ascending:NO];
	NSError *error;
   NSArray *sortDescriptors=[NSArray arrayWithObject:sortDescriptor] ;
   [request setSortDescriptors:sortDescriptors];
	NSArray *objects = [context executeFetchRequest:request error:&error];
	if (objects == nil)
	{
		NSLog(@"There was an error!");
		// Do whatever error handling is appropriate
	}
	NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:30];
	
	for (NSManagedObject *oneObject in objects)
	{
		
        if(!IsTableView1)
        {
            if([[[oneObject valueForKey:@"iszancun"] stringValue] compare:@"1"]==NSOrderedSame)
            {
                continue;
            }
        }
        else {
            if([[[oneObject valueForKey:@"iszancun"] stringValue] compare:@"0"]==NSOrderedSame)
            {
                continue;
            }
        }
		
		CustomerInfoModel *model=[[CustomerInfoModel alloc] init];
		
		[model setValueforName:[oneObject valueForKey:@"name"]];
		[model setValueforId:[oneObject valueForKey:@"Id"]];
		[model setValueforIsupload:[[oneObject valueForKey:@"isupload"] intValue]];
		[model setValueforProvien:[oneObject valueForKey:@"provine"]];
		[model setValueforChezhu:[oneObject valueForKey:@"chezhu"]];
		
		[model setValueforCartype:[oneObject valueForKey:@"cartype"]];
		[model setValueforIskeyi:[oneObject valueForKey:@"iskeyi"]];
		[model setValueforCity:[oneObject valueForKey:@"city"]];
		[model setValueforSex:[oneObject valueForKey:@"sex"]];
		[model setValueforQ3:[oneObject valueForKey:@"Q3"]];
		[model setValueforEmail:[oneObject valueForKey:@"email"]];
		[model setValueforPhone:[oneObject valueForKey:@"phone"]];
		[model setValueforQ1:[oneObject valueForKey:@"Q1"]];
		[model setValueforQ2:[oneObject valueForKey:@"Q2"]];
		[model setValueforCreateTime:[oneObject valueForKey:@"createtime"]];
		[model setValueforIssms:[oneObject valueForKey:@"issms"]];
        [model setValueforCodeQR:[oneObject valueForKey:@"codeQR"]];
		NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:30];
		
		
		[resultStr appendFormat:@"车助%@,",[model GetValueforChezhu]];
		
		[resultStr appendFormat:@"%@,",[[model GetValueforName] compare:@""]==NSOrderedSame?@"匿名":[model GetValueforName]];
		//[resultStr appendFormat:@"%@,",[model GetValueforCarType]];
		[resultStr appendFormat:@"%@,",[model GetValueforCreateTime]];
        
        if(IsTableView1)
        {
		[resultStr appendFormat:@"%@",[model GetValueforId]];
		}
		[array11 addObject:resultStr];	
		
		[model release];
		// NSString *fieldName = [NSString stringWithFormat:@"line%@", lineNum];
		// UITextField *theField = [self valueForKey:fieldName];
		// theField.text = lineText;
		
	}
	[request release];
	self.tableArray=[[NSArray alloc] initWithArray:array11];
	[array11 release];
    [sortDescriptor release];
	if(IsTableView1)
	{
        //if([self.tableArray count]>0)        
		[self.tableView1 reloadData];
		//[array11 release];
		sc2.selectedSegmentIndex=1;
		[[self view] bringSubviewToFront:view2];
		
	}
	else
	{
      //  if([self.tableArray count]>0)
		[self.tableView2 reloadData];
		
		
		sc3.selectedSegmentIndex=2;
		[[self view] bringSubviewToFront:view3];
	}
	
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    }

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    
    CGRect rect_screen = [[UIScreen mainScreen]bounds];
    CGSize size_screen = rect_screen.size;
    screenheight=size_screen.height;
      scrollviewinfo.frame=CGRectMake(0,46, 320,screenheight-44-70);
    self.sc1.frame=CGRectMake(-3, screenheight-64, 333,44);
    self.sc2.frame=CGRectMake(-3, screenheight-64, 333,44);

   self.sc3.frame=CGRectMake(-3, screenheight-64, 333,44);
    
 tableView1.frame=CGRectMake(0,46, 320,screenheight-44-70);
 tableView2.frame=CGRectMake(0, 46, 320,screenheight-44-70);
  // view3.frame=CGRectMake(0, 0, 320,screenheight-44);
	//NSArray *array=[[NSArray alloc]initWithObjects:
					//@"大众",@"奔驰",@"宝马",@"保时捷",@"jeep",@"马自达",nil];
	//self.pickerData=array;
	//[array release];
    cbxcity.enabled=NO;
	custmerMode=[[CustomerInfoModel alloc] init];
	CustomerBaseInfo *customerinfo=[[CustomerBaseInfo alloc] initWithNibName:@"CustomerBaseInfo" bundle:nil];
	custmerinfo=customerinfo;
	
	//customerinfo1=CGRectMake(0, 50, 320, 200);
	//[scrollviewinfo insertSubview:customerinfo.view atIndex:0];
	btncbx.frame=CGRectMake(0, screenheight, 320, 44);
	UIScrollView *myscroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, screenheight-30)];
	[myscroll setContentSize:CGSizeMake(320, 1630)];
  
	[scrollviewinfo addSubview:myscroll];
      
	[myscroll addSubview:view4];
	
    self.view.frame=CGRectMake(0,0, 320,screenheight+100);

    btnalldele.frame=CGRectMake(194, screenheight-130,  85, 37);
    btnallupload.frame=CGRectMake(43, screenheight-130,  85, 37);

	//CustomerBaseInfo *customerinfo1=[[CustomerBaseInfo alloc] initWithNibName:@"CustomerBaseInfo" bundle:nil];
	//customerinfo1=CGRectMake(0, 50, 320, 200);
	//[scrollviewinfo insertSubview:customerinfo.view atIndex:0];
	
		[customerinfo release];
	//[scrollviewinfo addSubview:customerinfo1.view ];
	//[customerinfo1 release];
    //[customerinfo1 release];
		lblmsg.text=_value;
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *plistPath = [bundle pathForResource:@"ProvincesAndCities" ofType:@"plist"];
	NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	self.stateZips = dictionary;
	[dictionary release];
	
	NSArray *components = [self.stateZips allKeys];
	NSArray *sorted = [components sortedArrayUsingSelector:@selector(compare:)];
	self.states = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ProvincesAndCities.plist" ofType:nil]];
	
	NSString *selectedState = [self.states objectAtIndex:0];
	NSArray *array = [stateZips objectForKey:selectedState];
	self.zips = array;
	//self.picker.frame = CGRectMake(0, 480, 320, 260);
 self.picker.frame = CGRectMake(0, screenheight, 320, 260);
 // self.pickerUIView.hidden=YES;
    //[self.pickerUIView setHidden:YES];
	[array release];
	
	
			
    [super viewDidLoad];
//[self.view addSubview:view5];
   [self.view addSubview:view3];
   [self.view addSubview:view2];
   [self.view addSubview:view1];
  //  pickerUIView.frame=CGRectMake(0, 480, 320, 260);	
    [self SetView1forPage];
		
}

-(void)SetView1forPage
{
	 dicrbvalue = [[NSMutableDictionary alloc] initWithCapacity:30];
	RadioButton *rb20= [[RadioButton alloc] initWithGroupId:@"Four group" index:0 settitle:@"男"]; 
	RadioButton *rb21 = [[RadioButton alloc] initWithGroupId:@"Four group" index:1 settitle:@"女"]; 
	rb20.tag=0;
    rb21.tag=1;
	rb20.frame = CGRectMake(120,75,44,28);
    rb21.frame = CGRectMake(170,75,44,28);
	
	
	rbgroup4=[[NSArray alloc] initWithObjects:@"男",
			  @"女",nil];
	
	[view4 addSubview:rb20];
	[view4 addSubview:rb21];
	[dicrbvalue setObject:rb20 forKey:@"男"];
	[dicrbvalue setObject:rb21 forKey:@"女"];
    [rb20 release];
	[rb21 release];
	
	
	RadioButton *rb1weekly = [[RadioButton alloc] initWithGroupId:@"first group" index:0 settitle:@"一周内"];
    RadioButton *rb2weekly = [[RadioButton alloc ] initWithGroupId:@"first group" index:1 settitle:@"两周内"];
    RadioButton *rb1month= [[RadioButton alloc] initWithGroupId:@"first group" index:2 settitle:@"一个月内"];
	
	RadioButton *rb3month= [[RadioButton alloc] initWithGroupId:@"first group" index:3 settitle:@"三个月内"];
	RadioButton *rb6month= [[RadioButton alloc] initWithGroupId:@"first group" index:4 settitle:@"半年内"];
	RadioButton *rb1year= [[RadioButton alloc] initWithGroupId:@"first group" index:5 settitle:@"一年内"];
	RadioButton *rb2year= [[RadioButton alloc] initWithGroupId:@"first group" index:6 settitle:@"一年后"];
	RadioButton *rb1no= [[RadioButton alloc] initWithGroupId:@"first group" index:7 settitle:@"暂无购车计划"];
    rb1weekly.frame = CGRectMake(leftd,topsex+21,102,28);
    rb2weekly.frame = CGRectMake(leftd+91,topsex+21,102,28);
    rb1month.frame = CGRectMake(leftd+191,topsex+21,102,28);
	rb3month.frame = CGRectMake(leftd,topsex+35+21,102,28);
	rb6month.frame = CGRectMake(leftd+91,topsex+35+21,102,28);
	rb1year.frame = CGRectMake(leftd+191,topsex+35+21,102,28);
	rb2year.frame = CGRectMake(leftd,topsex+70+21,102,28);
	rb1no.frame = CGRectMake(leftd+91,topsex+70+21,102,28);
	rb1weekly.tag=0;
    rb2weekly.tag=1;
    rb1month.tag=2;
    rb3month.tag=3;
    rb6month.tag=4;
    rb1year.tag=5;
    rb2year.tag=6;
    rb1no.tag=7;
    
    	rbgroup1=[[NSArray alloc] initWithObjects:@"一周内",
			  @"两周内",@"一个月内",@"三个月内",
			  @"半年内",@"一年内",@"一年后",
			  @"暂无购车计划",nil];
 
	
	
	
    [view4 addSubview:rb1weekly];
    [view4 addSubview:rb2weekly];
    [view4 addSubview:rb1month];
	[view4 addSubview:rb3month];
    [view4 addSubview:rb6month];
    [view4 addSubview:rb1year];
	[view4 addSubview:rb2year];
    [view4 addSubview:rb1no];
	[dicrbvalue setObject:rb1weekly forKey:@"一周内"];
	[dicrbvalue setObject:rb2weekly forKey:@"两周内"];
	[dicrbvalue setObject:rb3month forKey:@"一个月内"];
	[dicrbvalue setObject:rb1month forKey:@"三个月内"];
	[dicrbvalue setObject:rb6month forKey:@"半年内"];
	[dicrbvalue setObject:rb1year forKey:@"一年内"];
	[dicrbvalue setObject:rb2year forKey:@"一年后"];
	[dicrbvalue setObject:rb1no forKey:@"暂无购车计划"];

    [rb1weekly release];
    [rb2weekly release];
    [rb1month release];
    [rb3month release];
    [rb6month release];
    [rb1year release];
    [rb2year release];
    [rb1no release];
	
    
    	
	//RadioButton *rb1 = [[RadioButton alloc] initWithGroupId:@"second group" index:0 settitle:@"2014大切诺基SRT8"]; 
	//RadioButton *rb2 = [[RadioButton alloc] initWithGroupId:@"second group" index:1 settitle:@"2013大切诺基3.6L"]; 
	RadioButton *rb1 = [[RadioButton alloc] initWithGroupId:@"second group" index:0 settitle:@"2014大切诺基3.0L"]; 
	RadioButton *rb2 = [[RadioButton alloc] initWithGroupId:@"second group" index:1 settitle:@"2014大切诺基3.6L"]; 
     RadioButton *rb30 = [[RadioButton alloc] initWithGroupId:@"second group" index:2 settitle:@"2014大切诺基5.7L"];
    RadioButton *rb37 = [[RadioButton alloc] initWithGroupId:@"second group" index:3 settitle:@"2014大切诺基SRT8"];
	rb1.frame = CGRectMake(leftd,topsex+196,244,28);
    rb2.frame = CGRectMake(leftd,topsex+226,284,28);
  //  rb3.frame = CGRectMake(leftd,topd+256,244,28);
//	rb4.frame = CGRectMake(leftd,topd+286,244,28);
	rb30.frame = CGRectMake(leftd,topsex+256,244,28);
    
	rb37.frame = CGRectMake(leftd,topsex+286,244,28);
	UILabel *questionText2 = [[UILabel alloc] initWithFrame:CGRectMake(leftd,topsex+316,300,20)];
    questionText2.backgroundColor = [UIColor clearColor];
    [questionText2 setAdjustsFontSizeToFitWidth:YES];
    questionText2.text = @"Compass";
	[questionText2 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [view4  addSubview:questionText2];
	
	//RadioButton *rb5 = [[RadioButton alloc] initWithGroupId:@"second group" index:6 settitle:@"2014指南者2.0L"]; 
	//RadioButton *rb6 = [[RadioButton alloc] initWithGroupId:@"second group" index:7 settitle:@"2013指南者2.0L"]; 
	RadioButton *rb5 = [[RadioButton alloc] initWithGroupId:@"second group" index:4 settitle:@"2014指南者2.0L"];
    RadioButton *rb31= [[RadioButton alloc] initWithGroupId:@"second group" index:5 settitle:@"2014指南者2.4L"];
    RadioButton *rb32 = [[RadioButton alloc] initWithGroupId:@"second group" index:6 settitle:@"2014指南者2.4L蛇行珍藏版"];
	rb5.frame = CGRectMake(leftd,topsex+346,244,28);
  //  rb6.frame = CGRectMake(leftd,topd+436,244,28);
   // rb7.frame = CGRectMake(leftd,topd+466,244,28);
    rb31.frame = CGRectMake(leftd,topsex+376,244,28);
    rb32.frame = CGRectMake(leftd,topsex+406,244,28);

	
	
	
	UILabel *questionText3= [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+556,300,20)];
    questionText3.backgroundColor = [UIColor clearColor];
    [questionText3 setAdjustsFontSizeToFitWidth:YES];
    questionText3.text = @"Wrangler";
	[questionText3 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [view4  addSubview:questionText3];
	
	RadioButton *rb8 = [[RadioButton alloc] initWithGroupId:@"second group" index:7 settitle:@"牧马人Sahara两门款"]; 
	RadioButton *rb9 = [[RadioButton alloc] initWithGroupId:@"second group" index:8 settitle:@"牧马人Sahara四门款"]; 
	RadioButton *rb10 = [[RadioButton alloc] initWithGroupId:@"second group" index:9 settitle:@"牧马人Rubicon两门款"]; 
	RadioButton *rb11 = [[RadioButton alloc] initWithGroupId:@"second group" index:10 settitle:@"牧马人Rubicon四门款"]; 
	RadioButton *rb12 = [[RadioButton alloc] initWithGroupId:@"second group" index:11 settitle:@"牧马人Rubicon十周年纪念款"]; 
	//RadioButton *rb13 = [[RadioButton alloc] initWithGroupId:@"second group" index:12 settitle:@"2012牧马人梦十珍藏版"]; 
	rb8.frame = CGRectMake(leftd,topd+586,244,28);
    rb9.frame = CGRectMake(leftd,topd+616,244,28);
    rb10.frame = CGRectMake(leftd,topd+646,244,28);
	rb11.frame = CGRectMake(leftd,topd+676,244,28);
	rb12.frame = CGRectMake(leftd,topd+706,244,28);
   // rb13.frame = CGRectMake(leftd,topd+657,244,28);
	
	
   	UILabel *questionText4 = [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+736,300,20)];
    questionText4.backgroundColor = [UIColor clearColor];
    [questionText4 setAdjustsFontSizeToFitWidth:YES];
    questionText4.text =@"Patriot";
	
	[questionText4 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [view4  addSubview:questionText4];	
	RadioButton *rb14= [[RadioButton alloc] initWithGroupId:@"second group" index:12 settitle:@"2014自由客2.0L"]; 
	RadioButton *rb15 = [[RadioButton alloc] initWithGroupId:@"second group" index:13 settitle:@"2014自由客2.4L"]; 
	RadioButton *rb16 = [[RadioButton alloc] initWithGroupId:@"second group" index:14 settitle:@"2014自由客2.4L蛇行珍藏版"]; 
	
	rb14.frame = CGRectMake(leftd,topd+766,244,28);
    rb15.frame = CGRectMake(leftd,topd+796,244,28);
    rb16.frame = CGRectMake(leftd,topd+826,244,28);
	
	
    UILabel *questionText30 = [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+856,300,20)];
    questionText30.backgroundColor = [UIColor clearColor];
    [questionText30 setAdjustsFontSizeToFitWidth:YES];
    questionText30.text =@"D-SUV";
	
	[questionText30 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [view4  addSubview:questionText30];	
    RadioButton *rb17 = [[RadioButton alloc] initWithGroupId:@"second group" index:15 settitle:@"2014自由光"]; 
    rb17.frame = CGRectMake(leftd,topd+886,244,28);
    
    
    UILabel *questionText31 = [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+926,300,20)];
    questionText31.backgroundColor = [UIColor clearColor];
    [questionText31 setAdjustsFontSizeToFitWidth:YES];
    questionText31.text =@"Chrysler";
	
	[questionText31 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [view4  addSubview:questionText31];	
    RadioButton *rb33 = [[RadioButton alloc] initWithGroupId:@"second group" index:16 settitle:@"300C"]; 
    rb33.frame = CGRectMake(leftd,topd+956,244,28);
    RadioButton *rb34= [[RadioButton alloc] initWithGroupId:@"second group" index:17 settitle:@"300S"]; 
    rb34.frame = CGRectMake(leftd,topd+986,244,28);
    RadioButton *rb35 = [[RadioButton alloc] initWithGroupId:@"second group" index:18 settitle:@"大捷龙"]; 
    rb35.frame = CGRectMake(leftd,topd+1016,244,28);
    
    UILabel *questionText32 = [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+1046,300,20)];
    questionText32.backgroundColor = [UIColor clearColor];
    [questionText32 setAdjustsFontSizeToFitWidth:YES];
    questionText32.text =@"Dodge";
	
	[questionText32 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16]];
    [view4  addSubview:questionText32];	
    RadioButton *rb36= [[RadioButton alloc] initWithGroupId:@"second group" index:19 settitle:@"酷威"]; 
    rb36.frame = CGRectMake(leftd,topd+1076,244,28); 		
    
    
	rbgroup2=[[NSArray alloc] initWithObjects:
			  @"2014大切诺基3.0L",@"2014大切诺基3.6L",@"2014大切诺基5.7L",@"2014大切诺基SRT8",
			  @"2014指南者2.0L",@"2014指南者2.4L",@"2014指南者2.4L蛇行珍藏版",
			  @"牧马人Sahara两门款",@"牧马人Sahara四门款",@"牧马人Rubicon两门款",
			  @"牧马人Rubicon四门款",@"牧马人Rubicon十周年纪念款",
			  @"2014自由客2.0L",@"2014自由客2.4L",@"2014自由客2.4L蛇行珍藏版",@"2014自由光",
			 @"300C",@"300S", @"大捷龙",@"酷威",nil];
    
    rb1.tag=0;
    rb2.tag=1;
   // rb3.tag=2;
   // rb4.tag=3;
    rb30.tag=2;
    rb37.tag=3;
    rb5.tag=4;
    //rb6.tag=7;
   // rb7.tag=8;
    rb31.tag=5;
    rb32.tag=6;
    rb8.tag=7;
    rb9.tag=8;
    rb10.tag=9;
    rb11.tag=10;
    rb12.tag=11;
   // rb13.tag=12;
    rb14.tag=12;
    rb15.tag=13;
    rb16.tag=14;
    rb17.tag=15;
    
    
   
    rb33.tag=16;
    rb34.tag=17;
    rb35.tag=18;
    rb36.tag=19;

    [view4 addSubview:rb1];
    [view4 addSubview:rb2];
  //  [view4 addSubview:rb3];
	//[view4 addSubview:rb4];
    [view4 addSubview:rb5];
    //[view4 addSubview:rb6];
	//[view4 addSubview:rb7];
    [view4 addSubview:rb8];
	[view4 addSubview:rb9];
    [view4 addSubview:rb10];
    [view4 addSubview:rb11];
	[view4 addSubview:rb12];
    //[view4 addSubview:rb13];
    [view4 addSubview:rb14];
	[view4 addSubview:rb15];
    [view4 addSubview:rb16];
	[view4 addSubview:rb17];
    
    [view4 addSubview:rb30];
     [view4 addSubview:rb37];
    [view4 addSubview:rb31];
    [view4 addSubview:rb32];
    [view4 addSubview:rb33];
    [view4 addSubview:rb34];
    [view4 addSubview:rb35];
    [view4 addSubview:rb36];
	[dicrbvalue setObject:rb1 forKey:@"2014大切诺基3.0L"];
	[dicrbvalue setObject:rb2 forKey:@"2014大切诺基3.6L"];
    [dicrbvalue setObject:rb30 forKey:@"2014大切诺基5.7L"];
    [dicrbvalue setObject:rb37 forKey:@"2014大切诺基SRT8"];
	//[dicrbvalue setObject:rb3 forKey:@"2013大切诺基5.7L"];
	//[dicrbvalue setObject:rb4 forKey:@"2014大切诺基3.6L"];
	[dicrbvalue setObject:rb5 forKey:@"2014指南者2.0L"];
    [dicrbvalue setObject:rb31 forKey:@"2014指南者2.4L"];
    [dicrbvalue setObject:rb32 forKey:@"2014指南者2.4L蛇行珍藏版"];
	//[dicrbvalue setObject:rb6 forKey:@"2013指南者2.0L"];
	//[dicrbvalue setObject:rb7 forKey:@"2014 指南者2.4L"];
	[dicrbvalue setObject:rb8 forKey:@"牧马人Sahara两门款"];
	[dicrbvalue setObject:rb9 forKey:@"牧马人Sahara四门款"];
	[dicrbvalue setObject:rb10 forKey:@"牧马人Rubicon两门款"];
	[dicrbvalue setObject:rb11 forKey:@"牧马人Rubicon四门款"];
	[dicrbvalue setObject:rb12 forKey:@"牧马人Rubicon十周年纪念款"];
	//[dicrbvalue setObject:rb13 forKey:@"2012牧马人梦十珍藏版"];
	[dicrbvalue setObject:rb14 forKey:@"2014自由客2.0L"];
	[dicrbvalue setObject:rb15 forKey:@"2014自由客2.4L"];
	[dicrbvalue setObject:rb16 forKey:@"2014自由客2.4L蛇行珍藏版"];
	[dicrbvalue setObject:rb17 forKey:@"2014自由光"];
    
    	
    	[dicrbvalue setObject:rb33 forKey:@"300C"];
    	[dicrbvalue setObject:rb34 forKey:@"300S"];
    	[dicrbvalue setObject:rb35 forKey:@"大捷龙"];
    	[dicrbvalue setObject:rb36 forKey:@"酷威"];
    [rb1 release];
    [rb2 release];
   // [rb3 release];
   // [rb4 release];
    [rb5 release];
   // [rb6 release];
   // [rb7 release];
    [rb8 release];
	[rb9 release];
    [rb11 release];
    [rb12 release];
    //[rb13 release];
    [rb14 release];
    [rb15 release];
    [rb16 release];
    [rb17 release];
    [rb10 release];
    
	[rb30 release];
    [rb37 release];
    [rb31 release];
    [rb32 release];

    [rb33 release];

    [rb34 release];
    [rb35 release];
    [rb36 release];

	UILabel *questionText5 = [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+1126,300,20)];
    questionText5.backgroundColor = [UIColor clearColor];
    [questionText5 setAdjustsFontSizeToFitWidth:YES];
    questionText5.text =@"驻场经销商";
	
	[questionText5 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [view4  addSubview:questionText5];	
	UIButton *submitSaveBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    submitSaveBtn1.frame = CGRectMake(135,1107, 150,37);
    submitSaveBtn1.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
    [submitSaveBtn1 setTitle:@"                请选择              " forState:UIControlStateNormal];
    submitSaveBtn1.titleLabel.textColor = [UIColor whiteColor];
	[submitSaveBtn1 setBackgroundImage:[UIImage imageNamed:@"channeldbdetail_spinner_normal.png"] 
							  forState:UIControlStateNormal];
    [submitSaveBtn1 addTarget:self action:@selector(cbxclickCompney:) forControlEvents:UIControlEventTouchUpInside];
    //cbxcompony=submitSaveBtn1;
	//[view4 addSubview:cbxcompony];
	//[submitSaveBtn1 release];
	
	UILabel *questionText6= [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+1166,300,20)];
    questionText6.backgroundColor = [UIColor clearColor];
    [questionText6 setAdjustsFontSizeToFitWidth:YES];
    questionText6.text =@"是否愿意销售跟进?";
	
	[questionText6 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [view4  addSubview:questionText6];
		
	RadioButton *rb18= [[RadioButton alloc] initWithGroupId:@"threed group" index:0 settitle:@"是"]; 
	RadioButton *rb19 = [[RadioButton alloc] initWithGroupId:@"threed group" index:1 settitle:@"否"]; 
	[rb18 setChecked:YES];
   
    rb18.tag=0;
    rb19.tag=1;
	rb18.frame = CGRectMake(leftd,topd+1196,44,28);
    rb19.frame = CGRectMake(leftd+71,topd+1196,44,28);
	rbgroup3=[[NSArray alloc] initWithObjects:@"是",@"否",nil];	
	
	
		[view4 addSubview:rb18];
	[view4 addSubview:rb19];
	[dicrbvalue setObject:rb18 forKey:@"是"];
	[dicrbvalue setObject:rb19 forKey:@"否"];
	
    [rb18 release];
    [rb19 release];
    UILabel *questionText7= [[UILabel alloc] initWithFrame:CGRectMake(leftd,topd+1236,300,20)];
    questionText7.backgroundColor = [UIColor clearColor];
    [questionText7 setAdjustsFontSizeToFitWidth:YES];
    questionText7.text =@"是否愿意接收信息?";
	
	[questionText7 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [view4  addSubview:questionText7];	
    RadioButton *rb22= [[RadioButton alloc] initWithGroupId:@"Five group" index:0 settitle:@"是"]; 
	RadioButton *rb23 = [[RadioButton alloc] initWithGroupId:@"Five group" index:1 settitle:@"否"]; 
	[rb22 setChecked:YES];
   
    rb22.tag=0;
    rb23.tag=1;
    
	rb22.frame = CGRectMake(leftd,topd+1266,44,28);
    rb23.frame = CGRectMake(leftd+71,topd+1266,44,28);
	rbgroup5=[[NSArray alloc] initWithObjects:@"是",@"否",nil];	
	
	
    [view4 addSubview:rb22];
	[view4 addSubview:rb23];
	[dicrbvalue setObject:rb22 forKey:@"0"];
	[dicrbvalue setObject:rb23 forKey:@"1"];
	
    [rb22 release];
    [rb23 release];

    
    
    
    [RadioButton addObserverForGroupId:@"first group" observer:self];
	[RadioButton addObserverForGroupId:@"second group" observer:self];
	[RadioButton addObserverForGroupId:@"threed group" observer:self];
	[RadioButton addObserverForGroupId:@"Four group" observer:self];
	[RadioButton addObserverForGroupId:@"Five group" observer:self];
	UIButton *submitSaveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitSaveBtn setImage:[UIImage imageNamed:@"but_1.png"] forState:UIControlStateNormal];
    submitSaveBtn.frame = CGRectMake(40, topd+1306, 100, 40);
    [submitSaveBtn setTitle:@"暂存" forState:UIControlStateNormal];
    [submitSaveBtn addTarget:self action:@selector(submitSave:) forControlEvents:UIControlEventTouchUpInside];
    [view4 addSubview:submitSaveBtn];
	//[submitSaveBtn release];
	UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setImage:[UIImage imageNamed:@"but_2.png"] forState:UIControlStateNormal];
    submitBtn.frame = CGRectMake(180, topd+1306, 100, 40);
    [submitBtn setTitle:@"上传" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [view4 addSubview:submitBtn];
	//[submitBtn release];
    
    
     mybguiview = [[UIControl alloc] init];
     mybguiview.frame = CGRectMake(0, 0, 320,1380);
    //[submitBtn setTitle:@"上传" forState:UIControlStateNormal];
   [mybguiview addTarget:self action:@selector(pickerBGclick:) forControlEvents:UIControlEventTouchDown];
   // mybguiview.userInteractionEnabled=YES;
    
   [view4 addSubview:mybguiview];
    mybguiview.hidden=YES;
	 dic = [[NSMutableDictionary alloc] initWithCapacity:30];
	
     [dic setObject:[NSString stringWithFormat:@"%d",0] forKey:@"Five group"];
	 [dic setObject:[NSString stringWithFormat:@"%d",0] forKey:@"threed group"];
	
}
-(IBAction)pickerBGclick:(id)sender
{
    mybguiview.hidden=YES;
	self.picker.frame = CGRectMake(0, screenheight, 320, 260);
    self.btncbx.frame= CGRectMake(0, screenheight, 320, 44);
    self.btncbx.hidden=YES;
	self.picker.hidden=YES;
    if (self.pickertype==1) {
	 	cbxprovince.titleLabel.text=selected;
		//NSString *selectedState = [self.states objectAtIndex:row];
        //	NSArray *array = [stateZips objectForKey:selectedState];
				cbxcity.titleLabel.text=[[self.zips objectAtIndex:0] objectForKey:@"city"];
		//[array release];
	}
	else if(self.pickertype==2)
	{
		cbxcity.titleLabel.text=cbxtxt;
	}
	else
	{
		//cbxcompony.titleLabel.text=selected;
        cbxcompony.titleLabel.text=[[NSString alloc] initWithFormat:@"  %@  ",selected];
	}
	//[txtName resignFirstResponder];
	//[txtPhone resignFirstResponder];
	//[txtEmail resignFirstResponder];
   }
//单选按钮文本单机事件
-(IBAction)RadioBtnlblClick:(id)sender
{
     UIButton *tempbtn=(UIButton *)sender;
   // NSString *commd=(NSString *)[groupId userInfo];
   // NSArray *arraychezhu=[commd componentsSeparatedByString:@","];
   //[dic setObject:[NSString stringWithFormat:@"%d",
   // [arraychezhu  objectAtIndex:0]] forKey:[arraychezhu objectAtIndex:1]];
    RadioButton *rba =[dicrbvalue objectForKey:tempbtn.titleLabel.text];
    [rba setChecked:YES];
    
    
}
-(void)SetCutmerModeValue
{
	for (NSString *str in [self.dic allKeys]) {
		
		NSString *tempstr=nil;
		int atemp=[[dic objectForKey:str] intValue];
		if([str compare:@"first group"]==NSOrderedSame)
		{
			
			tempstr= [NSString stringWithFormat:@"%d", (atemp+1)];//[rbgroup1 objectAtIndex:atemp];
			[custmerMode setValueforQ1:tempstr];
			
		}
		else if([str compare:@"second group"]==NSOrderedSame)
		{
			tempstr=[rbgroup2 objectAtIndex:atemp];
			[custmerMode setValueforQ2:tempstr];
		}
		else if([str compare:@"threed group"]==NSOrderedSame)
		{
			tempstr=[NSString stringWithFormat:@"%d", (atemp+1)];[rbgroup3 objectAtIndex:atemp];
			[custmerMode setValueforIskeyi:tempstr];
		}
        else if([str compare:@"Four group"]==NSOrderedSame)
		{
			tempstr=[NSString stringWithFormat:@"%d", (atemp+1)];//[rbgroup4 objectAtIndex:atemp];
			[custmerMode setValueforSex:tempstr];
		}
		else
		{
			tempstr=[NSString stringWithFormat:@"%d", (atemp+1)];//[rbgroup5 objectAtIndex:atemp];
			[custmerMode setValueforIssms:tempstr];
		}
    }
   	[custmerMode setValueforCodeQR:self.codeqr];
	[custmerMode setValueforName:txtName.text];
	[custmerMode setValueforEmail:txtEmail.text];
	[custmerMode setValueforPhone:txtPhone.text];
	[custmerMode setValueforProvien:cbxprovince.titleLabel.text];
	[custmerMode setValueforCity:cbxcity.titleLabel.text];
    NSString *tempcbx=@"请选择";
    if([[cbxcompony.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame)
    {
        [custmerMode setValueforQ3:@""];
    }
    else {
        
        
        [custmerMode setValueforQ3:cbxcompony.titleLabel.text];
    }

	//[custmerMode setValueforQ3:cbxcompony.titleLabel.text];
	[custmerMode setValueforId:iddata];
    NSDate *date=[NSDate date];
	NSTimeInterval sec=[date timeIntervalSinceNow];
	NSDate *currentDate=[[NSDate alloc]initWithTimeIntervalSinceNow:sec];
	NSDateFormatter *df=[[NSDateFormatter alloc] init];
	[df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
	NSString *na=[df stringFromDate:currentDate];
    [custmerMode setValueforCreateTime:na];
	
}
-(void)submitClick:(id)sender
{
Reachability *rb=[Reachability reachabilityWithHostName:@"www.apple.com"];
    if([rb connectedToNetwork])
    {
        [self Uploadinfo];
    }
    else {
        [self showAlert:@"没有网络!"];
        Isupload=YES;
        [self SetCutmerModeValue];
        NSString *tempempty=@"";
        NSString *tempcbx=@"请选择";
        if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame||
           [[[custmerMode GetValueforCity] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame||
           [[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame||
           [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame||
           [[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame||![[self.dic allKeys] containsObject:@"first group"]||[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame||[[[custmerMode GetValueforQ3] stringByReplacingOccurrencesOfString:@" " withString:@""]compare:tempempty]==NSOrderedSame||[[[custmerMode GetValueforQ3] stringByReplacingOccurrencesOfString:@" " withString:@""]compare:tempcbx]==NSOrderedSame)
        {
            UIAlertView *alert = [[UIAlertView alloc] 
                                  initWithTitle:@"提示" 
                                  message:@"请填写必填项!"
                                  delegate:self 
                                  cancelButtonTitle:@"确定" 
                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            //NSLog(@"dic=%@",self.dic);
            
            
        }
        else {
            [self Saveinfo];
            [self showAlert:@"已保存到数据管理"];
        }

    }
    /*
    HUD=[[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [self.view bringSubviewToFront:HUD];
    HUD.delegate=self;
    HUD.labelText=@"正在检查网络";
    [HUD show:YES];
    myThreadCheckNet = [[NSThread alloc] initWithTarget:self selector:@selector(CheckNetLoading:) object:nil];
    [myThreadCheckNet start];
  */
//NetworkStatus
   
    }
-(void)CheckNetLoading:(NSString *)msg
{
    IsCheckTimeOut=YES;
    [self performSelectorOnMainThread:@selector(MytimeForThreadCheckNet:) withObject:@"fdfd"   waitUntilDone:YES];
    Reachability *rb=[Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([rb currentReachabilityStatus]) {
        case NotReachable:
            IsCheckTimeOut=NO;
            checktype=0;
                        break;
        case ReachableViaWWAN:
            //3G/2G
            IsCheckTimeOut=NO;
           checktype=1;
           
            break;
        case ReachableViaWiFi:
            //wifi
          checktype=2;
            IsCheckTimeOut=NO;
            break;
    }
    
    [myThreadCheckNet autorelease];
   [self performSelectorOnMainThread:@selector(CheckNetLoadingForUI:) withObject:@"存到" waitUntilDone:YES];
}
-(void)CheckNetLoadingForUI:(NSString *)msg
{ 
    switch(checktype)
    {
 case 0:
    
    [HUD removeFromSuperview];
    [HUD release];
    //无网络
    // [alertNotNet show];
    [self showAlert:@"没有网络!"];
    Isupload=YES;
    [self SetCutmerModeValue];
    NSString *tempempty=@"";
    NSString *tempcbx=@"请选择";
    if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame||
       [[[custmerMode GetValueforCity] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame||
       [[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame||
       [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame||
       [[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame||![[self.dic allKeys] containsObject:@"first group"])
    {
        UIAlertView *alert = [[UIAlertView alloc] 
                              initWithTitle:@"提示" 
                              message:@"请填写必填项!"
                              delegate:self 
                              cancelButtonTitle:@"确定" 
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        //NSLog(@"dic=%@",self.dic);
        
        
    }
    else {
        [self Saveinfo];
        [self showAlert:@"已保存到数据管理"];
    }
    break;
case 1:
    //3G/2G
    
    [HUD removeFromSuperview];
    [HUD release];
    [self Uploadinfo];
    break;
case 2:
    //wifi
   
    [HUD removeFromSuperview];
    [HUD release];
    [self Uploadinfo];
    break;
  }
}
-(void)MytimeForThreadCheckNet:(NSString *)msg
{
    [NSTimer scheduledTimerWithTimeInterval:10.0f
									 target:self
								   selector:@selector(timerHttpMethodForCheckNet:)
                                   userInfo:NULL
									repeats:NO];
	
    
}
//自动消失框
- (void)timerHttpMethodForCheckNet:(NSTimer*)theTimer
{
    if(ISHttpContent==NO)
    {
          [myThreadCheckNet autorelease];
        checktype=0;
        [self performSelectorOnMainThread:@selector(CheckNetLoadingForUI:) withObject:@"网络超时\n数据已保存到数据管理" waitUntilDone:YES];
        
    }
}

-(void)Uploadinfo
{

     Isupload=YES;
     [self SetCutmerModeValue];
     NSString *tempempty=@"";
     NSString *tempcbx=@"请选择";
     if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame||
     [[[custmerMode GetValueforCity] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame||
     [[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame||
     [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame||
     [[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame||![[self.dic allKeys] containsObject:@"first group"]||[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame||[[[custmerMode GetValueforQ3] stringByReplacingOccurrencesOfString:@" " withString:@""]compare:tempempty]==NSOrderedSame||[[[custmerMode GetValueforQ3] stringByReplacingOccurrencesOfString:@" " withString:@""]compare:tempcbx]==NSOrderedSame)
     {
     UIAlertView *alert = [[UIAlertView alloc] 
     initWithTitle:@"提示" 
     message:@"请填写必填项!"
     delegate:self 
     cancelButtonTitle:@"确定" 
     otherButtonTitles:nil];
     [alert show];
     [alert release];
     //NSLog(@"dic=%@",self.dic);
     
     
     }
     else {
         if([self validEmialandphone]==YES)
         {
     HUD=[[MBProgressHUD alloc] initWithView:self.view];
     [self.view addSubview:HUD];
     [self.view bringSubviewToFront:HUD];
     HUD.delegate=self;
     HUD.labelText=@"正在上传中";
     [HUD show:YES];
          // myThread = [[NSThread alloc] initWithTarget:self selector:@selector(UploadNewData:) object:nil];
           //  [myThread start];
             [self UploadNewData:nil];
               [self Saveinfo];
         }
     }
}
-(void)UploadNewData:(id)sender
{
   
    NSArray *arraychezhu=[_value componentsSeparatedByString:@","];
    NSString *JSONData=[NSString stringWithFormat:@"[{\"name\":\"%@\",\"sex\":\"%@\",\"phone\":\"%@\",\"email\":\"%@\",\"province\":\"%@\",\"city\":\"%@\",\"is_havecar\":\"%@\",\"year\":\"%@\",\"brand\":\"%@\",\"models\":\"%@\",\"driven_age\":\"%@\",\"plan_time\":\"%@\",\"plan_budget\":\"%@\",\"interest_car\":\"%@\",\"dealer\":\"%@\",\"is_followup\":\"%@\",\"is_receive\":\"%@\",\"helper_id\":\"%@\",\"duty\":\"%@\",\"qrcode\":\"%@\",\"savetime\":\"%@\"}]",[custmerMode  GetValueforName],[custmerMode GetValueforSex],[custmerMode GetValueforPhone],[custmerMode GetValueforEmail],[custmerMode GetValueforProvien],[custmerMode GetValueforCity],@"2",@"",@"",@"",@"",[custmerMode GetValueforQ1],@"",[custmerMode GetValueforQ2],[custmerMode GetValueforQ3],[custmerMode GetValueforIskeyi],[custmerMode GetValueforIssms],[arraychezhu objectAtIndex:0],[arraychezhu objectAtIndex:1],[custmerMode GetValueforCodeQR],[custmerMode GetValueforCreateTime]];
    
    [self sendHttp:JSONData];

}
-(void)submitSave:(id)sender
{
	  // UILabel *resultLbl =[[UILabel alloc] initWithFrame:CGRectMake(40, 340, 240, 30)];
  //resultLbl.backgroundColor = [UIColor whiteColor];
  // resultLbl.textColor = [UIColor redColor];
  // NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:30];
	[self SetCutmerModeValue];
		    Isupload=NO;
 	NSString *tempempty=@"";
	NSString *tempcbx=@"请选择";
	if([[custmerMode GetValueforName] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ2] compare:tempempty]==NSOrderedSame&&
	   [[[custmerMode GetValueforCity] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforPhone] compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforQ1] compare:tempempty]==NSOrderedSame&&
	   [[[custmerMode GetValueforProvien] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame&&[[custmerMode GetValueforEmail] compare:tempempty]==NSOrderedSame&&
	   [[custmerMode GetValueforQ3]  compare:tempempty]==NSOrderedSame&&[[custmerMode GetValueforSex] compare:tempempty]==NSOrderedSame)
	{
		UIAlertView *alert = [[UIAlertView alloc] 
							  initWithTitle:@"提示" 
							  message:@"没有输入任何信息"
							  delegate:self 
							  cancelButtonTitle:@"确定" 
							  otherButtonTitles:nil];
		[alert show];
		[alert release];
		//NSLog(@"dic=%@",self.dic);
		
		
	}
	else {
        if([self validEmialandphone]==YES)
        {
		 [self Saveinfo];
            isZanCun=YES;

        }
        else {
            sc1.selectedSegmentIndex=0;
        }
        //IsTableView1=YES;

        //[self SetTableViewData];
	}
		
	
}
-(void)ClearDataForController
{
	txtName.text=nil;
	txtEmail.text=nil;
	txtPhone.text=nil;
	cbxcity.titleLabel.text=@"请选择";
	cbxprovince.titleLabel.text=@"请选择";
	cbxcompony.titleLabel.text=@"                请选择     ";
		codeqr=@"";
    txtsaomiao=@"";
    lblcodeqr.text=@"克莱斯勒";
	for (NSString *rba in [dicrbvalue allKeys])
	{
        if([rba compare:@"是"]!=NSOrderedSame||[rba compare:@"否"]!=NSOrderedSame)
        {
		[[dicrbvalue objectForKey:rba] setChecked:NO];
        }
	}
    
    /*
	
			[custmerMode setValueforQ1:@" "];
			
				[custmerMode setValueforQ2:@" "];
		
		
			[custmerMode setValueforSex:@" "];
    [custmerMode setValueforIskeyi:@" "];
		
	[custmerMode setValueforName:txtName.text];
	[custmerMode setValueforEmail:txtEmail.text];
	[custmerMode setValueforPhone:txtPhone.text];
	[custmerMode setValueforProvien:cbxprovince.titleLabel.text];
	[custmerMode setValueforCity:cbxcity.titleLabel.text];
	[custmerMode setValueforQ3:cbxcompony.titleLabel.text];
*/
     custmerMode=nil;
    custmerMode=[[CustomerInfoModel alloc] init];
    [custmerMode setValueforId:@""];
    iddata=@"";
    [dic removeAllObjects];   
    
    [dic setObject:[NSString stringWithFormat:@"%d",0] forKey:@"Five group"];
    [dic setObject:[NSString stringWithFormat:@"%d",0] forKey:@"threed group"];
    [[dicrbvalue objectForKey:@"0"] setChecked:YES];
    [[dicrbvalue objectForKey:@"是"] setChecked:YES];
}
//http请求
- (IBAction)sendHttp:(NSString *)JSONData
{
	//此处进行GET方式 发送http请求
	//如有中文要进行NSUTF8StringEncoding编码
	NSString *urlString =[[NSString stringWithFormat:@"http://192.168.1.200/infce.php"]
		   stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding ]; 
   // NSString *JSONData=@"ceshi";
    
    NSData *requestdata=[JSONData dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
						  //初始化http请求,并自动内存释放  
						//  NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease]; 
     NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
						  [request setURL:[NSURL URLWithString:urlString]]; 
						  [request setHTTPMethod:@"post"];  
     
  
						  NSString *contentType = [NSString stringWithFormat:@"text/xml"]; 
						  [request addValue:contentType forHTTPHeaderField:@"Content-Type"];  
                          [request setHTTPBody:requestdata];
  //  [request setTimeoutInterval:10];
    //NSURLConnection *connection;
@try
    {
        ISHttpContent=NO;
              
        [self performSelectorOnMainThread:@selector(MyTimer:) withObject:@"fdfd"   waitUntilDone:YES];
         /*     
        NSHTTPURLResponse *urlResponse = nil; 
        
        NSError *error = [[NSError alloc] init];  
        //同步返回请求，并获得返回数据  
        NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]; 
        NSString *  resultjson=[self replaceUnicode:result];
        //请求返回状态，如有中文无法发送请求，并且stausCode 值为 0 
        // NSData *jsonresut=[result dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *dicresult=[result objectFromJSONString];
        NSString *msgtemp=[dicresult objectForKey:@"rmsg"];
        NSInteger code=[[dicresult objectForKey:@"rstatus"] intValue];
        
        NSLog(@"code:%d",code);
        NSLog(@"rmsg:%@",msgtemp);
        NSLog(@"response:%@",resultjson);  
        
        //[self performSelectorOnMainThread:@selector(showAlert:) withObject:result waitUntilDone:YES];
        if(code==1||code==3)
        {
            ISHttpContent=YES;
            [self performSelectorOnMainThread:@selector(MyCloseLoading:) withObject:@"上传成功!" waitUntilDone:YES];
            //[self showAlert:@"上传成功!"];
        }
        else {
            // [HUD removeFromSuperview];
            //[HUD release];
            if([dicresult objectForKey:@"error"]==nil)
            {
                //[self performSelectorOnMainThread:@selector(MyCloseLoading:) withObject:@"网络超时" waitUntilDone:YES];
            }
            else {
                
                NSString *msg=[NSString stringWithFormat:@"上传失败!失败条数:%@\n数据已保存到数据管理",[dicresult objectForKey:@"error"]];
                
                [self performSelectorOnMainThread:@selector(MyCloseLoading:) withObject:msg waitUntilDone:YES];
            }
            // [self showAlert:msg];
        }
      */
   connection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    }
        @catch (NSException *ex) {
             [connection cancel];
            [connection release];
            [HUD removeFromSuperview];
            [HUD release];
            [self showAlert:@"网络超时\n数据已保存到数据管理"];
           
        }
    /*
    @try
    {
        
    if(connection)
    {
      
        //receivedData = [[NSMutableData data] retain];
        NSLog(@"intial done!");	
	}
    else {
         [self performSelectorOnMainThread:@selector(MyCloseLoading:) withObject:@"网络超时\n数据已保存到数据管理" waitUntilDone:YES];
    }
    }
    @catch (NSException *ex) {
        [connection cancel];
        [connection release];
         [self performSelectorOnMainThread:@selector(MyCloseLoading:) withObject:@"上传失败!\n数据已保存到数据管理" waitUntilDone:YES];
    }
     */
   }
//连接事件
#pragma mark- NSURLConnectionDelegate 协议方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response 
{
    NSLog(@"get the whole response");
    
    receivedData = [[NSMutableData data] retain];
    [receivedData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"get some data");
    [receivedData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{
    
     NSString *resutltcode;
    [connection release];
    @try
    {NSString *result = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding]; 
    NSString *  resultjson=[self replaceUnicode:result];
    NSDictionary *dicresult=[result objectFromJSONString];
    NSString *msgtemp=[dicresult objectForKey:@"rmsg"];
    NSInteger code=[[dicresult objectForKey:@"rstatus"] intValue];
    
    NSLog(@"code:%d",code);
    NSLog(@"rmsg:%@",msgtemp);
    NSLog(@"response:%@",resultjson);  
    
        [receivedData release];
       
    if(code==1||code==3)
    {
        ISHttpContent=YES;
     
      resutltcode=@"上传成功";
      
    }
    else {
            
            NSString *msg=[NSString stringWithFormat:@"上传失败!失败条数:%@\n数据已保存到数据管理",[dicresult objectForKey:@"error"]];
            
        resutltcode=msg;
         }
    }@catch (NSException *ex) {
        
          resutltcode=@"上传失败!\n数据已保存到数据管理";
        
    } 
    [HUD removeFromSuperview];
    [HUD release];
    [self showAlert:@"上传成功"];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	
    [connection release];
    [HUD removeFromSuperview];
    [HUD release];
    [self showAlert:@"上传失败!\n数据已保存到数据管理"];
    
    NSLog(@"Connection failed! Error - %@ %@",	  
          [error localizedDescription],		  
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
}
//自动消失框
- (void)timerHttpMethod:(NSTimer*)theTimer
{
    if(ISHttpContent==NO)
    {
        
        [self performSelectorOnMainThread:@selector(MyCloseLoading:) withObject:@"网络超时\n数据已保存到数据管理" waitUntilDone:YES];
               
    }
}

-(void)MyCloseLoading:(NSString *)msg
{
     @try
    {
    [connection cancel];
    [connection release];
    }@catch (NSException *ex) {
        
    }    
   //[myThread autorelease];
   [HUD removeFromSuperview];
    [HUD release];
    [self showAlert:msg];
   

}

-(void)MyTimer:(NSString *)msg
{
	
   // myThread1 = [[NSThread alloc] initWithTarget:self selector:@selector(MytimeForThread:) object:nil];
   // [myThread1 start];
    [self MytimeForThread:@"fdf"];

	
}
-(void)MytimeForThread:(NSString *)msg
{
    [NSTimer scheduledTimerWithTimeInterval:10.0f
									 target:self
								   selector:@selector(timerHttpMethod:)
                                   userInfo:NULL
									repeats:NO];
	

}
-(NSString *)replaceUnicode:(NSString *)unicodeStr {  

NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];  
NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];  
NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];  
NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];  
NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData  
                                                       mutabilityOption:NSPropertyListImmutable   
                                                                 format:NULL  
                                                       errorDescription:NULL];  

//NSLog(@"Output = %@", returnStr);  

return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];  
}  					  //http请求结束
-(void)Saveinfo
{
	JeepDemoAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
	
	NSError *error;
	// for (int i = 1; i <= 4; i++) {
	//NSString *fieldName = [NSString stringWithFormat:@"line%d", i];
	//UITextField *theField = [self valueForKey:fieldName];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"CustomerInfo"
														 inManagedObjectContext:context];
	[request setEntity:entityDescription];
		NSManagedObject *theLine = nil;
	
	//  NSArray *objects = [context executeFetchRequest:request error:&error];
	
	//if (objects == nil){
	//  NSLog(@"There was an error!");
	// Do whatever error handling is appropriate
	// }
	// if ([objects count] > 0)
	//  theLine = [objects objectAtIndex:0];
	// else
	theLine = [NSEntityDescription insertNewObjectForEntityForName:@"CustomerInfo"
											inManagedObjectContext:context];
	
	if(Isupload)
	{
		[theLine setValue:[NSNumber numberWithInt:1] forKey:@"isupload"];
        [theLine setValue:[NSNumber numberWithInt:0] forKey:@"iszancun"];
	}
	else
	{
		[theLine setValue:[NSNumber numberWithInt:0] forKey:@"isupload"];
        [theLine setValue:[NSNumber numberWithInt:1] forKey:@"iszancun"];
	}
	
	NSDate *date=[NSDate date];
	NSTimeInterval sec=[date timeIntervalSinceNow];
	NSDate *currentDate=[[NSDate alloc]initWithTimeIntervalSinceNow:sec];
	NSDateFormatter *df=[[NSDateFormatter alloc] init];
	[df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
	NSString *na=[df stringFromDate:currentDate];
	[theLine setValue:na forKey:@"createtime"];
	//[na release];
	//[df release];
	//[currentDate release];

	//[date release];
	NSArray *arraychezhu=[_value componentsSeparatedByString:@","];
	[theLine setValue:[custmerMode GetValueforProvien] forKey:@"provine"];
	[theLine setValue:[arraychezhu objectAtIndex:0] forKey:@"chezhu"];
	[theLine setValue:[arraychezhu objectAtIndex:1] forKey:@"cartype"];
	//[arraychezhu release];
	[theLine setValue:[custmerMode GetValueforIskeyi] forKey:@"iskeyi"];
	[theLine setValue:[custmerMode GetValueforCity] forKey:@"city"];
	[theLine setValue:[custmerMode GetValueforSex] forKey:@"sex"];
	[theLine setValue:[custmerMode GetValueforQ3] forKey:@"Q3"];
	[theLine setValue:[custmerMode GetValueforEmail] forKey:@"email"];
	[theLine setValue:[custmerMode GetValueforQ2] forKey:@"Q2"];
	[theLine setValue:[custmerMode GetValueforPhone] forKey:@"phone"];
	[theLine setValue:[custmerMode GetValueforQ1] forKey:@"Q1"];
	[theLine setValue:[custmerMode GetValueforName] forKey:@"name"];
    [theLine setValue:[custmerMode GetValueforCodeQR] forKey:@"codeQR"];
    [theLine setValue:[custmerMode GetValueforIssms] forKey:@"issms"];
   	// }
    if ([[custmerMode GetValueforId] compare:@""]==NSOrderedSame)
    {
        NSString *tempid=[self stringwithuuID];
        [theLine setValue:tempid forKey:@"Id"];

    } 
    else
    {
          NSString *tempid1=[custmerMode GetValueforId];
          NSPredicate *pred = [NSPredicate predicateWithFormat:@"(Id = %@)", tempid1];
        [request setPredicate:pred];
        NSManagedObject *theLineold = nil;
        
          NSArray *objects = [context executeFetchRequest:request error:&error];
        
        if (objects == nil){
          NSLog(@"There was an error!");
         //Do whatever error handling is appropriate
         }
        if ([objects count] > 0)
         theLineold = [objects objectAtIndex:0];

      
        [context deleteObject:theLineold];
         NSString *tempid=[self stringwithuuID];
        [theLine setValue:tempid forKey:@"Id"];
    }
    [request release];

  [context save:&error];
	if(Isupload)
	{
        //[HUD removeFromSuperview];
       // [HUD release];
       // HUD=nil;
		//[self showAlert:@"上传成功!"];
	}
	else {
		
		[self showAlert:@"保存成功!"];
	}
    
	[self ClearDataForController];
}

//自动消失框
- (void)timerFireMethod:(NSTimer*)theTimer
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    
    [promptAlert release];
    promptAlert =NULL;
}


- (void)showAlert:(NSString *)msg

{
	
	UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
	
	[NSTimer scheduledTimerWithTimeInterval:1.0f
									 target:self
								   selector:@selector(timerFireMethod:)
								   userInfo:promptAlert
									repeats:NO];
	
	promptAlert.frame=CGRectMake(100, 400, 100, 50);
	[promptAlert show];  
}

//自动消失框结束
-(NSString *)stringwithuuID
{
	CFUUIDRef uuidobj=CFUUIDCreate(nil);
	NSString *uuidString=(NSString *)CFUUIDCreateString(nil,uuidobj);
	CFRelease(uuidobj);
	return [uuidString autorelease];
}
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId
{
    //[dic setObject:[NSString stringWithFormat:@"%d",index] forKey:groupId];
	[dic setObject:[NSString stringWithFormat:@"%d",index] forKey:groupId];
}
-(IBAction)textFieldDoneEditing:(id)sender
{
	//[sender resignFirstResponder];
}
-(BOOL)validEmialandphone
{
    BOOL issucess=YES;
    NSString *msgtemp=@"请输入正确的";
    if([txtPhone.text compare:@""]!=NSOrderedSame)
    {
    if([self isMobileNumber:txtPhone.text]==NO)
    {
      msgtemp=[NSString stringWithFormat:@"%@%@",msgtemp,@"手机号码"];
        issucess=NO;
    }
   }
if([txtEmail.text compare:@""]!=NSOrderedSame)
{
    if([self isEmail:txtEmail.text]==NO)
    {
        if ([msgtemp compare:@""]==NSOrderedSame) {
            msgtemp=[NSString stringWithFormat:@"%@",msgtemp,@"Email"];

        }
        else {
            
        
            msgtemp=[NSString stringWithFormat:@"%@,%@",msgtemp,@"Email"];}
               issucess=NO;
    }
}
    if(issucess==NO)
    {
        [self showAlert:msgtemp];
    }
    return  issucess;
}
-(IBAction)backgroundTap:(id)sender
{
    mybguiview.hidden=YES;
	//self.picker.frame = CGRectMake(0, 480, 320, 260);
	//self.picker.hidden=YES;
	[txtName resignFirstResponder];
	[txtPhone resignFirstResponder];
	[txtEmail resignFirstResponder];
    [self validEmialandphone];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	lblmsg=nil;
	myalertView=nil;
	dic=nil;
	pickerData=nil;
	picker=nil;
	//pickertype=nil;
	dic=nil;
	cbxcity=nil;
	cbxprovince=nil;
	cbxcompony=nil;
	txtName=nil;
	txtPhone=nil;
	txtEmail=nil;
	iskeyi=nil;
	Q1=nil;
	Q2=nil;
	sexc=nil;
	custmerMode=nil;
	dicrbvalue=nil;
	rbgroup1 =nil;
	rbgroup2=nil;
	rbgroup3 =nil;
	rbgroup4 =nil;
	tableArray=nil;
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[dic release];
	[pickerData release];
	[picker release];
	[cbxcity release];
	[cbxcompony release];
	[cbxprovince release];
//	[pickertype release];
	[lblmsg release];
	[myalertView release];
	[dic release];
	[zips release];
	[states release];
	[stateZips release];
	[txtName release];
	[txtPhone release];
	[txtEmail release];
	[iskeyi release];
	[Q1 release];
	[Q2 release];
	[custmerMode release];
	[sexc release];
	[dicrbvalue release];
	[rbgroup1 release];
	[rbgroup2 release];
	[rbgroup3 release];
	[rbgroup4 release];
	[tableArray release];
    [super dealloc];
}

-(IBAction)cbxfinished:(id)sender
{
    self.pickerUIView.frame = CGRectMake(0, 480, 320, 260);
	//self.pickerUIView.hidden=YES;
    if (self.pickertype==1) {
	 	cbxprovince.titleLabel.text=selected;
		//NSString *selectedState = [self.states objectAtIndex:row];
        //	NSArray *array = [stateZips objectForKey:selectedState];
		
		cbxcity.titleLabel.text=[[self.zips objectAtIndex:0] objectForKey:@"city"];
		//[array release];
	}
	else if(self.pickertype==2)
	{
		cbxcity.titleLabel.text=selected;
	}
	else
	{
        cbxcompony.titleLabel.text=[[NSString alloc] initWithFormat:@"  %@",selected];
		
	}
}
-(IBAction)cbxclickProvince
{
    [txtName resignFirstResponder];
	[txtPhone resignFirstResponder];
	[txtEmail resignFirstResponder];
  //  [view4 setUserInteractionEnabled:NO];
    mybguiview.hidden=NO;
	self.pickertype=1;
	cbxcity.enabled=YES;
	//NSArray *array=[[NSArray alloc]initWithObjects:
				//	@"大众",@"奔驰",@"宝马",@"保时捷",@"jeep",@"马自达",nil];
	//self.pickerData=array;
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
    self.picker.hidden=NO;
	selected=@"四川省";
     self.zips = [[states objectAtIndex:0] objectForKey:@"Cities"];
      self.btncbx.hidden=NO;
	//self.pickerUIView.hidden=NO;
	self.pickerData=self.states;
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
   self.picker.frame = CGRectMake(0,screenheight-235, 320, 260);
   // self.pickerUIView.frame=CGRectMake(0, 245, 320, 260);
  
    self.btncbx.frame=CGRectMake(0,screenheight-279, 320, 44);
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished-
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}
-(IBAction)cbxclickCity
{
    [txtName resignFirstResponder];
	[txtPhone resignFirstResponder];
	[txtEmail resignFirstResponder];
	self.pickertype=2;
	 mybguiview.hidden=NO;
	//NSArray *array=[[NSArray alloc]initWithObjects:
				//	@"大众",@"奔驰",@"宝马",@"保时捷",@"jeep",@"马自达",nil];
	self.pickerData=self.zips;
	CGContextRef context = UIGraphicsGetCurrentContext();
   [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
   [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.hidden=NO;
     self.btncbx.hidden=NO;
		cbxtxt=[[self.zips objectAtIndex:0] objectForKey:@"city"];
	  //self.pickerUIView.hidden=NO;
	//self.pickerData=array;
  
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    
    self.pickerData=self.zips;
    [self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.picker.frame = CGRectMake(0,screenheight-235, 320, 260);
    // self.pickerUIView.frame=CGRectMake(0, 245, 320, 260);
    
    self.btncbx.frame=CGRectMake(0,screenheight-279, 320, 44);
  //  self.picker.frame = CGRectMake(0, 245, 320, 260);
    
   [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
   [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}
-(IBAction)cbxclickCompney
{
     mybguiview.hidden=NO;
	self.pickertype=3;
	
	NSArray *array=[[NSArray alloc]initWithObjects:
					@"四川华驰",@"成都华驰",@"成都东浩",@"四川城市车辆",nil];
	//self.pickerData=self.zips;:
    selected=@"四川华驰";
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	//self.pickerUIView.hidden=NO;
	
	
self.pickerData=array;
    self.picker.hidden=NO;
     self.btncbx.hidden=NO;
	//self.pickerData=array;
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    self.pickerData=array;
    [self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
	
	//[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.picker.frame = CGRectMake(0,screenheight-235, 320, 260);
    // self.pickerUIView.frame=CGRectMake(0, 245, 320, 260);
    
    self.btncbx.frame=CGRectMake(0,screenheight-279, 320, 44);
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}
-(CustomerInfoModel *)GetCellInfo:(NSString *)Id
{
	CustomerInfoModel *model=nil;
	JeepDemoAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
	
	NSError *error;
	// for (int i = 1; i <= 4; i++) {
	//NSString *fieldName = [NSString stringWithFormat:@"line%d", i];
	//UITextField *theField = [self valueForKey:fieldName];
	
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"CustomerInfo"
														 inManagedObjectContext:context];
	[request setEntity:entityDescription];
	  NSPredicate *pred = [NSPredicate predicateWithFormat:@"(Id = %@)", Id];
	[request setPredicate:pred];
	
	NSManagedObject *theLine = nil;
	
	NSArray *objects = [context executeFetchRequest:request error:&error];
	
	if (objects == nil){
	  NSLog(@"There was an error!");
	 //Do whatever error handling is appropriate
	}
	if ([objects count] > 0)
	{
	 theLine = [objects objectAtIndex:0];
	
	
			model=[[CustomerInfoModel alloc] init];
			
			[model setValueforName:[theLine valueForKey:@"name"]];
			[model setValueforId:[theLine valueForKey:@"Id"]];
			[model setValueforIsupload:[[theLine valueForKey:@"isupload"] intValue]];
			[model setValueforProvien:[theLine valueForKey:@"provine"]];
			[model setValueforChezhu:[theLine valueForKey:@"chezhu"]];
			
			[model setValueforCartype:[theLine valueForKey:@"cartype"]];
			[model setValueforIskeyi:[theLine valueForKey:@"iskeyi"]];
			[model setValueforCity:[theLine valueForKey:@"city"]];
			[model setValueforSex:[theLine valueForKey:@"sex"]];
			[model setValueforQ3:[theLine valueForKey:@"Q3"]];
			[model setValueforEmail:[theLine valueForKey:@"email"]];
			[model setValueforPhone:[theLine valueForKey:@"phone"]];
			[model setValueforQ1:[theLine valueForKey:@"Q1"]];
			[model setValueforQ2:[theLine valueForKey:@"Q2"]];
			[model setValueforCreateTime:[theLine valueForKey:@"createtime"]];
			[model setValueforCodeQR:[theLine valueForKey:@"codeQR"]];
		    [model setValueforIssms:[theLine valueForKey:@"issms"]];
       	
	}
		[request release];
   // [context save:&error];
	return model;
}
#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [pickerData count];
}
#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if(self.pickertype==1)
	{
		return [[pickerData objectAtIndex:row] objectForKey:@"State"];
	}
	else if(self.pickertype==2)
	{return [[pickerData objectAtIndex:row] objectForKey:@"city"];
	}
	else
	return [pickerData objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView 
	  didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	//NSString *selected=nil;
	if(self.pickertype==1)
	{
		selected= [[pickerData objectAtIndex:row] objectForKey:@"State"];
        self.zips = [[states objectAtIndex:row] objectForKey:@"Cities"];

	}
	else if(self.pickertype==2)
	{selected=[[pickerData objectAtIndex:row] objectForKey:@"city"];
        cbxtxt=[[pickerData objectAtIndex:row] objectForKey:@"city"];
	}
	else
	 selected = [pickerData objectAtIndex:row];
	
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	//self.picker.frame = CGRectMake(0, 480, 320, 260);
	
	[UIView setAnimationDelegate:self];
	// 动画完毕后调用animationFinished
	[UIView setAnimationDidStopSelector:@selector(animationFinished)];
	[UIView commitAnimations];
	//NSString *selectedState = [self.states objectAtIndex:row];
	//NSArray *array = [stateZips objectForKey:selectedState];
	//self.zips = array;
	//[picker selectRow:0 inComponent:kZipComponent animated:YES];
	//[picker reloadComponent:kZipComponent];
	
	
}
#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return [self.tableArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *FirstLevelCell= @"FirstLevelCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
                             FirstLevelCell];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier: FirstLevelCell] autorelease];
    }
    // Configure the cell
    NSUInteger row = [indexPath row];
    NSString *controllertt =nil;
	controllertt=[tableArray objectAtIndex:row];
    NSString *tempcellmsg=nil;
	if(controllertt!=nil)
	{
		
		if([tableArray count]>row)
		{	NSArray *arraychezhu=[controllertt componentsSeparatedByString:@","];
    //NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:30];
	// [resultStr appendFormat:@"%@,",];
	//[resultStr appendFormat:@"%@-",[controller GetValueforName]==nil?@"匿名":[controller GetValueforName]];
	// [resultStr appendFormat:@"%@-",[controller GetValueforCarType]];
	// [resultStr appendFormat:@"%@-",[controller GetValueforCreateTime]];
          
	tempcellmsg=[[NSString alloc] initWithFormat:@"%@,%@,%@",
						  [arraychezhu objectAtIndex:0],[arraychezhu objectAtIndex:1],
						   [arraychezhu objectAtIndex:2]];
           
    cell.textLabel.text =tempcellmsg;
		[cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    //cell.image = controller.rowImage;
            if(IsTableView1)
   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	//cell.tag=[arraychezhu objectAtIndex:3];
			//[arraychezhu release];
		}
		else {
			cell.textLabel.text =tempcellmsg;
			[cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
			//cell.image = controller.rowImage;
             if(IsTableView1)
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
			//cell.tag=nil;
		}

	//[tempcellmsg release];
		//[controllertt release];
		
	}
    return cell;
}
#pragma mark -
#pragma mark Table View Delegate Methods
- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
	 NSString *rowValue = [tableArray objectAtIndex:row];
	if(rowValue!=nil)
	{
		
        if(IsTableView1)
        {
			NSArray *arraychezhu=[rowValue componentsSeparatedByString:@","];
		
		CustomerInfoModel *cellcustomerMode=[self GetCellInfo:[arraychezhu objectAtIndex:3]];
         //  custmerMode=[self GetCellInfo:[arraychezhu objectAtIndex:4]];
            
		if(custmerMode!=nil)
		{
            iddata=[[arraychezhu objectAtIndex:3] copy];
			txtName.text=[cellcustomerMode GetValueforName];
			txtEmail.text=[cellcustomerMode GetValueforEmail];
			txtPhone.text=[cellcustomerMode GetValueforPhone];
			cbxcity.titleLabel.text=[cellcustomerMode GetValueforCity];
			cbxprovince.titleLabel.text=[cellcustomerMode GetValueforProvien];
            NSString *tempcbx=@"请选择";
            if([[[cellcustomerMode GetValueforQ3] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:tempcbx]==NSOrderedSame)
            {
                cbxcompony.titleLabel.text=@"                请选择     ";
            }
            else {
               
            
            cbxcompony.titleLabel.text=[[NSString alloc] initWithFormat:@"  %@",[cellcustomerMode GetValueforQ3]];
            }
			//cbxcompony.titleLabel.text=[cellcustomerMode GetValueforQ3];
			//custmerMode=cellcustomerMode; 
			
             for (RadioButton *rba in [dicrbvalue allValues])
			{
				[rba setChecked:NO];
			}
            NSString *iskeyi1=@"";
         
            NSString *SEXTEMP=@"";
            NSString *cartime=@"";
            NSString *issms=@"";
            if([[cellcustomerMode GetValueforIskeyi] compare:iskeyi1]!=NSOrderedSame)
            {
            if([[cellcustomerMode GetValueforIskeyi] compare:@"1"]==NSOrderedSame)
            { 
                iskeyi1=@"是";
            }
            
            else {
                iskeyi1=@"否";
            }
                RadioButton *rb3=[dicrbvalue objectForKey:iskeyi1];
                [dic setObject:[NSString stringWithFormat:@"%d",rb3.tag] forKey:@"threed group"];
                [rb3 setChecked:YES];
            }
            
            if([[cellcustomerMode GetValueforSex] compare:SEXTEMP]!=NSOrderedSame)
            {
            if([[cellcustomerMode GetValueforSex] compare:@"1"]==NSOrderedSame)
            {
                SEXTEMP=@"男";
            }
            else
               {
                SEXTEMP=@"女";
                 
            }
                RadioButton *rb4=[dicrbvalue objectForKey:SEXTEMP];
                [dic setObject:[NSString stringWithFormat:@"%d",rb4.tag] forKey:@"Four group"];
                [rb4 setChecked:YES];

            }
             NSString *q1=[cellcustomerMode GetValueforQ1];
            if([q1 compare:cartime]!=NSOrderedSame)
            {
           
            if([q1 compare:@"1"]==NSOrderedSame)
            {
                cartime=@"一周内";
            }
            else if([q1 compare:@"2"]==NSOrderedSame)
            {
                cartime=@"两周内";
            }
            else if([q1 compare:@"3"]==NSOrderedSame)
            {
                cartime=@"一个月内";
            }
            else if([q1 compare:@"4"]==NSOrderedSame)
            {
                cartime=@"三个月内";
            }
            else if([q1 compare:@"5"]==NSOrderedSame)
            {
                cartime=@"半年内";
            }
            else if([q1 compare:@"6"]==NSOrderedSame)
            {
                cartime=@"一年内";
            }
            else if([q1 compare:@"7"]==NSOrderedSame)
            {
                cartime=@"一年后";
            }
            else {
                cartime=@"暂无购车计划";
            }
                RadioButton *rb1=[dicrbvalue objectForKey:cartime];
                [dic setObject:[NSString stringWithFormat:@"%d",rb1.tag] forKey:@"first group"];
                
                [rb1 setChecked:YES];
            }
            NSString *tempempty=@"";
            NSString *zancuncode=[cellcustomerMode GetValueforCodeQR];
            if([zancuncode compare:tempempty]==NSOrderedSame)
            {
                lblcodeqr.text=@"克莱斯勒";
            }
            else
            {
                 lblcodeqr.text=zancuncode;
            }
			
            if([[cellcustomerMode GetValueforQ2] compare:issms]!=NSOrderedSame)
            {
			RadioButton *rb2=[dicrbvalue objectForKey:[cellcustomerMode GetValueforQ2]];
             [dic setObject:[NSString stringWithFormat:@"%d",rb2.tag] forKey:@"second group"];
			[rb2 setChecked:YES];
            }		            
            if([[cellcustomerMode GetValueforIssms] compare:issms]!=NSOrderedSame)
            {
                if([[cellcustomerMode GetValueforIssms] compare:@"1"]==NSOrderedSame)
                {
                    issms=@"0";
                }
                
                else {
                    issms=@"1";
                }
                RadioButton *rb5=[dicrbvalue objectForKey:issms];
                [dic setObject:[NSString stringWithFormat:@"%d",rb5.tag] forKey:@"Five group"];
                [rb5 setChecked:YES];
            }
                       
                     
			sc1.selectedSegmentIndex=0;
			[[self view] bringSubviewToFront:view1];
		}
		}
	}

}

@end
