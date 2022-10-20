//
//  UserModel.swift
//  testMindX
//
//  Created by VinhLN on 19/10/2022.
//

import Foundation
import RealmSwift

final class Group: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
}
