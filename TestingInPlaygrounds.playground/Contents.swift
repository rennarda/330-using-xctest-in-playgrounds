
import XCTest

class MyTestCase : XCTestCase {
    
    func testShouldFail() {
        XCTAssertFalse(true, "Forced failure")
    }
    
    func testShouldPass() {
        XCTAssertTrue(true, "This one passes")
    }
}

class TestObserver : NSObject, XCTestObservation {
    func testCase(_ testCase: XCTestCase, didFailWithDescription description: String, inFile filePath: String?, atLine lineNumber: Int) {
        print("🚫 \(description) line:\(lineNumber)")
    }
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        if testCase.testRun?.hasSucceeded == true {
            print("✅ \(testCase)")
        }
    }
}

let observer = TestObserver()
XCTestObservationCenter.shared.addTestObserver(observer)

MyTestCase.defaultTestSuite.run()
