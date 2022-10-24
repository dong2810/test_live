//
//  Migrator.swift
//  testMindX
//
//  Created by VinhLN on 24/10/2022.
//

import Foundation
import RealmSwift

class Migrator {
    init() {
        updateSchema()
    }
    
    func updateSchema() {
        let config = Realm.Configuration(schemaVersion: 2) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: UserModel.className()) { _, newObject in
//                    newObject![""] = List<UserModel>()
                }
            }
        }
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}
