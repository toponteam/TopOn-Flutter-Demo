//
//  ATNativeSelfRenderView.m
//  AnyThinkSDKDemo
//
//  Created by GUO PENG on 2022/5/7.
//  Copyright © 2022 AnyThink. All rights reserved.
//

#import "ATFNativeSelfRenderView.h"
#import <Masonry/Masonry.h>
//#import <SDWebImage/SDWebImage.h>
#import <AnyThinkSDK/ATImageLoader.h>
#import "ATFNativeAttributeMode.h"
#import "ATFDisposeDataTool.h"
#import "ATFConfiguration.h"
#import "ATFCommonTool.h"


@interface ATFNativeSelfRenderView()

@property (nonatomic, strong) NSDictionary *extraDic;

@property(nonatomic, strong) ATNativeAdOffer *nativeAdOffer;
@property(nonatomic, strong) ATFNativeAttributeMode *parentMode;
@property(nonatomic, strong) ATFNativeAttributeMode *appIconMode;
@property(nonatomic, strong) ATFNativeAttributeMode *mainImageMode;
@property(nonatomic, strong) ATFNativeAttributeMode *mainTitleMode;
@property(nonatomic, strong) ATFNativeAttributeMode *descMode;
@property(nonatomic, strong) ATFNativeAttributeMode *adLogoMode;
@property(nonatomic, strong) ATFNativeAttributeMode *ctaMode;
@property(nonatomic, strong) ATFNativeAttributeMode *dislikeMode;
@end


@implementation ATFNativeSelfRenderView

- (instancetype) initWithOffer:(ATNativeAdOffer *)offer{

    if (self = [super init]) {
        
        _nativeAdOffer = offer;
        [self addView];
        [self setupUI];
    }
    return self;
}

- (void)updateUIWithoffer:(ATNativeAdOffer *)offer{
    self.nativeAdOffer = offer;
    [self setupUI];
}
- (void)setUIWidget:(NSDictionary *)extraDic {
    self.extraDic = extraDic;
    [self setMode];
    [self setViewValue];
    [self setViewLayout];
}

- (void)setMode{
    
    self.parentMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:Parent];
    
    self.mainImageMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:MainImage];
    
    self.appIconMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:AppIcon];
    
    self.mainTitleMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:MainTitle];
    
    self.descMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:Desc];
    self.adLogoMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:AdLogo];

    self.ctaMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:Cta];
    
    self.dislikeMode = [ATFDisposeDataTool disposeNativeData:self.extraDic keyStr:Dislike];
}

- (void)setViewValue{
    
    self.backgroundColor =  [ATFCommonTool colorWithHexString:self.parentMode.backgroundColorStr];
    _iconImageView.backgroundColor = [ATFCommonTool colorWithHexString:self.adLogoMode.backgroundColorStr];
    _mainImageView.backgroundColor = [ATFCommonTool colorWithHexString:self.mainImageMode.backgroundColorStr];
    _dislikeButton.backgroundColor = [ATFCommonTool colorWithHexString:self.dislikeMode.backgroundColorStr];

    
    
    _titleLabel.font = [UIFont boldSystemFontOfSize:self.mainTitleMode.textSize];
    _titleLabel.textColor = [ATFCommonTool colorWithHexString:self.mainTitleMode.textColorStr];
    _titleLabel.backgroundColor =  [ATFCommonTool colorWithHexString:self.mainTitleMode.backgroundColorStr];
    _titleLabel.textAlignment = [self setLabelTextAlignment:self.mainTitleMode.textAlignmentStr];
    
    _textLabel.font = [UIFont systemFontOfSize:self.descMode.textSize];
    _textLabel.textColor = [ATFCommonTool colorWithHexString:self.descMode.textColorStr];
    _textLabel.backgroundColor =  [ATFCommonTool colorWithHexString:self.descMode.backgroundColorStr];
    _textLabel.textAlignment = [self setLabelTextAlignment:self.descMode.textAlignmentStr];

    
    _ctaLabel.font = [UIFont systemFontOfSize:self.ctaMode.textSize];
    _ctaLabel.textColor = [ATFCommonTool colorWithHexString:self.ctaMode.textColorStr];
    _ctaLabel.backgroundColor =  [ATFCommonTool colorWithHexString:self.ctaMode.backgroundColorStr];
    _ctaLabel.textAlignment = [self setLabelTextAlignment:self.ctaMode.textAlignmentStr];
}

