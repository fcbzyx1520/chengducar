//
//  CustomerBaseInfo.m
//  JeepDemo
//
//  Created by fu on 12-11-11.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerBaseInfo.h"
#import "RadioButton.h"


@implementation CustomerBaseInfo
@synthesize dic;

@synthesize cbxprovince;
@synthesize cbxcity;
@synthesize cbxcompony;
@synthesize pickerData;
@synthesize picker;
@synthesize pickerUIView;
@synthesize pickertype;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc] initWithObjects:@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
	self.pickerData = array;
	[array release];	
	//self.picker.frame = CGRectMake(0, 480, 320, 260);
	 [super viewDidLoad];
	
	RadioButton *rb20= [[RadioButton alloc] initWithGroupId:@"Four group" index:0]; 
	RadioButton *rb21 = [[RadioButton alloc] initWithGroupId:@"Four group" index:1]; 
	
	rb20.frame = CGRectMake(100,70,22,22);
    rb21.frame = CGRectMake(150,70,22,22);
	rb20.tag=1;
	rb21.tag=0;
	
	UILabel *label29 =[[UILabel alloc] initWithFrame:CGRectMake(121, 70, 200, 20)];
    label29.backgroundColor = [UIColor clearColor];
    label29.text = @"是";
	[label29 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label29];
    [label29 release];
	
	
	UILabel *label28 =[[UILabel alloc] initWithFrame:CGRectMake(171, 70, 200, 20)];
    label28.backgroundColor = [UIColor clearColor];
    label28.text = @"否";
	[label28 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label28];
    [label28 release];
	[self.view addSubview:rb20];
	[self.view addSubview:rb21];
	
	
	
	RadioButton *rb1weekly = [[RadioButton alloc] initWithGroupId:@"first group" index:0];
    RadioButton *rb2weekly = [[RadioButton alloc] initWithGroupId:@"first group" index:1];
    RadioButton *rb1month= [[RadioButton alloc] initWithGroupId:@"first group" index:2];
   
	 RadioButton *rb3month= [[RadioButton alloc] initWithGroupId:@"first group" index:3];
	 RadioButton *rb6month= [[RadioButton alloc] initWithGroupId:@"first group" index:4];
	 RadioButton *rb1year= [[RadioButton alloc] initWithGroupId:@"first group" index:5];
	 RadioButton *rb2year= [[RadioButton alloc] initWithGroupId:@"first group" index:6];
	  RadioButton *rb1no= [[RadioButton alloc] initWithGroupId:@"first group" index:7];
    rb1weekly.frame = CGRectMake(29,215,22,22);
    rb2weekly.frame = CGRectMake(120,215,22,22);
    rb1month.frame = CGRectMake(220,215,22,22);
	rb3month.frame = CGRectMake(29,245,22,22);
	rb6month.frame = CGRectMake(120,245,22,22);
	rb1year.frame = CGRectMake(220,245,22,22);
	rb2year.frame = CGRectMake(29,275,22,22);
	rb1no.frame = CGRectMake(120,275,22,22);
	
    rb1weekly.tag=@"一周内";
	rb2weekly.tag=@"两周内";
	rb1month.tag=@"一个月内";
	rb3month.tag=@"三个月内";
	rb6month.tag=@"半年内";
	rb1year.tag=@"一年内";
	rb2year.tag=@"一年后";
	rb1no.tag=@"暂无购车计划";

	
	
    [self.view addSubview:rb1weekly];
    [self.view addSubview:rb2weekly];
    [self.view addSubview:rb1month];
	[self.view addSubview:rb3month];
    [self.view addSubview:rb6month];
    [self.view addSubview:rb1year];
	[self.view addSubview:rb2year];
    [self.view addSubview:rb1no];
  
	
    [rb1weekly release];
    [rb2weekly release];
    [rb1month release];
    [rb3month release];
    [rb6month release];
    [rb1year release];
    [rb2year release];
    [rb1no release];
  
    
    UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(50, 215, 80, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = @"一周内";
	[label1 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label1];
    [label1 release];
	
    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(140, 215, 80, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = @"两周内";
	[label2 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label2];    
    [label2 release];
	
    UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(240, 215, 80, 20)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = @"一个月内";
	[label3 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label3];
    [label3 release];
	
	UILabel *label4 =[[UILabel alloc] initWithFrame:CGRectMake(50, 245, 80, 20)];
    label4.backgroundColor = [UIColor clearColor];
    label4.text = @"三个月内";
	[label4 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label4];
    [label4 release];
	
    UILabel *label5 =[[UILabel alloc] initWithFrame:CGRectMake(140, 245, 80, 20)];
    label5.backgroundColor = [UIColor clearColor];
    label5.text = @"半年内";
	[label5 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label5];    
    [label5 release];
	
    UILabel *label6 =[[UILabel alloc] initWithFrame:CGRectMake(240, 245, 80, 20)];
    label6.backgroundColor = [UIColor clearColor];
    label6.text = @"一年内";
	[label6 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label6];
    [label6 release];

	UILabel *label7 =[[UILabel alloc] initWithFrame:CGRectMake(50, 275, 80, 20)];
    label7.backgroundColor = [UIColor clearColor];
    label7.text = @"一年后";
	[label7 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label7];
    [label7 release];
	
    UILabel *label8=[[UILabel alloc] initWithFrame:CGRectMake(140, 275, 80, 20)];
    label8.backgroundColor = [UIColor clearColor];
    label8.text = @"暂无购车计划";
	[label8 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label8];    
    [label8 release];
	
     RadioButton *rb1 = [[RadioButton alloc] initWithGroupId:@"second group" index:0]; 
	 RadioButton *rb2 = [[RadioButton alloc] initWithGroupId:@"second group" index:1]; 
	 RadioButton *rb3 = [[RadioButton alloc] initWithGroupId:@"second group" index:2]; 
	 RadioButton *rb4 = [[RadioButton alloc] initWithGroupId:@"second group" index:3]; 
	rb1.frame = CGRectMake(29,370,22,22);
    rb2.frame = CGRectMake(29,394,22,22);
    rb3.frame = CGRectMake(29,424,22,22);
	rb4.frame = CGRectMake(29,454,22,22);
	rb1.tag=@"全新进口Jeep大切诺基SRT8";
	rb2.tag=@"全新进口Jeep大切诺基梦十珍藏版";
	rb3.tag=@"全新进口Jeep大切诺基3.6L";
	rb4.tag=@"全新进口Jeep大切诺基5.7L";
	UILabel *label9=[[UILabel alloc] initWithFrame:CGRectMake(50, 370, 200, 20)];
    label9.backgroundColor = [UIColor clearColor];
    label9.text = @"全新进口Jeep大切诺基SRT8";
	[label9 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label9];
    [label9 release];
	
    UILabel *label10 =[[UILabel alloc] initWithFrame:CGRectMake(50, 394, 200, 20)];
    label10.backgroundColor = [UIColor clearColor];
    label10.text = @"全新进口Jeep大切诺基梦十珍藏版";
	[label10 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label10];    
    [label10 release];
	
    UILabel *label11 =[[UILabel alloc] initWithFrame:CGRectMake(50, 424, 200, 20)];
    label11.backgroundColor = [UIColor clearColor];
    label11.text = @"全新进口Jeep大切诺基3.6L";
	[label11 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label11];
    [label11 release];
	
	UILabel *label12 =[[UILabel alloc] initWithFrame:CGRectMake(50, 454, 200, 20)];
    label12.backgroundColor = [UIColor clearColor];
    label12.text = @"全新进口Jeep大切诺基5.7L";
	[label12 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label12];
    [label12 release];
	
	
	UILabel *questionText2 = [[UILabel alloc] initWithFrame:CGRectMake(29,484,300,20)];
    questionText2.backgroundColor = [UIColor clearColor];
    [questionText2 setAdjustsFontSizeToFitWidth:YES];
    questionText2.text = @"Jeep指南者(Compass)";
	[questionText2 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.view  addSubview:questionText2];
	
	RadioButton *rb5 = [[RadioButton alloc] initWithGroupId:@"second group" index:4]; 
	RadioButton *rb6 = [[RadioButton alloc] initWithGroupId:@"second group" index:5]; 
	RadioButton *rb7 = [[RadioButton alloc] initWithGroupId:@"second group" index:6]; 
	rb5.frame = CGRectMake(29,514,22,22);
    rb6.frame = CGRectMake(29,544,22,22);
    rb7.frame = CGRectMake(29,575,22,22);
	rb5.tag=@"Compass指南者2.4L";
	rb6.tag=@"Compass指南者2.0L";
	rb7.tag=@"Compass指南者熏黑版";
	UILabel *label13 =[[UILabel alloc] initWithFrame:CGRectMake(50, 514, 200, 20)];
    label13.backgroundColor = [UIColor clearColor];
    label13.text = @"Compass指南者2.4L";
	[label13 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label13];
    [label13 release];
	
    UILabel *label14 =[[UILabel alloc] initWithFrame:CGRectMake(50, 544, 200, 20)];
    label14.backgroundColor = [UIColor clearColor];
    label14.text = @"Compass指南者2.0L";
	[label14 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label14];    
    [label14 release];
	
    UILabel *label15 =[[UILabel alloc] initWithFrame:CGRectMake(50, 574, 200, 20)];
    label15.backgroundColor = [UIColor clearColor];
    label15.text = @"Compass指南者熏黑版";
	[label15 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label15];
    [label15 release];

	
	
	UILabel *questionText3= [[UILabel alloc] initWithFrame:CGRectMake(29,604,300,20)];
    questionText3.backgroundColor = [UIColor clearColor];
    [questionText3 setAdjustsFontSizeToFitWidth:YES];
    questionText3.text = @"牧马人(Wrangler)";
	[questionText3 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.view  addSubview:questionText3];
	
	RadioButton *rb8 = [[RadioButton alloc] initWithGroupId:@"second group" index:7]; 
	RadioButton *rb9 = [[RadioButton alloc] initWithGroupId:@"second group" index:8]; 
	RadioButton *rb10 = [[RadioButton alloc] initWithGroupId:@"second group" index:9]; 
	RadioButton *rb11 = [[RadioButton alloc] initWithGroupId:@"second group" index:10]; 
	RadioButton *rb12 = [[RadioButton alloc] initWithGroupId:@"second group" index:11]; 
	RadioButton *rb13 = [[RadioButton alloc] initWithGroupId:@"second group" index:12]; 
	rb8.frame = CGRectMake(29,634,22,22);
    rb9.frame = CGRectMake(29,664,22,22);
    rb10.frame = CGRectMake(29,694,22,22);
	rb11.frame = CGRectMake(29,724,22,22);
	rb12.frame = CGRectMake(29,754,22,22);
    rb13.frame = CGRectMake(29,784,22,22);
	rb8.tag=@"2012牧马人Sahara两门款";
	rb9.tag=@"2012牧马人Sahara四门款";
	rb10.tag=@"2012牧马人Rubicon两门款";
	rb11.tag=@"2012牧马人Rubicon四门款";
	rb12.tag=@"2012牧马人极地版";
	rb13.tag=@"2012牧马人梦十珍藏版";
	UILabel *label16 =[[UILabel alloc] initWithFrame:CGRectMake(50, 634, 200, 20)];
    label16.backgroundColor = [UIColor clearColor];
    label16.text = @"2012牧马人Sahara两门款";
	[label16 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label16];
    [label16 release];
	
    UILabel *label17 =[[UILabel alloc] initWithFrame:CGRectMake(50, 664, 200, 20)];
    label17.backgroundColor = [UIColor clearColor];
    label17.text = @"2012牧马人Sahara四门款";
	[label17 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label17];    
    [label17 release];
	
    UILabel *label18 =[[UILabel alloc] initWithFrame:CGRectMake(50, 694, 200, 20)];
    label18.backgroundColor = [UIColor clearColor];
    label18.text = @"2012牧马人Rubicon两门款";
	[label18 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label18];
    [label18 release];
	
	UILabel *label19=[[UILabel alloc] initWithFrame:CGRectMake(50, 724, 200, 20)];
    label19.backgroundColor = [UIColor clearColor];
    label19.text = @"2012牧马人Rubicon四门款";
	[label19 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label19];
    [label19 release];
	UILabel *label20=[[UILabel alloc] initWithFrame:CGRectMake(50, 754, 200, 20)];
    label20.backgroundColor = [UIColor clearColor];
    label20.text = @"2012牧马人极地版";
	[label20 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label20];
    [label20 release];
	
    UILabel *label21 =[[UILabel alloc] initWithFrame:CGRectMake(50, 784, 200, 20)];
    label21.backgroundColor = [UIColor clearColor];
    label21.text = @"2012牧马人梦十珍藏版";
	[label21 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label21];    
    [label21 release];
	
   	
	
	UILabel *questionText4 = [[UILabel alloc] initWithFrame:CGRectMake(29,814,300,20)];
    questionText4.backgroundColor = [UIColor clearColor];
    [questionText4 setAdjustsFontSizeToFitWidth:YES];
    questionText4.text =@"自由客(Patriot)";
	
	[questionText4 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.view  addSubview:questionText4];	
	RadioButton *rb14= [[RadioButton alloc] initWithGroupId:@"second group" index:13]; 
	RadioButton *rb15 = [[RadioButton alloc] initWithGroupId:@"second group" index:14]; 
	RadioButton *rb16 = [[RadioButton alloc] initWithGroupId:@"second group" index:15]; 
	RadioButton *rb17 = [[RadioButton alloc] initWithGroupId:@"second group" index:16]; 
	rb14.frame = CGRectMake(29,834,22,22);
    rb15.frame = CGRectMake(29,864,22,22);
    rb16.frame = CGRectMake(29,894,22,22);
	rb17.frame = CGRectMake(29,924,22,22);
	rb14.tag=@"2012Jeep自由客";
	rb15.tag=@"2012Jeep自由客熏黑版";
	rb16.tag=@"2012 Chrysler300C";
	rb17.tag=@"2012 Chrysler大捷龙";
	UILabel *label22 =[[UILabel alloc] initWithFrame:CGRectMake(50, 834, 200, 20)];
    label22.backgroundColor = [UIColor clearColor];
    label22.text = @"2012Jeep自由客";
	[label22 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label22];
    [label22 release];
	
    UILabel *label23 =[[UILabel alloc] initWithFrame:CGRectMake(50, 864, 200, 20)];
    label23.backgroundColor = [UIColor clearColor];
    label23.text = @"2012Jeep自由客熏黑版";
	[label23 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label23];    
    [label23 release];
	
    UILabel *label24 =[[UILabel alloc] initWithFrame:CGRectMake(50, 894, 200, 20)];
    label24.backgroundColor = [UIColor clearColor];
    label24.text = @"2012 Chrysler300C";
	[label24 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label24];
    [label24 release];
	
	UILabel *label25 =[[UILabel alloc] initWithFrame:CGRectMake(50, 924, 200, 20)];
    label25.backgroundColor = [UIColor clearColor];
    label25.text = @"2012 Chrysler大捷龙";
	[label25 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label25];
    [label25 release];
	
	
	
    [self.view addSubview:rb1];
    [self.view addSubview:rb2];
    [self.view addSubview:rb3];
	[self.view addSubview:rb4];
    [self.view addSubview:rb5];
    [self.view addSubview:rb6];
	[self.view addSubview:rb7];
    [self.view addSubview:rb8];
	[self.view addSubview:rb9];
    [self.view addSubview:rb10];
    [self.view addSubview:rb11];
	[self.view addSubview:rb12];
    [self.view addSubview:rb13];
    [self.view addSubview:rb14];
	[self.view addSubview:rb15];
    [self.view addSubview:rb16];
	[self.view addSubview:rb17];

	
    [rb1 release];
    [rb2 release];
    [rb3 release];
    [rb4 release];
    [rb5 release];
    [rb6 release];
    [rb7 release];
    [rb8 release];
	[rb9 release];
    [rb11 release];
    [rb12 release];
    [rb13 release];
    [rb14 release];
    [rb15 release];
    [rb16 release];
    [rb17 release];
    [rb10 release];
	
	UILabel *questionText5 = [[UILabel alloc] initWithFrame:CGRectMake(29,954,300,20)];
    questionText5.backgroundColor = [UIColor clearColor];
    [questionText5 setAdjustsFontSizeToFitWidth:YES];
    questionText5.text =@"Q3.经销商";
	
	[questionText5 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.view  addSubview:questionText5];	
	UIButton *submitSaveBtn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitSaveBtn1.frame = CGRectMake(100, 954, 200, 19);
    [submitSaveBtn1 setTitle:@"请选择      " forState:UIControlStateNormal];
	[submitSaveBtn1 setBackgroundImage:[UIImage imageNamed:@"channeldbdetail_spinner_normal.png"] 
							 forState:UIControlStateNormal];
    [submitSaveBtn1 addTarget:self action:@selector(cbxclickCompney:) forControlEvents:UIControlEventTouchUpInside];
    cbxcompony=submitSaveBtn1;
	[self.view addSubview:cbxcompony];
	//[submitSaveBtn1 release];
	
	UILabel *questionText6= [[UILabel alloc] initWithFrame:CGRectMake(29,984,300,20)];
    questionText6.backgroundColor = [UIColor clearColor];
    [questionText6 setAdjustsFontSizeToFitWidth:YES];
    questionText6.text =@"允许克莱斯勒(中国)授权经销商";
	
	[questionText6 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.view  addSubview:questionText6];
	UILabel *questionText7= [[UILabel alloc] initWithFrame:CGRectMake(29,998,300,20)];
    questionText7.backgroundColor = [UIColor clearColor];
    [questionText7 setAdjustsFontSizeToFitWidth:YES];
    questionText7.text =@"销售与我联系:";
	
	[questionText7 setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [self.view  addSubview:questionText7];	
	
	RadioButton *rb18= [[RadioButton alloc] initWithGroupId:@"threed group" index:0]; 
	RadioButton *rb19 = [[RadioButton alloc] initWithGroupId:@"threed group" index:1]; 
	
	rb18.frame = CGRectMake(29,1024,22,22);
    rb19.frame = CGRectMake(100,1024,22,22);
	rb18.tag=1;
	rb19.tag=0;
	
	UILabel *label26 =[[UILabel alloc] initWithFrame:CGRectMake(50, 1024, 200, 20)];
    label26.backgroundColor = [UIColor clearColor];
    label26.text = @"是";
	[label26 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label26];
    [label26 release];
	
	UILabel *label27 =[[UILabel alloc] initWithFrame:CGRectMake(121, 1024, 200, 20)];
    label27.backgroundColor = [UIColor clearColor];
    label27.text = @"否";
	[label27 setFont:[UIFont fontWithName:@"Helvetica" size:13]];
    [self.view addSubview:label27];
    [label27 release];
	[self.view addSubview:rb18];
	[self.view addSubview:rb19];
	
	
    [rb18 release];
    [rb19 release];
    [RadioButton addObserverForGroupId:@"first group" observer:self];
	[RadioButton addObserverForGroupId:@"second group" observer:self];
	[RadioButton addObserverForGroupId:@"threed group" observer:self];
	[RadioButton addObserverForGroupId:@"Four group" observer:self];
	
	UIButton *submitSaveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitSaveBtn.frame = CGRectMake(40, 1054, 100, 40);
    [submitSaveBtn setTitle:@"暂存" forState:UIControlStateNormal];
    [submitSaveBtn addTarget:self action:@selector(submitSave:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitSaveBtn];
	//[submitSaveBtn release];
	UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitBtn.frame = CGRectMake(180, 1054, 100, 40);
    [submitBtn setTitle:@"上传" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
	//[submitBtn release];
	
	 dic = [[NSMutableDictionary alloc] initWithCapacity:30];
   
}

-(void)submitClick:(id)sender
{
    NSLog(@"dic=%@",self.dic);
    
    UILabel *resultLbl =[[UILabel alloc] initWithFrame:CGRectMake(40, 340, 240, 30)];
    resultLbl.backgroundColor = [UIColor whiteColor];
    resultLbl.textColor = [UIColor redColor];
    NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:16];
    
    for (NSString *str in [self.dic allValues]) {
        [resultStr appendFormat:@" %@,",str];
    }
    resultLbl.text = resultStr;
    [self.view addSubview:resultLbl];
    [resultLbl release];
    [resultStr release];
}
-(void)submitSave:(id)sender
{
    NSLog(@"dic=%@",self.dic);
    
    UILabel *resultLbl =[[UILabel alloc] initWithFrame:CGRectMake(40, 340, 240, 30)];
    resultLbl.backgroundColor = [UIColor whiteColor];
    resultLbl.textColor = [UIColor redColor];
    NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:16];
    
    for (NSString *str in [self.dic allValues]) {
        [resultStr appendFormat:@" %@,",str];
    }
    resultLbl.text = resultStr;
    [self.view addSubview:resultLbl];
    [resultLbl release];
    [resultStr release];
}
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    [dic setObject:[NSString stringWithFormat:@"%d",index+1] forKey:groupId];
}
-(IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}
-(IBAction)backgroundTap:(id)sender
{
	
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
	dic=nil;
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[dic release];
    [super dealloc];
}
-(IBAction)cbxclickProvince
{
		self.pickertype=1;
	
	NSArray *array=[[NSArray alloc]initWithObjects:
					@"大众",@"奔驰",@"宝马",@"保时捷",@"jeep",@"马自达",nil];
	self.pickerData=array;
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.hidden=NO;
	
	
	self.pickerData=array;
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.picker.frame = CGRectMake(0, 245, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}
-(IBAction)cbxclickCity
{
	self.pickertype=2;
	
	NSArray *array=[[NSArray alloc]initWithObjects:
					@"大众",@"奔驰",@"宝马",@"保时捷",@"jeep",@"马自达",nil];
	self.pickerData=array;
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.hidden=NO;
	
	
	self.pickerData=array;
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.picker.frame = CGRectMake(0, 245, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}
-(void)cbxclickCompney:(id)sender
{
	self.pickertype=3;
	
	NSArray *array=[[NSArray alloc]initWithObjects:
					@"大众",@"奔驰",@"宝马",@"保时捷",@"jeep",@"马自达",nil];
	self.pickerData=array;
	CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.hidden=NO;
	
	
	self.pickerData=array;
	[self.picker selectRow:0 inComponent:kdid animated:YES];
	
	[self.picker reloadComponent:kdid];
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.picker.frame = CGRectMake(0, 245, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
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
	if (self.pickertype==1) {
	 	cbxprovince.titleLabel.text=selected;
	}
	else if(self.pickertype==2)
	{
		 cbxcity.titleLabel.text=selected;
	}
	else
	{
		cbxcompony.titleLabel.text=selected;
	}
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
	self.picker.frame = CGRectMake(0, 480, 320, 260);
	self.picker.hidden=YES;
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

@end
