//
//  UserModel.swift
//  testMindX
//
//  Created by VinhLN on 19/10/2022.
//

import Foundation
import RealmSwift

final class UserModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var username: String
    @Persisted var fullname: String
    @Persisted var email: String
    @Persisted var password: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
