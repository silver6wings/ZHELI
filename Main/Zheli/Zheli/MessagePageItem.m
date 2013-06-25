#import "MessagePageItem.h"

@implementation MessagePageItem

@synthesize strName,
            strContent;

///////////////////////////////////////////////////////////////////////////////////////////////////  

+ (id)itemWithText:(NSString *)text 
          imageURL:(NSString *)imageURL
      defaultImage:(UIImage *)defaultImage 
        imageStyle:(TTStyle *)imageStyle
              name:(NSString *)strName
           content:(NSString *)strContent
               URL:(NSString *)url{
    
    MessagePageItem * item = [[[self alloc] init] autorelease];
    
    item.imageURL = imageURL;
    item.defaultImage = defaultImage;
    item.imageStyle = imageStyle;
    
    item.strName = strName;
    item.strContent = strContent;
    
    item.URL = url;
    
    return item;
}

///////////////////////////////////////////////////////////////////////////////////////////////////  

- (id)init{
    if ((self = [super init])) {}
    return self;
}

- (void)dealloc {  
    TT_RELEASE_SAFELY(strName);  
    TT_RELEASE_SAFELY(strContent);  
    [super dealloc];  
}  

@end
