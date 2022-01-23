//
//  PersonalInfoEntity.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/23.
//

import Foundation

struct PersonalInfoEntityList {
    static var list = [PersonalInfoEntity]()
}

struct PersonalInfoEntity {
    let name: String
    let phoneNum: String
    let address: String
}
