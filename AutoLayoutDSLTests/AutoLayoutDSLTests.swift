import XCTest
@testable import AutoLayoutDSL

class AutoLayoutDSLTests: XCTestCase {
    var sut: AutoLayoutDSL!

    override func setUp() {
        sut = AutoLayoutDSL()
    }
    
    func testAdd() {
        XCTAssertEqual(sut.add(a: 1, b: 1), 2)
    }
}
