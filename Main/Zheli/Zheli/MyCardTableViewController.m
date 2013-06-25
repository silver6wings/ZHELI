#import "MyCardTableViewController.h"

@implementation MyCardTableViewController

- (id)init {
    if ((self = [super init])) {    
        CardViewController * vcCard = [[CardViewController alloc] initWithCard:@"self" isFriend:@"SELF"];
        vcCard.view.frame = CGRectMake(0, 0, 320, 320);
        [self.view addSubview:vcCard.view];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)dealloc{
    [super dealloc];
}
    
- (void)loadView {   
    [super loadView];   
    
    //******* left button *******
    UIButton * button1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 29)];
    [button1 addTarget:self 
                action:@selector(finished:) 
      forControlEvents:UIControlEventTouchUpInside];
    [button1 setImage:[UIImage imageNamed:@"btComplete.png"] 
             forState:UIControlStateNormal];
    
    UIBarButtonItem *buttonItem1 = [[UIBarButtonItem alloc] initWithCustomView:button1];
    self.navigationItem.leftBarButtonItem = buttonItem1;
    [buttonItem1 release];
    [button1 release];
}


- (IBAction) finished:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}









@end
