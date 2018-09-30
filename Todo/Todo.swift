//
//  Todo.swift
//  Todo
//
//  Created by ken on 2018/10/01.
//  Copyright © 2018 skyloken. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var text = ""
    @objc dynamic var memo = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}

