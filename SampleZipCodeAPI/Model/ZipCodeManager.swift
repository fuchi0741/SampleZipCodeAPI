//
//  ZipCodeManager.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/09.
//

import Foundation

struct ZipCodeManager {
    static func fetchAddress(zipCode: String, completion: @escaping () -> Void) {
        let baseURL = "https://zipcloud.ibsnet.co.jp/api/search"
         
        guard var urlComponents = URLComponents(string: baseURL) else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "zipcode", value: zipCode),
        ]
                
        guard let requestURL = urlComponents.url else { return }
        
        
        let task = URLSession.shared.dataTask(with: requestURL) { jsonData, _, error in
            print("レスポンス")
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let jsonData = jsonData else { return }
            
            do {
                let entity = try JSONDecoder().decode(AddressEntity.self, from: jsonData)
                completion()
                print("😆", entity)
            } catch {
                print("😱", error.localizedDescription)
            }
        }
        print("リクエスト")
        task.resume()
    }
}
