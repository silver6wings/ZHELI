#import <Foundation/Foundation.h>
#import "SWUtils.h"

@interface SWString : NSObject

+ (NSString *)toString:(id)object;

+ (NSString *)nullString:(NSString *)str;

+ (BOOL)isEmpty:(NSString *)str;

@end
