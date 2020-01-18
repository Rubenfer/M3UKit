import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(M3UDecoderTests.allTests),
        testCase(M3UEncoderTests.allTests),
    ]
}
#endif
