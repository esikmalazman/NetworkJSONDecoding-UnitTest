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
    var capturedCompletion : ((Data?, URLResponse?, Error?) -> Void)?
    let dataTask = FakeDataTask()
    
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        capturedURLRequest = request.url
        capturedCompletion = completionHandler
        return dataTask
    }
}

final class FakeDataTask : URLSessionDataTask {
    override func resume() {}
}
