#import <Three20/Three20.h>
#import "ContactPageTableItem.h"
#import "SWUtils.h"
#import "SWString.h"

@interface ContactPageTableItemCell : TTTableImageItemCell
{
    UILabel *userName;
    UILabel *userCompany;
    UILabel *userAreaAndUserCareer;
    
    UILabel *contactNum;
    UILabel *contactInterSectionNum;
    UILabel *distanceAndTime;
    
    UILabel *lbContact;
    UILabel *lbContactInterSection;
    
    UIImageView * iconContact;
    UIImageView * iconContactInterSection;
}

@property(nonatomic,copy) UILabel * userName;  
@property(nonatomic,copy) UILabel * userCompany;  
@property(nonatomic,copy) UILabel * userAreaAndUserCareer; 

@property(nonatomic,copy) UILabel * contactNum;
@property(nonatomic,copy) UILabel * contactInterSectionNum; 
@property(nonatomic,copy) UILabel * distanceAndTime;

@property(nonatomic,copy) UILabel * lbContact;
@property(nonatomic,copy) UILabel * lbContactInterSection;


@property(nonatomic,copy) UIImageView * iconContact;
@property(nonatomic,copy) UIImageView * iconContactInterSection;

@end
