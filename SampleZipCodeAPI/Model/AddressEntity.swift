//
//  AddressEntity.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/10.
//

import Foundation

struct AddressEntity: Decodable {
    let statusCode: Int
    let errorMessage: String?
    let address: [Address]?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status"
        case errorMessage = "message"
        case address = "results"
    }
}

struct Address: Decodable {
    let address1: String
    let address2: String
    let address3: String
}
