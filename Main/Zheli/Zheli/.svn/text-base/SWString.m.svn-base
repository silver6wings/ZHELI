#import "SWString.h"

@implementation SWString

+ (NSString *)toString:(id)object{
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    }else{
        NSString * temp = [NSString stringWithFormat:@"%@",object];
        return temp;
    }
}

+ (NSString *)nullString:(NSString *)str{
    NSString * ts = @"";
    if (str == nil){
        return ts;
    } else if (str == NULL){
        return ts;
    } else {
        str = SW_OBJ2STR(str);
        if ([str isEqualToString:@"<null>"]) {
            return ts;
        } else if ([str isEqualToString:@"(null)"]){
            return ts;
        } else if ([str isEqualToString:@""]){
            return ts;
        } else {
            return str;
        }
    }
}

+ (BOOL)isEmpty:(NSString *)str{
    str = SW_OBJ2STR(str);
    if ([str isEqualToString:@"<null>"]) {
        return YES;
    } else if ([str isEqualToString:@"(null)"]){
        return YES;
    } else if ([str isEqualToString:@""]){
        return YES;
    } else {
        return NO;
    }
}

@end
