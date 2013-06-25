#define IP_TEST     @"http://172.16.95.241"
#define IP_LOCAL    @"http://127.0.0.1"

#define URL_LOCAL   @"http://local3.ujelly.org:8080/phone"
#define URL_DEV     @"http://test3.ujelly.org/phone"
#define URL_NEW     @"http://new.ujelly.org/phone"
#define URL_OLD     @"http://www.ujelly.cn/phone"

#define SW_URL      URL_OLD

#define SW_STRADD2(s1,s2)       [s1 stringByAppendingString:s2]
#define SW_STRADD3(s1,s2,s3)    [[s1 stringByAppendingString:s2] stringByAppendingString:s3]
#define SW_ENCODEURI(s1)        [s1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]

#define SW_OBJ2STR(s1)          [NSString stringWithFormat:@"%@",s1]
#define SW_NUM2STR(s1)          [NSString stringWithFormat:@"%d",s1]
#define SYSOUT(s1)              NSLog(@"%@",s1)

//#define SinaApp_APPKEY          @"2596289435" 
//#define SinaApp_APPSECRET       @"6a59f77387be4ce0fcc0c41cb8fedecf"

//#define SinaWeiBoSDKDemo_APPKey @"2596289435" //设置appkey
//#define SinaWeiBoSDKDemo_APPSecret @"6a59f77387be4ce0fcc0c41cb8fedecf"

//******* MD5 *******
#import <CommonCrypto/CommonDigest.h>
@interface NSString (md5)
-(NSString *) getMD5;
-(NSString *) getMD5lowcase;
@end

@implementation NSString (md5)
-(NSString *) getMD5{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString * hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return hash; 
}

-(NSString *) getMD5lowcase{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString * hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];  
}
@end
