//
//  ZLMacroDefinitionHeader.h
//  ZLMacroDefinition
//
//  Created by lu on 16/7/4.
//  Copyright © 2016年 scorpio. All rights reserved.
//

#ifndef ZLMacroDefinitionHeader_h
#define ZLMacroDefinitionHeader_h


//需要横屏或者竖屏，获取屏幕宽度与高度
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上

#define ScreenWidth ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define ScreenHeight ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#else
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

#define iPhone6ScaleWidth ScreenWidth/375
#define iPhone6ScaleHeight ScreenHeight/667
#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define KISiPhoneX (kStatusBarHeight == 20.f?NO:YES)
#define kSafeAreaBottomHeight (ScreenHeight == 812.0 ? 34 : 0)
#define kNavigationBarHeight (ScreenHeight == 812.0 ? 88 : 64)



//5.自定义高效率的 NSLog
#ifdef DEBUG
#define ZLLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZLLog(...)
#endif

//6.弱引用/强引用
#undef HVWeakify
#define HVWeakify( x )    autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;
#undef    HVNormalize
#define HVNormalize( x )    try{} @finally{} __typeof__(x) x = __weak_##x##__;
#undef    HVNormalizeAndNoNil
#define HVNormalizeAndNoNil( x )    try{} @finally{} __typeof__(x) x = __weak_##x##__;if(x==nil)return;
#undef    HVNormalizeAndNil
#define HVNormalizeAndNil( x )    try{} @finally{} __typeof__(x) x = __weak_##x##__;if(x==nil)return nil;


//14.判断当前的iPhone设备/系统版本
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])


//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]



// 单例
#undef    AS_SINGLETON
#define AS_SINGLETON( ... ) \
- (instancetype)sharedInstance; \
+ (instancetype)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON( ... ) \
- (instancetype)sharedInstance{ \
return [[self class] sharedInstance]; \
} \
+ (instancetype)sharedInstance{ \
static dispatch_once_t once; \
static id __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[self alloc] init]; } ); \
return __singleton__; \
}

#endif /* ZLMacroDefinitionHeader_h */
