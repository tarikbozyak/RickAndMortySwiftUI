//
//  Scheduler.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation
import Combine

final class Scheduler {
    
    static var background: OperationQueue = {
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 10
        operationQueue.qualityOfService = QualityOfService.userInitiated
        return operationQueue
    }()

    static let main = RunLoop.main
}

