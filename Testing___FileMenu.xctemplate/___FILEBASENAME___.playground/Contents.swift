import XCTest

//: ### Write code here here


//: -
//: ### Write tests here
class MyTestCase : XCTestCase {
    
    func testShouldPass() {
        XCTAssertTrue(true, "This one passes")
    }
}
let observer = TestObserver()
XCTestObservationCenter.shared.addTestObserver(observer)
MyTestCase.defaultTestSuite.run()
