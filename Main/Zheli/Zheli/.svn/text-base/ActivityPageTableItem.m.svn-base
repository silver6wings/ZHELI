#import "ActivityPageTableItem.h"

@implementation ActivityPageTableItem

@synthesize strActivityCompany,
            strActivityName,
            strActivityLocation,
            strActivityDate,
            strActivityTime,
            strActivityMembers;

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
               URL:(NSString *)url
{
    ActivityPageTableItem * item = [[self alloc] init];
    
    item.text = @"";
    item.imageURL = imageURL;
    item.defaultImage = defaultImage;
    item.imageStyle = imageStyle;
    item.strActivityCompany = strActivityCompany;
    item.strActivityName = strActivityName;
    item.strActivityLocation = strActivityLocation;
    item.strActivityDate = strActivityDate;
    item.strActivityTime = strActivityTime;
    item.strActivityMembers = strActivityMembers;
    item.URL = url;
    
    return item; 
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)dealloc {  
    TT_RELEASE_SAFELY(strActivityCompany);
    TT_RELEASE_SAFELY(strActivityName);
    TT_RELEASE_SAFELY(strActivityLocation);
    TT_RELEASE_SAFELY(strActivityDate);
    TT_RELEASE_SAFELY(strActivityTime);
    TT_RELEASE_SAFELY(imageIcon);
    TT_RELEASE_SAFELY(strActivityMembers);
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////  
// NSCoding  

//- (id)initWithCoder:(NSCoder*)decoder {  
//    if (self = [super initWithCoder:decoder]) {  
//        self.strActivityCompany = [decoder decodeObjectForKey:@"strActivityCompany"];  
//        self.strActivityTitle = [decoder decodeObjectForKey:@"strActivityTitle"];  
//        self.strActivityInfo = [decoder decodeObjectForKey:@"strActivityInfo"]; 
//        self.strActivityTime = [decoder decodeObjectForKey:@"strActivityTime"];
//        self.strActivityAddr = [decoder decodeObjectForKey:@"strActivityAddr"];
//    }  
//    return self;  
//}  
//
//- (void)encodeWithCoder:(NSCoder*)encoder {  
//    [super encodeWithCoder:encoder];  
//    if (self.strActivityCompany) {  
//        [encoder encodeObject:self.strActivityCompany forKey:@"strActivityCompany"];  
//    }  
//    if (self.strActivityTitle) {  
//        [encoder encodeObject:self.strActivityTitle forKey:@"strActivityTitle"];  
//    }  
//    if (self.strActivityInfo) {  
//        [encoder encodeObject:self.strActivityInfo forKey:@"strActivityInfo"];  
//    } 
//    if (self.strActivityTime) {  
//        [encoder encodeObject:self.strActivityTime forKey:@"strActivityTime"];  
//    }
//    if (self.strActivityAddr) {  
//        [encoder encodeObject:self.strActivityAddr forKey:@"strActivityAddr"];  
//    } 
//}  

@end
