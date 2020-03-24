//
//  AppDelegate.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Thread.sleep(forTimeInterval: 2)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = HomeViewController().defaultNavigationController()
        
        dbInit()
        
        return true
    }
}

extension AppDelegate {
    func dbInit() {
        NoteDao.createTable()
        BookDao.createTable()
    }
}

