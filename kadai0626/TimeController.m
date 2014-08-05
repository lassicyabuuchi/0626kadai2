#import "TimeController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeNow;
- (void)onTime:(NSTimer*)timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(onTime:)
                                                    userInfo:nil
                                                     repeats:YES];
    [self onTime:timer ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)onTime:(NSTimer*)timer {
    //現在時刻取得
    NSDateFormatter *formatter = [NSDateFormatter new];
    
    [formatter setDateFormat:@"HH:mm:ss"];
    NSDate* now = [NSDate date];
    self.timeNow.text = [formatter stringFromDate:now];
}

@end
