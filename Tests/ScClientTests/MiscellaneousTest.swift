import XCTest
@testable import ScClient

class MiscellaneousTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testShouldSerializeData() {
        let emitEvent = Model.getEmitEventObject(eventName: "chat", data: "My Sample Data" as AnyObject, messageId: 2)
        let expectedData = "{\"cid\":2,\"event\":\"chat\",\"data\":\"My Sample Data\"}"
        XCTAssertEqual(expectedData, emitEvent.toJSONString())
    }
    
    func testShouldDeserializeData() {
        let jsonString = "{\"cid\":2,\"event\":\"chat\",\"data\":\"My Sample Data\"}"
        if let emitEvent = EmitEvent.deserialize(from: jsonString) {
            XCTAssertEqual(emitEvent.cid, 2)
            XCTAssertEqual(emitEvent.data as? String, "My Sample Data")
            XCTAssertEqual(emitEvent.event, "chat")
        }
    }
    
    override func tearDown() {
        
    }
    
}
