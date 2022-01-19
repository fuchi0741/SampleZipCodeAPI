//
//  ErrorMessageType.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/20.
//

import Foundation

enum ErrorMessageType: String {
    case notFound = "一致する住所が存在しません。"
    case invalidInputText = "郵便番号を7桁の数字で入力してください。"
    case systemError = "システムメンテナンス中です。時間をおいてお試しください。"
}
