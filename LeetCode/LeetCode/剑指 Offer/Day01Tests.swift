//
//  Day01Test.swift
//  LeetCode
//
//  Created by 李礼光 on 2021/11/28.
//

import XCTest
@testable import LeetCode

class Day01Tests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        let obj = CQueue()
        
        for i in 0...2 {
            obj.appendTail(i)
        }
        for _ in 0...1 {
            print(obj.deleteHead())
        }
        for i in 0...2 {
            obj.appendTail(i)
        }
        for _ in 0...2 {
            print(obj.deleteHead())
        }
        
    }
    


}
