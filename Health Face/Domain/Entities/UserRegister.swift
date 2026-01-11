//
//  UserRegister.swift
//  Health Face
//
//  Created by Damir Aushenov on 11/1/26.
//

import Foundation

struct UserRegister {
  
    let password: String
    let email: String
   
}

enum Gender: String, CaseIterable, Identifiable {
    case male
    case female

    var id: String {
        rawValue
    }
}

struct LoginCredentials: Encodable {
    let username: String
    let password: String
}
