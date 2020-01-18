import XCTest
@testable import M3UKit

final class M3UDecoderTests: XCTestCase {
    
    let contentString = """
    #EXTM3U Test M3U8 List

    #EXTINF:-1 attribute-key="value",Live channel
    http://example.com
    #EXTINF:300,300s channel
    http://example.com
    """
    
    func testDecode() {
        guard let m3u = M3UDecoder().decode(contentString.data(using: .utf8)!) else { XCTFail("m3u is nil"); return }
        
        XCTAssertTrue(m3u.channels.count == 2)
        
        let firstChannel = m3u.channels[0]
        XCTAssertTrue(firstChannel.duration == -1)
        XCTAssertTrue(firstChannel.attributes.count == 1)
        XCTAssertTrue(firstChannel.attributes["attribute-key"] == "value")
        XCTAssertTrue(firstChannel.title == "Live channel")
        XCTAssertTrue(firstChannel.url == "http://example.com")
        
        let secondChannel = m3u.channels[1]
        XCTAssertTrue(secondChannel.duration == 300)
        XCTAssertTrue(secondChannel.attributes.count == 0)
        XCTAssertTrue(secondChannel.title == "300s channel")
        XCTAssertTrue(secondChannel.url == "http://example.com")
    }
    
    static var allTests = [
        ("testDecode", testDecode),
    ]
}
