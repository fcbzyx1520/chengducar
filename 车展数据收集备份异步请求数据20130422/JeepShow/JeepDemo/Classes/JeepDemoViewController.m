//
//  JeepDemoViewController.m
//  JeepDemo
//
//  Created by fu on 12-11-10.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "JeepDemoViewController.h"
#import "Test.h"
#import "DropDown.h"
#import "PassDelegare.h"
@implementation JeepDemoViewController
@synthesize testcontroller;
@synthesize lblchezhu;
@synthesize lblcar;
@synthesize pickerData;
@synthesize picker;
@synthesize pickerUIView;
@synthesize passDelegate;
@synthesize IsChezhu;//判断下拉列表：YES（车助编号）
@synthesize cbxtxt;
-(IBAction)cbxfished
{

  CGContextRef context = UIGraphicsGetCurrentContext();
  [UIView beginAnimations:nil context:context];
[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
[UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
self.pickerUIView.frame = CGRectMake(0, screenheight, 320, 260);

[UIView setAnimationDelegate:self];
// 动画完毕后调用animationFinished
[UIView setAnimationDidStopSelector:@selector(animationFinished)];
[UIView commitAnimations];
}
-(IBAction)btnLogionClick:(id)sender
{
	NSString *temps=@"请选择";
	NSString *chezhu=[self.lblchezhu.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *car=[self.lblcar.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
	if([temps compare:chezhu]==NSOrderedSame)
	{
		UIAlertView *alert = [[UIAlertView alloc] 
                              initWithTitle:@"提示" 
                              message:@"请选择车助编号!"
                              delegate:self 
                              cancelButtonTitle:@"确定" 
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
       
		
	}
	else if([temps compare:car]==NSOrderedSame)
	{
		UIAlertView *alert = [[UIAlertView alloc] 
                              initWithTitle:@"提示" 
                              message:@"请选择负责车型!" 
                              delegate:self 
                              cancelButtonTitle:@"确定" 
                              otherButtonTitles:nil];
        [alert show];
        [alert release];
      		
	}
	else {
	
	if(testcontroller==nil)
	{
	Test *tt=[[Test alloc] initWithNibName:@"Test" bundle:nil];
		self.testcontroller=tt;
		[tt release];
	}
	
	self.passDelegate=self.testcontroller;
		NSString *chuanzhi=[[NSString alloc] 
							initWithString:
							[NSString stringWithFormat:@"%@,%@",chezhu,car]];
	[self.passDelegate setValue:chuanzhi];
	//[self.view insertSubview:testcontroller.view atIndex:0];
	//[self.view removeFromSuperview];
	//[self setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
  [self presentModalViewController:testcontroller animated:YES]; 
        lblcar.titleLabel.text=@"             请选择  ";
        lblchezhu.titleLabel.text=@"请选择  ";
	//controller.delegate = self;
	}
	//[self.view.window addSubview:controller.view];
	//[self.view removeFromSuperview];
	//[self.navigationController pushViewController:t animated:YES];
}
-(IBAction)backgroundTap:(id)sender
{
    if (self.IsChezhu) {
		lblchezhu.titleLabel.text=self.cbxtxt;
	}
	else
	{
		lblcar.titleLabel.text=self.cbxtxt;
        lblcar.titleLabel.text=[[NSString alloc] initWithFormat:@"  %@  ",self.cbxtxt];
	}
	self.pickerUIView.frame = CGRectMake(0, screenheight, 320, 260);

}
/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
		
    CGRect rect_screen = [[UIScreen mainScreen]bounds];
    CGSize size_screen = rect_screen.size;
    screenheight=size_screen.height;
	self.pickerUIView.frame =CGRectMake(0, screenheight, 320, 260);
	//lblchezhu.backgroundColor=[UIColor clearColor];
	// [super viewDidLoad];
}

-(IBAction)cbxclickchezhu
{
	self.IsChezhu=YES;
	// TODO: Implement Action Sheet and Aler
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.hidden=NO;
	NSArray *arry=[[NSArray alloc]initWithObjects:
				   @"801",@"802",@"803",@"804",@"805",@"806",
                   @"807",@"808",@"809",@"810",@"811",@"812",
                   @"813",@"814",@"815",@"816",@"817",@"818",
                   @"819",@"820",@"821",@"822",@"823",@"824",
                   @"825",@"826",@"827",@"828",@"829",@"830",
                   @"831",@"832",@"833",@"834",@"835",@"836",
                   @"837",@"838",@"839",@"840",@"841",@"842",@"843",@"844",@"845",@"846",@"847",@"848",@"849",@"850",@"851",@"852",@"853",@"854",@"855",@"856",@"857",@"858",@"859",
                     @"860",@"861",@"862",@"863",@"864",@"865",@"866",@"867",@"868",@"869",@"870",@"871",@"872",@"873",@"874",@"875",@"876",@"877",@"878",@"879",@"880",@"881",@"882",@"883",@"884",@"885",@"886",@"887",@"888",@"889",@"890",@"891",@"892",@"893",@"894",@"895",@"896",@"897",@"898",@"899",               nil];
    self.cbxtxt=@"801";
	self.pickerData=arry;
	[self.picker selectRow:0 inComponent:kdid animated:YES];

	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.pickerUIView.frame = CGRectMake(0,screenheight-274, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
	//[actionSheet addSubview:picker];
	//[actionSheet showInView:self.view];
    //[actionSheet release]; 
}
-(IBAction)cbxclickcar
{
	self.IsChezhu=NO;
	NSArray *array=[[NSArray alloc]initWithObjects:
                    @"全新进口大切诺基SRT8",
                    @"全新进口大切诺基",
                    @"牧马人Rubicon四门款",
                    @"牧马人Rubicon十周年两门款",
                    @"2014指南者2.4L",
                    @"2014自由客2.4L",
                    @"2014指南者2.4L蛇行珍藏版",
                    @"2014自由客蛇行珍藏版",
                    @"2014自由光",
                    @"300C",
                    @"300S",
                    @"大捷龙",
                    @"酷威",nil];
	self.pickerData=array;
    self.cbxtxt=@"全新进口大切诺基SRT8";
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.hidden=NO;
	
	
	self.pickerData=array;
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.pickerUIView.frame = CGRectMake(0,screenheight-274, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	testcontroller=nil;
	lblchezhu=nil;
	lblcar=nil;
	pickerData=nil;
	[super viewDidUnload];
	
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[testcontroller release];
	[lblchezhu release];
	[pickerData release];
	[lblcar release];
    [super dealloc];
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
	return [pickerData objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	
	//NSInteger row1 = [picker selectedRowInComponent:0];
	NSString *selected = [pickerData objectAtIndex:row];
    self.cbxtxt=selected;
	
	
		CGContextRef context = UIGraphicsGetCurrentContext();
		[UIView beginAnimations:nil context:context];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
		//self.pickerUIView.frame = CGRectMake(0, 480, 320, 260);
		
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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//messageLabel.text = @"Touches Began";
   // [self updateLabelsFromTouches:touches];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
  
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  self.pickerUIView.frame = CGRectMake(0, screenheight, 320, 260);
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
     
}
@end
