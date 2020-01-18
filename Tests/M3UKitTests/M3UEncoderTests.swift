import XCTest
@testable import M3UKit

final class M3UEncoderTests: XCTestCase {
    
    let contentString = """
    #EXTINF:-1 attribute-key="value",Live channel
    http://example.com
    #EXTINF:300,300s channel
    http://example.com
    """
    
    let m3u = M3U(channels: [
        M3U.Channel(title: "Live channel", duration: -1, attributes: ["attribute-key":"value"], url: "http://example.com"),
        M3U.Channel(title: "300s channel", duration: 300, url: "http://example.com")
    ])
    
    func testEncode() {
        let targetData = contentString.data(using: .utf8)
        let encodedM3U = M3UEncoder().encode(m3u)
        XCTAssertNotNil(encodedM3U)
        XCTAssert(encodedM3U == targetData)
    }
    
    static var allTests = [
        ("testEncode", testEncode),
    ]
}
