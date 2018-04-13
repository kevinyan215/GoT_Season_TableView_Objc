//
//  ViewController.m
//  GoT_Season_TableView_Objc
//
//  Created by Kevin Yan on 4/12/18.
//  Copyright © 2018 Kevin Yan. All rights reserved.
//

#import "ViewController.h"
#import "MyMainModel.h"
#import "Parser.h"
#import "Season.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self doNetwork];
    
    Season *season = [[Season alloc] init];
    season.title = @"GoT";
    NSLog(@"%@", season.title);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//getMainGoT
- (void)doNetwork {
    NSString *urlString = @"http://www.omdbapi.com/?apikey=6bfb4e66&t=Game+Of+Thrones";
    NSURL *url = [NSURL URLWithString:urlString];

    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithURL:url completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
//        NSLog(@"%@ \n %@ \n %@", data,response,error);
        
        if(data != nil) {
            NSObject *serializedJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:(nil,nil)];
            NSLog(@"%@",serializedJson);
            MyMainModel *model = [Parser json:serializedJson];
            NSLog(@"%@", model);
            
//            Parser *parser = [[Parser alloc] init];
//            [parser parse];
            
//            [Parser parse];
            
        }
        
    }];

    [dataTask resume];
}

//    NSJSONReadingOptions
//    [NSJSONSerialization JSONObjectWithData:<#(nonnull NSData *)#> options:<#(NSJSONReadingOptions)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
//    [urlSession dataTaskWithURL:<#(nonnull NSURL *)#> completionHandler:<#^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)completionHandler#>]


//get seasons -> data source ->
//Data source
//->Main
//->Season
//->Episode

-(void)getSeasons {
    
}

@end


/*
func downloadEndPoint(urlString: String, handler: @escaping((Any)->Void)){
    guard let url = URL(string: urlString) else {
        print("invalid url")
        return
    }
    let task = URLSession.shared.dataTask(with: url, completionHandler: {(data,url,error) in
        if error != nil {
            print("error with URLSession data task: \(error)")
            return
        }
        do {
            if let data = data {
                let serializedJson = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                //Dispatch queue?
                //print(serializedJson) //executed after main thread finishes?
                DispatchQueue.main.async {
                    //                            print("Download Type: (downloadType), Serialized Json: \(serializedJson)") // runs on main thread?
                    handler(serializedJson)
                    //delegate do xyz after downloading
                    //self.delegate?.didDownload()
                }
            }
        } catch {
            print("error with JSONSerialization: \(error)")
        }
    })
    task.resume()
}


func downloadMain(){
    let urlString = GameOfThronesAPI.EndPoint.main + GameOfThronesAPI.EndPoint.gameOfThrones
    downloadEndPoint(urlString: urlString, handler: {(serializedJson) in
        if let serializedJson = serializedJson as? [String:Any]{
            Parser.parseMain(input: serializedJson)
        }
    })
}
*/
