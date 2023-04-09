//
//  HttpClient.swift
//  NetworkJSONDecoding
//
//  Created by Ikmal Azman on 09/04/2023.
//

import Foundation

final class HttpClient {
    
    let session : URLSessionContract
    
    init(session: URLSessionContract = URLSession.shared) {
        self.session = session
    }
    
    /// Function to make Http request throught URLRequest
    /// - Parameters:
    ///   - session: environment to connect the app to internet
    ///   - url: URL to request the data
    ///   - completion: returning the data if success or error if failure
    func downloadData<T:URLSessionContract>(_ session : T,
                                            withURL url : URLRequest,
                                            _ completion : @escaping (Result<Data, Error>)->Void ) {
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {return}
            completion(.success(data))
        }
        task.resume()
    }
    
    
    /// Function to decode the data
    /// - Parameters:
    ///   - data: downloaded data from URLSessionDataTask
    ///   - model: type for data to be converted into
    /// - Returns: return object with decodable type
    func processData<T:Decodable>(_ data : Data, _ model : T.Type) throws -> T {
        let decoder = JSONDecoder()
        let content = try decoder.decode(model, from: data)
        return content
    }
}