- (NSTextAlignment)setLabelTextAlignment:(NSString *)textAlignmentStr {

    if ([textAlignmentStr isEqualToString:@"left"]) {
        return NSTextAlignmentLeft;
    } else if ([textAlignmentStr isEqualToString:@"center"]) {
        return NSTextAlignmentCenter;
    } else if ([textAlignmentStr isEqualToString:@"right"]) {
        return NSTextAlignmentRight;
    } else {
        return NSTextAlignmentLeft;
    }
}

- (void)setViewLayout{
    _iconImageView.frame = [self getRect:self.appIconMode];
    _dislikeButton.frame = [self getRect:self.dislikeMode];
    _titleLabel.frame = [self getRect:self.mainTitleMode];
    _textLabel.frame = [self getRect:self.descMode];
    _ctaLabel.frame = [self getRect:self.ctaMode];
    _logoImageView.frame = [self getRect:self.adLogoMode];
    _mainImageView.frame = [self getRect:self.mainImageMode];
    self.mediaView.frame = _mainImageView.frame;
}

- (CGRect)getRect:(ATFNativeAttributeMode *)mode{
    CGRect rect = CGRectMake(mode.x, mode.y, mode.width,mode.height);
    return rect;
}

- (void)setIconImageView:(UIImageView *)iconImageView {
    _iconImageView = iconImageView;
}

