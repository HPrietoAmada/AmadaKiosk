//
//  DBManager.swift
//  AmadaKiosk
//
//  Created by HPrietoAmada on 6/10/20.
//  Copyright © 2020 IT Support. All rights reserved.
//

import Foundation

typealias StatusReturned = (_ error: NSError) -> Void
typealias DataReturned<T:Encodable> = (_ model: T?, _ error: NSError) -> Void

struct DBManager {
    static let shared = DBManager()
}
