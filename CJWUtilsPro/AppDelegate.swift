//
//  AppDelegate.swift
//  CJWUtilsPro
//
//  Created by Frank on 07/04/2017.
//  Copyright © 2017 Frank. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: QPResponder {
    
    
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let vc = TestingTableViewController()

        let ft = QPFeatureViewController()
        ft.images  = ["Guide1","Guide2","Guide3"]
        ft.setOnEndNewFeatureBlock {
            self.showNaviVC(vc: vc)
        }
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        window.rootViewController = vc
//        self.window = window
//        window.makeKeyAndVisible()
        
        self.showNaviVC(vc: vc)
//        QPCacheUtils.cache(value: "123" as AnyObject, forKey: "a")
//        QPCacheUtils.cache(value: "123" as AnyObject, forKey: "a", toDisk: true)
        if let obj = QPCacheUtils.getCacheBy(key: "a") as? String {
            print("\(obj)")
        }else{
            print("fucking")
        }
        return true
    }
}
