//
//  SleepOperation.swift
//  OperationQueues
//
//  Created by Michal Moskala on 11/11/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

class SleepOperation: Operation {
    
    private let seconds: UInt32
    
    init(seconds: UInt32, name: String) {
        self.seconds = seconds
        super.init()
        self.name = name
        self.completionBlock = {
            print("end \(name)")
        }
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override func start() {
        self.myExecuting = true
        print("start \(name!)")
        sleep(seconds)
        self.myExecuting = false
        self.myIsFinished = true
    }
    
    private var myExecuting = false
    override var isExecuting: Bool {
        return myExecuting
    }
    
    private var myIsFinished = false
    override var isFinished: Bool {
        return myIsFinished
    }
}
