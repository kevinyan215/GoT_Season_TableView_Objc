//
//  Parser.m
//  GoT_Season_TableView_Objc
//
//  Created by Kevin Yan on 4/13/18.
//  Copyright © 2018 Kevin Yan. All rights reserved.
//

#import "Parser.h"


enum Keys {
    title = 'Title',
    writers = 'Writer'
};

@interface Parser(){
    enum Keys _keys;
}
@end

@implementation Parser

//+ (MyMainModel *)parseMainJson:(id)json {

+ (MyMainModel *)json:(id)json {
    MyMainModel *model = [[MyMainModel alloc] init];
    
    BOOL checkJson = [json isKindOfClass:[NSDictionary class]];
    NSDictionary *dict = json;
    
    NSString *awards = dict[@"Awards"];
    NSString *genre = dict[@"Genre"];
    NSString *country = dict[@"Country"];
    NSString *plot = dict[@"Plot"];
    NSString *released = dict[@"Released"];
    NSString *title = dict[@"Title"];

    //KVO
    NSString *kvoTitle = [json valueForKeyPath:@"Title"];
    NSLog(@"%@", title);
    NSLog(@"%s %@","KVO Title",kvoTitle);
    
    
    model.awards = awards;
    model.genre = genre;
    model.country = country;

    return model;
}

-(void)parseSeasonJson:(id)json {
//    _keys = title;
    
}

@end
