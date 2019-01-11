//
//  ViewController.m
//  CommonLibraries
//
//  Created by Yang on 2018/12/24.
//  Copyright © 2018年 Yang. All rights reserved.
//
#import <SDAutoLayout.h>
// MARK:- 屏幕高宽
#define KScreenWidth                [UIScreen mainScreen].bounds.size.width
#define KScreenHeight               [UIScreen mainScreen].bounds.size.height
#import <Masonry.h>
#import "ViewController.h"
//#import "ArticleTableViewCell.h"
#import "ArticleModel.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import <MJExtension.h>
@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIButton *redBtn;

@property (nonatomic,strong)dispatch_source_t timer;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
    UILabel *titleLabel=[[UILabel alloc] init];
    [self.view addSubview:titleLabel];
    titleLabel.sd_layout.leftEqualToView(self.view).rightEqualToView(self.view).topEqualToView(self.view).bottomEqualToView(self.view);
    titleLabel.text=@"拉伸屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少";
    titleLabel.backgroundColor=[UIColor orangeColor];
    **/
    
    self.redBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.redBtn];
    [self.redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-50);
        make.bottom.mas_equalTo(-60);
        make.width.and.height.mas_equalTo(60);
    }];
    /**
    self.redBtn.sd_layout
    .rightSpaceToView(self.view, 50)
    .bottomSpaceToView(self.view, 60)
    .heightIs(60)
    .widthIs(60);
    self.redBtn.layer.cornerRadius=30;
    [self.redBtn setBackgroundColor:[UIColor redColor]];
    [self.redBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 20, KScreenWidth, KScreenHeight-20) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"ArticleTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    self.dataArr=@[@{
                       @"titleStr":@"天地玄黄，宇宙洪荒。庶几中庸，劳谦谨敕。日月盈昃，辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"imgsrc.png",@"imgsrc.png",@"imgsrc.png",@"imgsrc.png",@"7",@"8"]
                       },@{
                       @"titleStr":@"孔怀兄弟，同气连枝。仁慈隐恻，造次弗离。天地玄黄，宇宙洪荒。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。日月盈昃，辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"imgsrc.png",@"imgsrc.png"]
                       },@{
                       @"titleStr":@"性静情逸，心动神疲。天地玄黄，宇宙洪荒。日月盈昃，弦歌酒宴，接杯举殇。辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"imgsrc.png",@"imgsrc.png",@"3",@"4",@"5",@"6",@"7",@"8"]
                       },@{
                       @"titleStr":@"坚持雅操，好爵自縻。两疏见机，渠荷的历，园莽抽条。解组谁逼。天地玄黄，宇宙洪荒。日月盈昃，辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"imgsrc.png",@"imgsrc.png",@"3"]
                       },@{
                       @"titleStr":@"背邙面洛，浮渭据泾。天地玄黄，宇宙洪荒弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。弦歌酒宴，接杯举殇。。日月盈昃，辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，游鹍独运，凌摩绛霄。玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"imgsrc.png",@"2",@"3",@"4",@"5",@"6",@"7",@"8"]
                       },@{
                       @"titleStr":@"府罗将相，路侠槐卿。天地玄黄，宇宙洪荒。日月盈昃，辰宿列张。弦歌酒宴，接杯举殇。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。云腾致雨，露结为霜。金生丽水，玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"imgsrc.png",@"2",@"7",@"8"]
                       },@{
                       @"titleStr":@"桓公匡合，济弱扶倾。盘溪伊尹，佐时阿衡。天地玄黄，宇宙洪荒。日月盈昃，辰宿列张。寒来暑往，秋收冬藏。闰余成岁，律吕调阳。弦歌酒宴，接杯举殇。云腾致雨，露结为霜。弦歌酒宴，接杯举殇。金生丽水，弦歌酒宴，接杯举殇。玉出昆冈。剑号巨阙，珠称夜光。",
                       @"imgList":@[@"1"]
                       }];
    self.dataArr=[ArticleModel mj_objectArrayWithKeyValuesArray:self.dataArr];
     
    **/
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSString *shareText = @"sharetitle";
    UIImage *shareImage = [UIImage imageNamed:@"167x167.png"];
    NSURL *shareURL = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSArray *activityItems = [[NSArray alloc] initWithObjects:shareText, shareImage, shareURL, nil];
    
    UIActivityViewController *vc = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    UIActivityViewControllerCompletionWithItemsHandler myBlock = ^(UIActivityType activityType, BOOL completed, NSArray *returnedItems, NSError *activityError) {
        NSLog(@"%@",activityType);
        if (completed) {
            NSLog(@"分享成功");
        } else {
            NSLog(@"分享失败");
        }
        [vc dismissViewControllerAnimated:YES completion:nil];
    };
    
    vc.completionWithItemsHandler = myBlock;
    
    [self presentViewController:vc animated:YES completion:nil];

}
/**
-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr=[NSArray array];
    }
    return _dataArr;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellID"];
    ArticleModel *model=self.dataArr[indexPath.row];
    cell.model=model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView fd_heightForCellWithIdentifier:@"cellID" configuration:^(ArticleTableViewCell *cell) {
        ArticleModel *model=self.dataArr[indexPath.row];
        cell.model=model;
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)buttonClicked:(UIButton *)btn{
    __block CGFloat leftW=KScreenWidth-120;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.001 * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        leftW-=0.1;
        [self.redBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftW);
        }];
    });
    dispatch_resume(timer);
    self.timer=timer;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_source_cancel(self.timer);
    });
    [UIView animateWithDuration:2.5 animations:^{
        
    }];
    
}
**/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
