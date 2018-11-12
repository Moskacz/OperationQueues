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
        self.__executing = true
        print("start \(name!)")
        sleep(seconds)
        self.__executing = false
        self.__isFinished = true
    }
    
    private var __executing = false
    override var isExecuting: Bool {
        return __executing
    }
    
    private var __isFinished = false
    override var isFinished: Bool {
        return __isFinished
    }
}
