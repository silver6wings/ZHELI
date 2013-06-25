#import "ContactPageTableItem.h"

@implementation ContactPageTableItem

@synthesize strUserName,
            strUserCompany,
            strUserArea,
            strUserCareer,
            strContactNum,
            strContactInterSectionNum,
            strDistance,
            strTime;

///////////////////////////////////////////////////////////////////////////////////////////////////  

+ (id)itemWithText:text
          imageURL:(NSString *)imageURL 
      defaultImage:(UIImage *)defaultImage 
        imageStyle:(TTStyle *)imageStyle 
          userName:(NSString *)strUserName 
       userCompany:(NSString *)strUserCompany 
          userArea:(NSString *)strUserArea 
        userCareer:(NSString *)strUserCareer 
        contactNum:(NSString *)strContactNum 
contactInterSectionNum:(NSString *)strContactInterSectionNum 
          distance:(NSString *)strDistance 
              time:(NSString *)strTime 
               URL:(NSString *)url{
    
    ContactPageTableItem * item = [[[self alloc] init] autorelease];
    
    item.imageURL = imageURL;
    item.defaultImage = defaultImage;
    item.imageStyle = imageStyle;
    
    item.strUserName = strUserName;
    item.strUserCompany = strUserCompany;
    item.strUserArea = strUserArea;
    item.strUserCareer = strUserCareer;
    item.strContactNum = strContactNum;
    item.strContactInterSectionNum = strContactInterSectionNum;
    item.strDistance = strDistance;
    item.strTime = strTime;
    
    item.URL = url;
    
    return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (id)init{
    if ((self = [super init])) {}
    return self;
}

- (void)dealloc {  
    TT_RELEASE_SAFELY(strUserName);  
    TT_RELEASE_SAFELY(strUserCompany);  
    TT_RELEASE_SAFELY(strUserArea);
    TT_RELEASE_SAFELY(strUserCareer); 
    TT_RELEASE_SAFELY(strContactNum);
    TT_RELEASE_SAFELY(strContactInterSectionNum);
    TT_RELEASE_SAFELY(strDistance); 
    TT_RELEASE_SAFELY(strTime);
    [super dealloc];  
}  

@end
