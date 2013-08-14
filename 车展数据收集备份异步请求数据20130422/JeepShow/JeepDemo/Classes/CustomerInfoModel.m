//
//  CustomerInfoModel.m
//  JeepDemo
//
//  Created by fu on 12-11-12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerInfoModel.h"


@implementation CustomerInfoModel
//@synthesize namec;
//@synthesize sexc;
//@synthesize phone;
//@synthesize email;
//@synthesize idc;
//@synthesize provien;
//@synthesize city;
//@synthesize Q1time;
//@synthesize Q2jeep;
//@synthesize Q3Compony;
//@synthesize iskeyi;
//@synthesize chezhu;
-(id)init
{
	self=[super init];
	if(self)
	{
		
	}
	return self;
}
-(void)setValueforName:(NSString *)value
{
	namec=value;
}
-(void)setValueforSex:(NSString *)value
{
	sexc=value;
}
-(void)setValueforPhone:(NSString *)value
{
	phone=value;
}
-(void)setValueforEmail:(NSString *)value
{
	email=value;
}
-(void)setValueforQ1:(NSString *)value
{
	Q1time=value;
}
-(void)setValueforQ2:(NSString *)value
{
	Q2jeep=value;
}
-(void)setValueforQ3:(NSString *)value
{
	Q3Compony=value;
}
-(void)setValueforIskeyi:(NSString *)value
{
	iskeyi=value;
}
-(void)setValueforCity:(NSString *)value
{
	city=value;
}

-(void)setValueforProvien:(NSString *)value
{
	provien=value;
}
-(void)setValueforIsupload:(NSInteger)value
{
	isupload=value;
}
-(void)setValueforChezhu:(NSString *)value
{
	chezhu=value;
}
-(void)setValueforCartype:(NSString *)value
{
	cartype=value;
}
-(void)setValueforId:(NSString *)value
{
	idc=value;
}
-(void)setValueforCreateTime:(NSString *)value
{
	createtime=value;
}
-(void)setIszancun:(NSInteger )value
{
    iszancun=value;
}
-(void)setValueforIssms:(NSString *)value
{
    issms=value;
}
-(void)setValueforCodeQR:(NSString *)value
{
    codeQR1=value;
}



-(NSInteger)GetValueforIszancun
{
    return iszancun;
}
-(NSString *)GetValueforCreateTime
{
	return createtime;
}
-(NSString *)GetValueforId
{
	return idc;
}
-(NSInteger)GetValueforIsupload
{
	return isupload;
}
-(NSString *)GetValueforChezhu
{
	return chezhu;
}
-(NSString *)GetValueforCarType
{
	return cartype;
}
-(NSString *)GetValueforName
{
	return namec;
}
-(NSString *)GetValueforEmail
{
	return email;
}
-(NSString *)GetValueforPhone
{
	return phone;
}
-(NSString *)GetValueforSex
{
	return sexc;
}
-(NSString *)GetValueforIskeyi
{
	return iskeyi;
}
-(NSString *)GetValueforCity
{
	return city;
}
-(NSString *)GetValueforProvien;
{
	return provien;
}
-(NSString *)GetValueforQ1;
{
	return Q1time;
}
-(NSString *)GetValueforQ2;
{
	return Q2jeep;
}
-(NSString *)GetValueforQ3;
{
	return Q3Compony;
}
-(NSString *)GetValueforIssms
{
    return issms;
}
-(NSString *)GetValueforCodeQR
{
    return codeQR1;
}
@end
