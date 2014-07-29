
#import "CalendarViewController.h"
#import "CustomTableViewCell.h"

@interface TableViewController ()

@property(nonatomic)IBOutlet UITableViewCell *cell ;
@property(nonatomic)IBOutlet UIView *selected_bg_view;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

NSInteger year;
NSInteger month;
NSInteger day;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDateFormatter *format = [NSDateFormatter new];
    format.dateFormat = @"yyyy/MM/dd";
    
    // 現在日付を取得
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    // 年・月・日を取得
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    comps = [calendar components:flags fromDate:now];
    
    year = comps.year;
    month = comps.month;
    day = comps.day;
    
    // 曜日
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:now];
    
    //[TableView deselectRowAtlndexPath:[TableView indexPathForSelectedRow]animeated:YES];
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
    _cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (_cell == nil) {
        _cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    NSLocale *jalocale;
    jalocale = [[NSLocale alloc]initWithLocaleIdentifier:@"ja_JP"];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    // 年月日曜日を取得
    NSDate *now = [NSDate date];
    flags = NSYearCalendarUnit | NSMonthCalendarUnit |NSWeekdayCalendarUnit;
    comps = [calendar components:flags fromDate:now];
    comps.day = indexPath.row +1;
    
    //compsをNSDateFormatterに表示させるためにはNSDate型にする必要がある
    NSDate *date = [calendar dateFromComponents:comps];
    NSDateFormatter *format = [NSDateFormatter new];
    format.dateFormat = @"yyyy/MM/dd (E)";
    [format setLocale:jalocale];
    
    NSString *result = [format stringFromDate:date];
    
    //セル番号＋１＝日にち
    _cell.textLabel.text = result;//[NSString stringWithFormat:@"%d/%d/%d(%d)", year,month,day,weekday];
    
    return _cell;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if (cell == nil) {
//        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
//
//    NSLocale *jalocale;
//    jalocale = [[NSLocale alloc]initWithLocaleIdentifier:@"ja_JP"];
//
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger flags;
//    NSDateComponents *comps;
//
//    // 年月日曜日を取得
//    NSDate *now = [NSDate date];
//    flags = NSYearCalendarUnit | NSMonthCalendarUnit |NSWeekdayCalendarUnit;
//    comps = [calendar components:flags fromDate:now];
//    comps.day = indexPath.row +1;
//
//    //compsをNSDateFormatterに表示させるためにはNSDate型にする必要がある
//    NSDate *date = [calendar dateFromComponents:comps];
//    NSDateFormatter *format = [NSDateFormatter new];
//    format.dateFormat = @"yyyy/MM/dd (E)";
//    [format setLocale:jalocale];
//
//    NSString *result = [format stringFromDate:date];
//
//    //セル番号＋１＝日にち
//    cell.textLabel.text = result;//[NSString stringWithFormat:@"%d/%d/%d(%d)", year,month,day,weekday];
//
//    return cell;
//}

// セルが呼び出される直前の動作
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 現在日付を取得
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    comps = [calendar components:flags fromDate:now];
    //    comps.day = indexPath.row +1;
    
    NSInteger day;
    day = comps.day;
    
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
    _cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    _selected_bg_view = [[UIView alloc] initWithFrame:_cell.bounds];
    _cell.selectedBackgroundView = _selected_bg_view;
    
    return _cell;
}


// セルが選択された時に呼び出される
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択されたセルを取得
    _cell = [tableView cellForRowAtIndexPath:indexPath];
    
}

// セルの選択がはずれた時に呼び出される
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択がはずれたセルを取得
    _cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView reloadData];
    
}

@end
