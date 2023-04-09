//
//  UserModel.swift
//  NetworkJSONDecoding
//
//  Created by Ikmal Azman on 09/04/2023.
//

import Foundation

struct UserModel : Decodable {
    let userId : Int
    let id : Int
    let title : String
    let completed : Bool
}
