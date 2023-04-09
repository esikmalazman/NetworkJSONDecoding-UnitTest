@testable import NetworkJSONDecoding
import XCTest

final class HttpClientTests: XCTestCase {}

private extension HttpClientTests {
    func makeMockUserData() -> Data {
        let data =
    """
    {
    "userId": 1,
    "id": 2,
    "title": "test",
    "completed": true
    }
    """.data(using: .utf8)!
        
        return data
    }
}
