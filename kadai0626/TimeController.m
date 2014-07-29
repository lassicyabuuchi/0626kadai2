#import "TimeController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeNow;
- (void)onTime:(NSTimer*)timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(onTime:)
                                           userInfo:nil
                                            repeats:YES];
    //現在時刻取得
    NSDate* now = [NSDate date];
    NSDateFormatter *format = [NSDateFormatter new];
    format.dateFormat = @"HH:mm:ss";
    self.timeNow.text = [format stringFromDate:now];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)onTime:(NSTimer*)timer {
    //現在時刻取得
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"HH:mm:ss";
    
    NSDate* now = [NSDate date];
    self.timeNow.text = [format stringFromDate:now];    
}

@end
