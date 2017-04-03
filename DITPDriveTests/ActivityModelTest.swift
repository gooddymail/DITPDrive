//
//  ActivityModelTest.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 2/27/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import XCTest
import Alamofire
import OHHTTPStubs
@testable import DITPDrive

class ActivityModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
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
    XCTAssertEqual(activity?.name, "งาน Thailand gem and jewelry")
  }
  
  func testInitailizeActivityShouldThrowErrorWhenImportantInformationIsMissing() {
    XCTAssertThrowsError(try Activity(json: [:]), "Should throw error when important data is missing") { error in
      guard case SerializarionError.missing(let value) = error else {
        return XCTFail()
      }
      XCTAssertEqual(value, "important Information")
    }
  }
  
  func testGetActivitiesFromServer() {
    stub(condition: isHost("ditpdrive.com") && isPath("activities")) { request in
      return OHHTTPStubsResponse(fileAtPath: OHPathForFile("activities.json", type(of: self))!,
                                 statusCode: 200,
                                 headers: nil)
    }
    var activitiesWrapper: ActivitiesWrapper?
    DITPDriveAPI.instance.getActivities(nil) { result in
      activitiesWrapper = result.value
      XCTAssertEqual(activitiesWrapper?.count, 3)
    }
  }
  
  func testGetHomeActivitiesFromServer() {
    stub(condition: isHost("ditpdrive.com") && isPath("activities/home")) { request in
      return OHHTTPStubsResponse(fileAtPath: OHPathForFile("homeActivities.json", type(of: self))!,
                                 statusCode: 200,
                                 headers: nil)
    }
    DITPDriveAPI.instance.getHomeActivities() { result in
      guard let homeActivityWrapper = result.value else { return XCTFail() }
      XCTAssertNotNil(homeActivityWrapper.highlightActivities)
      XCTAssertEqual(homeActivityWrapper.highlightActivities.count, 3, "Home api should return 3 highlight activity")
      
      XCTAssertNotNil(homeActivityWrapper.nationalActivities)
      XCTAssertEqual(homeActivityWrapper.nationalActivities.count, 3, "Home api should return 3 national activity")
      
      XCTAssertNotNil(homeActivityWrapper.overseaActivities)
      XCTAssertEqual(homeActivityWrapper.overseaActivities.count, 3, "Home api should return 3 oversea activity")
      
      XCTAssertNotNil(homeActivityWrapper.seminar)
      XCTAssertEqual(homeActivityWrapper.seminar.count, 3, "Home api should return 3 seminar activity")
    }
  }
  
}
