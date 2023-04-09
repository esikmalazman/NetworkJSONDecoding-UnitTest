//
//  URLSessionContract.swift
//  NetworkJSONDecoding
//
//  Created by Ikmal Azman on 09/04/2023.
//

import Foundation

protocol URLSessionContract {
    func dataTask(with request: URLRequest, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession : URLSessionContract {}
