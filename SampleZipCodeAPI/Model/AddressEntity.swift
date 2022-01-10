//
//  AddressEntity.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/10.
//

import Foundation

struct AddressEntity: Decodable {
    let status: Int
    let message: String?
    let results: [Results]?
}

struct Results: Decodable {
    let address1: String
    let address2: String
    let address3: String
    let kana1: String
    let kana2: String
    let kana3: String
    let prefcode: String
    let zipcode: String
}
