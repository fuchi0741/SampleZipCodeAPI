//
//  RealmManager.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/30.
//

import Foundation
import RealmSwift

struct RealmManager {
    static func savePersonalInfo(entity: PersonalInfoEntity) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(entity)
            }
        } catch {
            print("Realmに永続化するデータ生成処理失敗")
        }
    }
    
    static func getSavedPersonalInfoCount() -> Int {
        let realm = try! Realm()
        return realm.objects(PersonalInfoEntity.self).count
    }
    
    static func getSavedPersonalInfoEntity(completion: (Results<PersonalInfoEntity>) -> Void) {
        let realm = try! Realm()
        let savedDataList = realm.objects(PersonalInfoEntity.self)
        completion(savedDataList)
    }
}
