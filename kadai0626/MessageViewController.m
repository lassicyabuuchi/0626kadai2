
#import "MessageViewController.h"

@interface MessageViewController ()
@property (nonatomic) IBOutlet UITextField *message;
@property (nonatomic) IBOutlet UIButton *send;
@property (nonatomic) GKSession *session;
@property (nonatomic) NSString *peerID;
@property (nonatomic) GKPeerPickerController *peerpickerController;

@end

@implementation MessageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.send addTarget:self action:@selector(sendMessage:) forControlEvents:UIControlEventTouchUpInside];
    
    GKPeerPickerController *picker = [GKPeerPickerController new];
    picker.delegate = self;
    picker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [picker show];
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    picker.delegate = nil;
}

- (IBAction)sendMessage:(id)sender
{
    if (self.session == nil) {
        NSLog(@"no connection");
        return;
	}
	NSString *inputmessage = self.message.text;
	NSData *data = [inputmessage dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    
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

- (void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context
{
    NSString *message = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

@end
