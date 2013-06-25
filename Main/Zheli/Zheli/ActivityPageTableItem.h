#import <Three20/Three20.h>

@interface ActivityPageTableItem : TTTableImageItem
{
    NSString * strActivityCompany;
    NSString * strActivityName;
    NSString * strActivityLocation;
    NSString * strActivityDate;
    NSString * strActivityTime;
    UIImage * imageIcon;
    NSString * strActivityMembers;
}

@property(nonatomic,copy) NSString * strActivityCompany;  
@property(nonatomic,copy) NSString * strActivityName;  
@property(nonatomic,copy) NSString * strActivityLocation; 
@property(nonatomic,copy) NSString * strActivityDate; 
@property(nonatomic,copy) NSString * strActivityTime;
@property(nonatomic,copy) NSString * strActivityMembers;

+ (id)itemWithText:(NSString *)text 
          imageURL:(NSString *)imageURL
      defaultImage:(UIImage *)defaultImage
        imageStyle:(TTStyle *)imageStyle
           company:(NSString *)strActivityCompany
              name:(NSString *)strActivityName 
          location:(NSString *)strActivityLocation 
              date:(NSString *)strActivityDate
              time:(NSString *)strActivityTime 
           members:(NSString *)strActivityMembers
               URL:(NSString *)url;

@end
