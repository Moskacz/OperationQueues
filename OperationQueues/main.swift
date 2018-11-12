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
    case dependantOperations
}

var test = Test.dependantOperations
let queue = OperationQueue()
switch test {
case .concurrentQueue:
    queue.addOperation(SleepOperation(seconds: 2, name: "1"))
    queue.addOperation(SleepOperation(seconds: 4, name: "2"))
case .serialQueue:
    queue.maxConcurrentOperationCount = 1
    queue.addOperation(SleepOperation(seconds: 2, name: "1"))
    queue.addOperation(SleepOperation(seconds: 4, name: "2"))
case .dependantOperations:
    let op1 = SleepOperation(seconds: 2, name: "1")
    let op2 = SleepOperation(seconds: 3, name: "2")
    let op3 = SleepOperation(seconds: 1, name: "3")
    op3.addDependency(op1)
    op3.addDependency(op2)
    [op1, op2, op3].forEach { queue.addOperation($0) }
}

queue.waitUntilAllOperationsAreFinished()
