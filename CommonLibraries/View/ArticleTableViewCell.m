//
//  ArticleTableViewCell.m
//  HappyNewYear
//
//  Created by Yang on 2018/12/29.
//  Copyright © 2018年 HappyNewYear. All rights reserved.
//
#define KScreenWidth                [UIScreen mainScreen].bounds.size.width
#define KScreenHeight               [UIScreen mainScreen].bounds.size.height
#define FBSizeRatio(a)              ((a) * (KScreenWidth / 375.0))
#define kRealValue(with)            FBSizeRatio(with)
#import "SDAutoLayout.h"
#import "PhotosContainerView.h"
#import "ArticleTableViewCell.h"
@interface ArticleTableViewCell ()
@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)PhotosContainerView *photoContainer;

@property (nonatomic,strong)UIButton *button;

@end
@implementation ArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews{
    self.titleLabel=[[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.sd_layout
    .leftSpaceToView(self.contentView, kRealValue(15))
    .rightSpaceToView(self.contentView, kRealValue(15))
    .topSpaceToView(self.contentView, kRealValue(10))
    .autoHeightRatio(0);
    
    self.photoContainer=[[PhotosContainerView alloc] initWithMaxItemsCount:9];
    [self.contentView addSubview:self.photoContainer];
    self.photoContainer.sd_layout
    .leftEqualToView(self.titleLabel)
    .rightEqualToView(self.titleLabel)
    .topSpaceToView(self.titleLabel, kRealValue(10));
    
    self.button=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.button];
    [self.button setTitle:@"copy" forState:UIControlStateNormal];
    self.button.sd_layout
    .leftSpaceToView(self.contentView, kRealValue(15))
    .rightSpaceToView(self.contentView, kRealValue(15))
    .topSpaceToView(self.photoContainer, 10)
    .heightIs(kRealValue(40));
    
}
-(void)setModel:(ArticleModel *)model{
    _model=model;
    self.titleLabel.text=model.titleStr;
    self.photoContainer.photoNamesArray = model.imgList;
    if (model.imgList.count > 0) {
        self.photoContainer.hidden = NO;
       
    } else {
        self.photoContainer.hidden = YES;
    }
    [self setupAutoHeightWithBottomView:self.button bottomMargin:10];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
