
//
//  Parser.h
//  GoT_Season_TableView_Objc
//
//  Created by Kevin Yan on 4/13/18.
//  Copyright © 2018 Kevin Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyMainModel.h"


//#ifndef Parser_h
//#define Parser_h
//
//
//#endif /* Parser_h */

@interface Parser: NSObject
+ (MyMainModel *)json:(id)json;
@end
