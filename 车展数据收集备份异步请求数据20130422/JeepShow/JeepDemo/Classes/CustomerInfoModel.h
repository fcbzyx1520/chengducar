//
//  CustomerInfoModel.h
//  JeepDemo
//
//  Created by fu on 12-11-12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomerInfoModel : NSObject {

	NSString *namec;
	NSString *sexc;
	NSString *phone;
	NSString *email;
	NSString *idc;
	NSString *provien;
	NSString *city;
	NSString *Q1time;
	NSString *Q2jeep;
	NSString *Q3Compony;
	NSString *iskeyi;
    NSString *issms;
	
	NSInteger isupload;
	NSString *chezhu;
	NSString *cartype;
    NSString *codeQR1;
	NSString *createtime;
    NSInteger iszancun;
}
//@property (nonatomic,retain) NSString *namec;
//@property (nonatomic,retain) NSString *sexc;
//@property (nonatomic,retain) NSString *phone;
//@property (nonatomic,retain) NSString *email;
//@property (nonatomic,retain) NSString *idc;
//@property (nonatomic,retain) NSString *provien;
//@property (nonatomic,retain) NSString *city;
//@property (nonatomic,retain) NSString *Q1time;
//@property (nonatomic,retain) NSString *Q2jeep;
//@property (nonatomic,retain) NSString *chezhu;
@property (nonatomic,retain) NSString *Q3Compony;
 @property (nonatomic,retain) NSString *iskeyi;
-(void)setValueforName:(NSString *)value;
-(void)setValueforSex:(NSString *)value;
-(void)setValueforPhone:(NSString *)value;
-(void)setValueforEmail:(NSString *)value;
-(void)setValueforQ1:(NSString *)value;
-(void)setValueforQ2:(NSString *)value;
-(void)setValueforQ3:(NSString *)value;
-(void)setValueforIskeyi:(NSString *)value;
-(void)setValueforIssms:(NSString *)value;
-(void)setValueforCity:(NSString *)value;
-(void)setValueforProvien:(NSString *)value;
-(void)setValueforId:(NSString *)value;
-(void)setValueforIsupload:(NSInteger)value;
-(void)setValueforChezhu:(NSString *)value;
-(void)setValueforCartype:(NSString *)value;
-(void)setValueforCreateTime:(NSString *)value;
-(void)setValueforCodeQR:(NSString *)value;
-(void)setIszancun:(NSInteger )value;


-(NSString *)GetValueforCreateTime;
-(NSString *)GetValueforName;
-(NSString *)GetValueforEmail;
-(NSString *)GetValueforPhone;
-(NSString *)GetValueforSex;
-(NSString *)GetValueforIskeyi;
-(NSString *)GetValueforIssms;
-(NSString *)GetValueforCity;
-(NSString *)GetValueforProvien;
-(NSString *)GetValueforQ1;
-(NSString *)GetValueforQ2;
-(NSString *)GetValueforQ3;
-(NSString *)GetValueforId;
-(NSInteger)GetValueforIsupload;
-(NSInteger)GetValueforIszancun;
-(NSString *)GetValueforChezhu;
-(NSString *)GetValueforCarType;
-(NSString *)GetValueforCodeQR;
@end
