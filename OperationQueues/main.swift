//
//  main.swift
//  OperationQueues
//
//  Created by Michal Moskala on 11/11/2018.
//  Copyright © 2018 Michal Moskala. All rights reserved.
//

import Foundation

enum Test {
    case concurrentQueue
    case serialQueue
}

var test = Test.serialQueue
switch test {
case .concurrentQueue:
    let queue = OperationQueue()
    queue.addOperation(SleepOperation(seconds: 2, name: "1"))
    queue.addOperation(SleepOperation(seconds: 4, name: "2"))
case .serialQueue:
    let queue = OperationQueue()
    queue.maxConcurrentOperationCount = 1
    queue.addOperation(SleepOperation(seconds: 2, name: "1"))
    queue.addOperation(SleepOperation(seconds: 4, name: "2"))
}

RunLoop.main.run()
