//
//  User.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/19.
//

import Foundation
import Firebase
import FirebaseFirestore

class User {
    
    var email: String
    var name: String
    var createdAt: Timestamp
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
    
}
