@testable import NetworkJSONDecoding
import XCTest

final class HttpClientTests: XCTestCase {
    var sut : HttpClient!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        sut = HttpClient(session: session)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_download_withData_shouldReturnData() {
        let expectation = expectation(description: "Test Download")
        let request = makeUserURLRequest()
        session.data = makeMockUserData()
        
        sut.downloadData(session, withURL: request) { result in
            switch result {
            case .success(let success):
                XCTAssertEqual(success, self.makeMockUserData())
            case .failure(_):
                XCTFail("Download failed where it should not to")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func test_download_withError_shouldNotReturnData() {
        let expectation = expectation(description: "Test Download")
        let request = makeUserURLRequest()
        let error = NSError(domain: "Error download data", code: 0)
        session.error = error
        
        sut.downloadData(session, withURL: request) { result in
            switch result {
            case .success(let success):
                XCTFail("Download success where it should not to")
            case .failure(let error):
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
}

private extension HttpClientTests {
    func makeUserURLRequest(_ file : StaticString = #file, _ line : UInt = #line) -> URLRequest {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/") else {
            fatalError("Invalid URL", file: file, line: line)
        }
        let request = URLRequest(url: url)
        return request
    }
    
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
