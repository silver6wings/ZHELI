#import "FeedbackViewController.h"

@implementation FeedbackViewController

- (id)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)loadView{
    [super loadView];
    // ==== back button ====
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 55, 29)];
    [button1 addTarget:self 
                action:@selector(back:)
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btBack.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem * buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
}

- (IBAction)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
