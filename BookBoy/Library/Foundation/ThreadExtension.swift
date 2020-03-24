//
//  ThreadExtension.swift
//  
//
//  Created by 飞流 on 2018/9/10.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

extension Thread {
    public static func doOnMain(_ block: @escaping () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }
    
    public static func doOnBackDefaultThread(_ block: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
    public static func doOnDelay(_ timeInterval: TimeInterval, _ block: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + Double(Int64(timeInterval * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: block)
    }
}
