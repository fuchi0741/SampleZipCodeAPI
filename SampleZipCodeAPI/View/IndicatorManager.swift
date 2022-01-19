//
//  IndicatorManager.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/20.
//

import UIKit

struct IndicatorManager {
    /// 画面中央に表示するインジケータを初期化
    /// - Parameters:
    ///   - indicator: インジケータのインスタンス
    ///   - view: インジケータを表示するView
    static func prepare(at indicator: UIActivityIndicatorView,
                        in view: UIView) {
        indicator.center = view.center
        indicator.style = .large
        indicator.color = .gray
        view.addSubview(indicator)
    }
}
