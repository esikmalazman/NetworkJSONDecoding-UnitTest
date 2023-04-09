//
//  MockURLSession.swift
//  NetworkJSONDecodingTests
//
//  Created by Ikmal Azman on 09/04/2023.
//

@testable import NetworkJSONDecoding
import Foundation

final class MockURLSession : URLSessionContract {
    var capturedURLRequest : URL?
    var data : Data?
    var error : Error?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.capturedURLRequest = request.url
        let data = self.data
        let error = self.error
        
        return FakeDataTask {
            completionHandler(data, nil, error)
        }
    }
}


/// `URLSessionDataTask`, return download data to memory
final class FakeDataTask : URLSessionDataTask {
    
    /// `closure`, completion handler that allow us supply the return data for testing
    private  let closure : () -> Void
    
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    override func resume() {
        closure()
    }
}
