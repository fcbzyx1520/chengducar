#import "DropDown.h"
@implementation DropDown1
@synthesize tv;
@synthesize tableArray;
@synthesize textField;
-(void)dealloc
{
	[tv release];
	[tableArray release];
	[textField release];
	[super dealloc];
}
-(id)initWithFrame:(CGRect)frame
{
  if(frame.size.height<200)
  {
	  frameHeight=200;
  }
	else
	{
		frameHeight=frame.size.height;
	}
	tableheight=frameHeight-30;
	frame.size.height=30.0f;
	self=[super initWithFrame:frame];
	if(self)
	{
		showList=NO;
		tv=[[UITableView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width,0)];
		tv.delegate=self;
		tv.dataSource=self;
		tv.backgroundColor=[UIColor grayColor];
		tv.separatorColor=[UIColor lightGrayColor];
		tv.hidden=YES;
		[self addSubview:tv];
		
		textField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width,0)];
		textField.borderStyle=UITextBorderStyleRoundedRect;
		[textField addTarget:self action:@selector(dropdown) forControlEvents:UIControlEventAllTouchEvents];
		[self addSubview:textField]; 
	}
	return self;
}
-(void)dropdown
{
	[textField resignFirstResponder];
	if(showList)
	{
		return;
	}
	else {
		CGRect sf=self.frame;
		sf.size.height=frameHeight;
		[self.superview bringSubviewToFront:self];
		tv.hidden=NO;
		showList=YES;
		
		CGRect frame=tv.frame;
		frame.size.height=0;
		tv.frame=frame;
		frame.size.height=tableheight;
		[UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		self.frame=sf;
		tv.frame=frame;
		[UIView commitAnimations];
	}

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView
   numberOfRowsInSection:(NSInteger)section
{
	return [tableArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView 
   cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier=@"Cell";
	UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if(cell==nil)
	{
		cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									reuseIdentifier:cellIdentifier] autorelease];
	}
	cell.textLabel.text=[tableArray objectAtIndex:[indexPath row]];
	cell.textLabel.font=[UIFont systemFontOfSize:16.0f];
	cell.accessoryType=UITableViewCellAccessoryNone;
	cell.selectionStyle=UITableViewCellSelectionStyleGray;
	return cell;
}
-(CGFloat)tableView:(UITableView *)
   heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 35;
}
-(void)tableView:(UITableView *)tableView 
   didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	textField.text=[tableArray objectAtIndex:[indexPath row]];
	showList=NO;
	tv.hidden=YES;
	CGRect sf=self.frame;
	sf.size.height=30;
	self.frame=sf;
	CGRect frame=tv.frame;
	frame.size.height=0;
	tv.frame=frame;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation==UIInterfaceOrientationPortrait);
}
@end
