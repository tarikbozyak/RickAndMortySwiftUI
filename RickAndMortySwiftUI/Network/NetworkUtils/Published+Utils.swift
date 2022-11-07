//
//  Published+Utils.swift
//  RickAndMortySwiftUI
//
//  Created by Ahmed Tarık Bozyak on 29.10.2022.
//

import Foundation
import Combine

/// Extending the publisher class with some convience functions
@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
extension Publisher {

    static func fail(_ error: Failure) -> AnyPublisher<Output, Failure> {
        return Fail(error: error).eraseToAnyPublisher()
    }
}

