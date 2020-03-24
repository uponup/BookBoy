//
//  TaskQueue.swift
//  
//
//  Created by 飞流 on 2018/5/24.
//  Copyright © 2018年 couple. All rights reserved.
//

import Foundation

public typealias Next = () -> ()
public typealias Task = (@escaping Next) -> ()

@objc (TaskQueue)
public class TaskQueue: NSObject {
    @objc public var autoRun: Bool
    @objc public var completion: (() -> Void)?
    
    private var running: Bool
    private var paused: Bool
    private var cancelled: Bool
    private var identifiers: [String]
    private var tasks: [String: Task]
    private var currentTaskIdentifier: String?
    private var currentTask: Task?
    
    @objc public override init() {
        autoRun = true
        running = false
        paused = false
        cancelled = false
        identifiers = []
        tasks = [ : ]
    }
    
    @objc public func run() {
        if paused {
            paused = false
        }
        if running {
            return
        }
        running = false
        runNextTask()
    }
    
    @objc public func pause() {
        paused = true
        running = false
    }
    
    @objc public func cancel() {
        cancelled = true
    }
    
    @objc public func retry() {
        objc_sync_enter(self)
        if let identifier = currentTaskIdentifier, let task = currentTask {
            identifiers.insert(identifier, at: 0)
            tasks[identifier] = task
        }
        objc_sync_exit(self)
    }
    
    @objc public func add(_ task: @escaping Task, identifier: String) {
        if identifier != currentTaskIdentifier {
            objc_sync_enter(self)
            identifiers.append(identifier)
            tasks[identifier] = task
            objc_sync_exit(self)
            if !running && autoRun && !paused {
                runNextTask()
            }
        }
    }
    
    @objc public func remove(forIdentifier identifier: String) {
        if identifier != currentTaskIdentifier {
            objc_sync_enter(self)
            if let index = identifiers.index(of: identifier) {
                identifiers.remove(at: index)
                tasks.removeValue(forKey: identifier)
            }
            objc_sync_exit(self)
        }
    }
    
    private func runNextTask() {
        if cancelled {
            objc_sync_enter(self)
            identifiers.removeAll()
            tasks.removeAll()
            objc_sync_exit(self)
            running = false
            paused = false
            cancelled = false
            return
        }
        if paused { return }
        var executeTask: Task?
        objc_sync_enter(self)
        if identifiers.count > 0 {
            let identifier = identifiers[0]
            currentTaskIdentifier = identifier
            identifiers.remove(at: 0)
            executeTask = tasks[identifier]
            currentTask = executeTask
            tasks.removeValue(forKey: identifier)
        }
        objc_sync_exit(self)
        
        if let task = executeTask {
            let next = { [weak self] in
                self?.currentTaskIdentifier = nil
                self?.runNextTask()
            }
            task(next)
        } else {
            running = false
            completion?()
        }
    }
}
