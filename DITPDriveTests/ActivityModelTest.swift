//
//  ActivityModelTest.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 2/27/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import XCTest
@testable import DITPDrive

class ActivityModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testInitailizeActivityWithJSON() {
    let bundle = Bundle(for: type(of: self))
    let filePath = bundle.path(forResource: "activity", ofType:"json")
    let data = try! Data(contentsOf: URL(fileURLWithPath:filePath!), options: .uncached)
    guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
      return XCTFail()
    }
    
    let activity = try! Activity(json: json!)
    XCTAssertNotNil(activity)
    XCTAssertEqual(activity?.name, "โครงการพัฒนาและส่งเสริมสินค้าหนึ่งตำบล หนึ่งผลิตภัณฑ์ (OTOP) เพื่อการส่งออก")
  }
  
  func testInitailizeActivityShouldThrowErrorWhenImportantInformationIsMissing() {
    XCTAssertThrowsError(try Activity(json: [:]), "Should throw error when important data is missing") { error in
      guard case SerializarionError.missing(let value) = error else {
        return XCTFail()
      }
      XCTAssertEqual(value, "important Information")
    }
  }
    
}
