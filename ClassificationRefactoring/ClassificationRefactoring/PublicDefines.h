//
//  PublicDefines.h
//  SimpleKVO
//
//  Created by achen on 18/7/1.
//  Copyright © 2018年 achen. All rights reserved.
//

#ifndef PublicDefines_h
#define PublicDefines_h

// strong/weak transform macro; learn from Reactive cocoa.
#ifndef weakify_self
#if __has_feature(objc_arc)
#define weakify_self autoreleasepool{} __weak __typeof__(self) weakSelf = self;
#else
#define weakify_self autoreleasepool{} __block __typeof__(self) blockSelf = self;
#endif
#endif

#ifndef strongify_self
#if __has_feature(objc_arc)
#define strongify_self try{} @finally{} __typeof__(weakSelf) self = weakSelf;
#else
#define strongify_self try{} @finally{} __typeof__(blockSelf) self = blockSelf;
#endif
#endif

#define TEXTFEILD_STATE_KEY @"conditionsKey"
#define TEXTFIELDSTATE @"textFieldState"
#endif /* PublicDefines_h */
