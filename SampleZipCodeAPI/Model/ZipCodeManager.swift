//
//  ZipCodeManager.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/09.
//

import Foundation

struct ZipCodeManager {
    static func fetchAddress(zipCode: String) {
        let baseURL = "https://zipcloud.ibsnet.co.jp/api/search"
        
        guard var urlComponents = URLComponents(string: baseURL) else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "zipcode", value: zipCode),
        ]
        
        print("😆", urlComponents)
    }
}
