
#import "MessageController.h"

@interface MessageController ()
@property (nonatomic) IBOutlet UITextField *message;
@property (nonatomic) IBOutlet UIButton *send;
@property (nonatomic) IBOutlet UITextView*receive; //ToDo ダイアログに変更

@property (nonatomic) GKSession* session;
@property (nonatomic) GKPeerPickerController* peerpickerController;
@property (nonatomic) NSString *peerID;

@end

@implementation MessageController

@synthesize session = session_;
@synthesize peerID = peerID_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_send addTarget:self action:@selector(sendText:) forControlEvents:UIControlEventTouchUpInside];
    
    GKPeerPickerController* picker = [GKPeerPickerController new];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [picker show];
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    picker.delegate = nil;
}

//メッセージ送信
- (IBAction)sendText:(id)sender
{
	if (self.session == nil) {
		NSLog(@"no connection");
		return;
	}
	NSString* inputmessage = self.message.text;
	NSData* data = [inputmessage dataUsingEncoding:NSUTF8StringEncoding];
	NSError* error = nil;
    
    [self.session sendData:data
				   toPeers:[NSArray arrayWithObject:self.peerID]
			  withDataMode:GKSendDataReliable
					 error:&error];
	if (error) {
		NSLog(@"%@", error);
	}
	self.message.text = @"";
}

- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    self.peerID = peerID;
    
	self.session = session;
	session.delegate = self;
	[session setDataReceiveHandler:self withContext:nil];
	picker.delegate = nil;
	[picker dismiss];
}

//メッセージ受信
- (void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context
{
    NSString* message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSString* text = [self.receive.text stringByAppendingFormat:@"\n%@", message];//  ToDo ダイアログに変更
    self.receive.text = text; //  ToDo ダイアログに変更
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
