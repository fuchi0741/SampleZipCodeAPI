//
//  PersonalInfoEntity.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/23.
//

import Foundation
import RealmSwift

/// Realmに保存
struct PersonalInfoEntityList {
    static var list = [PersonalInfoEntity]()
}

class PersonalInfoEntity: Object {
    @Persisted var name: String
    @Persisted var phoneNum: String
    @Persisted var address: String
    
    func setup(name: String, phoneNum: String, address: String) {
        self.name = name
        self.phoneNum = phoneNum
        self.address = address
    }
}
