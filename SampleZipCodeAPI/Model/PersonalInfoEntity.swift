//
//  PersonalInfoEntity.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/23.
//

import Foundation
import RealmSwift

struct PersonalInfoEntityList {
    static var list = [PersonalInfoEntity]()
}

class PersonalInfoEntity: Object {
    @Persisted var name: String
    @Persisted var phoneNum: String
    @Persisted var address: String
}
