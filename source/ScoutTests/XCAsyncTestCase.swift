//
//  XCTestCase+AsyncSetup.swift
//  ScoutTests
//
//  Created by Ryan Barger on 6/21/22.
//

import Foundation
import XCTest

class XCAsyncTestCase : XCTestCase {
    func asyncSetUpWithError() async throws {
        fatalError("Must override")
    }
    
    override func setUpWithError() throws {
        wait {
            try await self.asyncSetUpWithError()
        }
    }
    
    
    func wait(asyncBlock: @escaping (() async throws -> Void)) {
        let semaphore = DispatchSemaphore(value: 0)
        Task.init {
            try await asyncBlock()
            semaphore.signal()
        }
        semaphore.wait()
    }
}
