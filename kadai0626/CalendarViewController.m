
#import "CalendarViewController.h"
#import "CustomTableViewCell.h"

@interface TableViewController ()

@property(nonatomic)IBOutlet UIView *selected_bg_view;
@property(nonatomic) NSInteger year;
@property(nonatomic) NSInteger month;
@property(nonatomic) NSInteger day;
@property(nonatomic) NSDate *now;

@end

@implementation TableViewController

UITableViewCell *cell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //現在日付を取得
    self.now = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
      return 31;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
 
    NSLocale *jalocale = [[NSLocale alloc]initWithLocaleIdentifier:@"ja_JP"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 年月日曜日を取得
    NSUInteger flags = NSYearCalendarUnit | NSMonthCalendarUnit |NSWeekdayCalendarUnit;
    NSDateComponents *comps = [calendar components:flags fromDate:self.now];
    comps.day = indexPath.row +1;
    
    NSDate *date = [calendar dateFromComponents:comps];
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy/MM/dd(E)"];
    [format setLocale:jalocale];
    
    NSString *result = [format stringFromDate:date];
    
    cell.textLabel.text = result; //セル番号＋１＝日にち
    
    return cell;
}


// セルが呼び出される直前の動作
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 現在日付を取得
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSUInteger flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *comps = [calendar components:flags fromDate:self.now];
    
    NSInteger date = indexPath.row + 1;
    
    if (date == comps.day) {
        cell.contentView.backgroundColor = [UIColor orangeColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    if (indexPath == [tableView indexPathForSelectedRow] ) {
        [cell setSelected:YES animated:YES];
    }
}


//選択したときのみ
- (UITableViewCell*)cell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    _selected_bg_view = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView = _selected_bg_view;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択されたセルを取得
    cell = [tableView cellForRowAtIndexPath:indexPath];    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択がはずれたセルを取得
    cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView reloadData];
    
}

@end
