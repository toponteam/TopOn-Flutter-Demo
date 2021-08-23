//
//  ATFNativeAdView.m
//  topon_flutter_plugin
//
//  Created by GUO PENG on 2021/6/29.
//

#import "ATFNativeAdView.h"
#import "UIView+ATFLayoutMethods.h"
#import "ATFDisposeDataTool.h"
#import "ATFCommonTool.h"

@interface ATFNativeAdView()

@property(nonatomic, strong) ATFNativeAttributeMode *parentMode;
@property(nonatomic, strong) ATFNativeAttributeMode *appIconMode;
@property(nonatomic, strong) ATFNativeAttributeMode *mainImageMode;
@property(nonatomic, strong) ATFNativeAttributeMode *mainTitleMode;
@property(nonatomic, strong) ATFNativeAttributeMode *descMode;
@property(nonatomic, strong) ATFNativeAttributeMode *adLogoMode;
@property(nonatomic, strong) ATFNativeAttributeMode *ctaMode;
@property(nonatomic, strong) ATFNativeAttributeMode *dislikeMode;

@property(nonatomic, strong) NSDictionary *extraDic;

@end

@implementation ATFNativeAdView

#pragma mark - init


-(void) initSubviews {
   [super initSubviews];
    
    [self addChild];
}

#pragma mark - layout
-(void) layoutMediaView {
//    self.mediaView.frame = CGRectMake(0, 120.0f, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 120.0f);
}

-(void) makeConstraintsForSubviews {
    [super makeConstraintsForSubviews];
}

- (void)layoutChildControls{
    [self setViewLayout];
}

- (void)renderingChildControls:(NSDictionary *)extraDic{
    self.extraDic = extraDic;
    
    [self setMode];
    
    [self setViewValue];
}

#pragma mark - register call
-(NSArray<UIView*>*)clickableViews {
    NSMutableArray<UIView*> *clickableViews = [NSMutableArray<UIView*> arrayWithObjects:_iconImageView, _ctaLabel, _mainImageView, nil];
    if (self.mediaView != nil) { [clickableViews addObject:self.mediaView]; }
    return clickableViews;
}

#pragma mark - private

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

- (void)setViewValue{
    
    self.backgroundColor =  [ATFCommonTool colorWithHexString:self.parentMode.backgroundColorStr];
    _iconImageView.backgroundColor = [ATFCommonTool colorWithHexString:self.adLogoMode.backgroundColorStr];
    _mainImageView.backgroundColor = [ATFCommonTool colorWithHexString:self.mainImageMode.backgroundColorStr];
    _dislikeButton.backgroundColor = [ATFCommonTool colorWithHexString:self.dislikeMode.backgroundColorStr];

    
    
    _titleLabel.font = [UIFont boldSystemFontOfSize:self.mainTitleMode.textSize];
    _titleLabel.textColor = [ATFCommonTool colorWithHexString:self.mainTitleMode.textColorStr];
    _titleLabel.backgroundColor =  [ATFCommonTool colorWithHexString:self.mainTitleMode.backgroundColorStr];
    
    _textLabel.font = [UIFont systemFontOfSize:self.descMode.textSize];
    _textLabel.textColor = [ATFCommonTool colorWithHexString:self.descMode.textColorStr];
    _textLabel.backgroundColor =  [ATFCommonTool colorWithHexString:self.mainTitleMode.backgroundColorStr];


    
    _ctaLabel.font = [UIFont systemFontOfSize:self.ctaMode.textSize];
    _ctaLabel.textColor = [ATFCommonTool colorWithHexString:self.ctaMode.textColorStr];
    _ctaLabel.backgroundColor =  [ATFCommonTool colorWithHexString:self.mainTitleMode.backgroundColorStr];
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

- (CGRect)getRect:(ATFNativeAttributeMode *)mode{
    CGRect rect = CGRectMake( mode.x, mode.y, mode.width,mode.height);
    return rect;
}

- (void)addChild{
    
    [self addSubview:({
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
        _titleLabel;
    })];
    
    [self addSubview:({
        _textLabel = [[UILabel alloc]init];
        [_textLabel setFont:[UIFont systemFontOfSize:15]];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.numberOfLines = 0;
        _textLabel;
    })];
    
    [self addSubview:({
        _ctaLabel = [[UILabel alloc]init];
        [_ctaLabel setFont:[UIFont systemFontOfSize:15]];
        _ctaLabel.textColor = [UIColor blackColor];
        _ctaLabel;
    })];
    
    [self addSubview:({
        _iconImageView = [[UIImageView alloc]init];
        _iconImageView.layer.cornerRadius = 4.0f;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView;
    })];
    
    
    [self addSubview:({
        _mainImageView = [[UIImageView alloc]init];
        _mainImageView.contentMode = UIViewContentModeScaleAspectFit;
        _mainImageView;
    })];
    [self addSubview:({
        _logoImageView = [[UIImageView alloc]init];
        _logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        _logoImageView;
    })];
    
    [self addSubview:({
        _dislikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *closeImg = [UIImage imageNamed:@"icon_webview_close" inBundle:[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"AnyThinkSDK" ofType:@"bundle"]] compatibleWithTraitCollection:nil];
        [_dislikeButton setImage:closeImg forState:0];
        _dislikeButton;
    })];
        
    
    [self addSubview:({
        _advertiserLabel = [[UILabel alloc]init];
        _advertiserLabel;
    })];
    
    [self addSubview:({
        _ratingLabel = [[UILabel alloc]init];
        _ratingLabel;
    })];
        
 
}



@end
