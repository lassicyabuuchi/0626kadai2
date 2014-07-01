//
//  TableViewController.m
//  kadai0626
//
//  Created by yabuuchi on 2014/06/26.
//  Copyright (c) 2014年 mycompany. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

UITableViewCell *cell;
UIView *selected_bg_view;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy/MM/dd";
    
    // 現在日付を取得
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags;
    NSDateComponents *comps;
    
    // 年・月・日を取得
    flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    comps = [calendar components:flags fromDate:now];
    
    NSInteger year = comps.year;
    NSInteger month = comps.month;
    NSInteger day = comps.day;
    
    NSString *result = [fmt stringFromDate:now];
    NSLog(@"%@",result);
    NSLog(@"%ld年 %ld月 %ld日", year, month, day);
    
    // 曜日
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:now];
    NSInteger weekday = comps.weekday; // 曜日(1が日曜日 7が土曜日)
    NSLog(@"曜日: %ld", weekday);
    
    //[TableView deselectRowAtlndexPath:[TableView indexPathForSelectedRow]animeated:YES];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
    //セル番号＋１＝日にち
    cell.textLabel.text = [NSString stringWithFormat:@"2014/6/%d", indexPath.row + 1];
    
//    NSString *wd;
//    int week = indexPath.row +1;
//    switch (week) {
//        case 1:{
//            wd = @"日";
//            break;
//        }
//        case 2:{
//            wd = @"月";
//        }
//        case 3:{
//            wd = @"火";
//        }
//        default:
//            break;
//    }
//    cell.textLabel.text = [NSString stringWithFormat:@"（%@）",wd];
    
    
//    for (indexPath.row=0; indexPath.row>31; indexPath.row++) {
//        
//    }
    
//    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    UIView *selected_bg_view = [[UIView alloc] initWithFrame:cell.bounds];
//    selected_bg_view.backgroundColor = [UIColor redColor];
//    cell.selectedBackgroundView = selected_bg_view;
//   
    
    return cell;
}


// セルが呼び出される直前の動作
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //背景色、文字色をもとに戻す
    cell.textLabel.textColor = [UIColor blackColor];
    cell.backgroundColor = [UIColor whiteColor];
    
}


//選択したときのみ
- (UITableViewCell*)cell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    selected_bg_view = [[UIView alloc] initWithFrame:cell.bounds];
    selected_bg_view.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = selected_bg_view;
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}




// セルが選択された時に呼び出される
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択されたセルを取得
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor whiteColor];
    //cell.backgroundColor = [UIColor greenColor];
    
}

// セルの選択がはずれた時に呼び出される
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 選択がはずれたセルを取得
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor blackColor];
    //cell.backgroundColor = [UIColor whiteColor];
}






/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
