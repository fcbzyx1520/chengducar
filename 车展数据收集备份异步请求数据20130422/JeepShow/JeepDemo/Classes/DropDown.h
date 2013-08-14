//
//  DropDown.h
//  JeepDemo
//
//  Created by fu on 12-11-10.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DropDown1 : UIView <UITableViewDelegate,UITableViewDataSource> {

	UITableView *tv;
	NSArray *tableArray;
	UITextField *textField;
	BOOL showList;
	CGFloat tableheight;
	CGFloat frameHeight;
}
@property (nonatomic,retain) UITableView *tv;
@property (nonatomic,retain) NSArray *tableArray;
@property (nonatomic,retain) UITextField *textField;
@end