- (void)addView{
    
    self.advertiserLabel = [[UILabel alloc]init];
    self.advertiserLabel.font = [UIFont boldSystemFontOfSize:15.0f];
    self.advertiserLabel.textColor = [UIColor blackColor];
    self.advertiserLabel.textAlignment = NSTextAlignmentLeft;
    self.advertiserLabel.userInteractionEnabled = YES;
    [self addSubview:self.advertiserLabel];
        
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.userInteractionEnabled = YES;

    [self addSubview:self.titleLabel];
    
    self.textLabel = [[UILabel alloc]init];
    self.textLabel.font = [UIFont systemFontOfSize:15.0f];
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.userInteractionEnabled = YES;

    [self addSubview:self.textLabel];
    
    self.ctaLabel = [[UILabel alloc]init];
    self.ctaLabel.font = [UIFont systemFontOfSize:15.0f];
    self.ctaLabel.textColor = [UIColor blackColor];
    self.ctaLabel.userInteractionEnabled = YES;

    [self addSubview:self.ctaLabel];

    self.ratingLabel = [[UILabel alloc]init];
    self.ratingLabel.font = [UIFont systemFontOfSize:15.0f];
    self.ratingLabel.textColor = [UIColor blackColor];
    self.ratingLabel.userInteractionEnabled = YES;

    [self addSubview:self.ratingLabel];
    
    self.iconImageView = [[UIImageView alloc]init];
    self.iconImageView.layer.cornerRadius = 4.0f;
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconImageView.userInteractionEnabled = YES;
    [self addSubview:self.iconImageView];
    
    
    self.mainImageView = [[UIImageView alloc]init];
    self.mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.mainImageView.userInteractionEnabled = YES;
    [self addSubview:self.mainImageView];
    
    self.logoImageView = [[UIImageView alloc]init];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.logoImageView.userInteractionEnabled = YES;

    [self addSubview:self.logoImageView];
    
    self.sponsorImageView = [[UIImageView alloc]init];
    self.sponsorImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.sponsorImageView.userInteractionEnabled = YES;

    [self addSubview:self.sponsorImageView];
    
    self.dislikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *closeImg = [UIImage imageNamed:@"icon_webview_close" inBundle:[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AnyThinkSDK" ofType:@"bundle"]] compatibleWithTraitCollection:nil];
    
    [self.dislikeButton setImage:closeImg forState:0];
    [self addSubview:self.dislikeButton];
}

- (void)setupUI{
    
    if (self.nativeAdOffer.nativeAd.icon) {
        self.iconImageView.image = self.nativeAdOffer.nativeAd.icon;
    } else {
        [[ATImageLoader shareLoader]loadImageWithURL:[NSURL URLWithString:self.nativeAdOffer.nativeAd.iconUrl] completion:^(UIImage *image, NSError *error) {
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.iconImageView setImage:image];
                });
            }
        }];
    }
    
    if (self.nativeAdOffer.nativeAd.mainImage) {
        self.mainImageView.image = self.nativeAdOffer.nativeAd.mainImage;
    } else {
        [[ATImageLoader shareLoader]loadImageWithURL:[NSURL URLWithString:self.nativeAdOffer.nativeAd.imageUrl] completion:^(UIImage *image, NSError *error) {
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.mainImageView setImage:image];
                });
            }
        }];
    }
    
    if (self.nativeAdOffer.nativeAd.logo) {
        self.logoImageView.image = self.nativeAdOffer.nativeAd.logo;
    } else {
        [[ATImageLoader shareLoader]loadImageWithURL:[NSURL URLWithString:self.nativeAdOffer.nativeAd.logoUrl] completion:^(UIImage *image, NSError *error) {
            if (!error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.logoImageView setImage:image];
                });
            }
        }];
    }
    
    self.advertiserLabel.text = self.nativeAdOffer.nativeAd.advertiser;

    self.titleLabel.text = self.nativeAdOffer.nativeAd.title;
  
    self.textLabel.text = self.nativeAdOffer.nativeAd.mainText;
     
    self.ctaLabel.text = self.nativeAdOffer.nativeAd.ctaText;
  
    self.ratingLabel.text = [NSString stringWithFormat:@"%@", self.nativeAdOffer.nativeAd.rating ? self.nativeAdOffer.nativeAd.rating : @""];
}

-(void) makeConstraintsForSubviews {
    
    self.backgroundColor = [UIColor whiteColor];// randomColor;

    self.titleLabel.backgroundColor =  [UIColor clearColor];
    
    self.textLabel.backgroundColor =  [UIColor clearColor];
    
    
    [self.sponsorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@25);
        make.bottom.equalTo(self).equalTo(@-5);
        make.right.equalTo(self.logoImageView.mas_left).equalTo(@-5);
    }];



    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@25);
        make.bottom.equalTo(self).equalTo(@-5);
        make.left.equalTo(self).equalTo(@5);
    }];


    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(100);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@20);
        make.top.equalTo(self).offset(20);
    }];

    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(100);
        make.right.equalTo(self).offset(-40);
        make.height.equalTo(@20);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
    }];

    [self.ctaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel.mas_bottom).equalTo(@5);
        make.width.equalTo(@100);
        make.height.equalTo(@40);
        make.left.equalTo(self.textLabel.mas_left);
    }];

    [self.ratingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.ctaLabel.mas_right).offset(20);
        make.height.equalTo(@40);
        make.top.equalTo(self.ctaLabel.mas_top).offset(0);
        make.width.equalTo(@20);
    }];

    [self.advertiserLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@30);
        make.right.equalTo(self).equalTo(@-5);
        make.left.equalTo(self.ctaLabel.mas_right).offset(50);
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.height.width.equalTo(@75);
        make.top.equalTo(self).offset(20);
    }];

    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(25);
        make.bottom.equalTo(self).offset(-5);
    }];


    [self.dislikeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@50);
        make.top.equalTo(self).equalTo(@5);
        make.right.equalTo(self.mas_right).equalTo(@-5);
    }];
    
}

@end
