//
//  UserModel.swift
//  NetworkJSONDecoding
//
//  Created by Ikmal Azman on 09/04/2023.
//

import Foundation

struct UserModel : Codable {
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
}

extension UserModel : Equatable {
    
    /// Function to validate value between 2 data model
    /// - Parameters:
    ///   - lhs: left hand side value
    ///   - rhs: right hand side value
    /// - Returns: value of the comparison
    static func == (lhs : UserModel, rhs : UserModel) -> Bool {
        return lhs.userId == rhs.userId && lhs.id == rhs.id && lhs.title == rhs.title && lhs.completed == rhs.completed
    }
}
