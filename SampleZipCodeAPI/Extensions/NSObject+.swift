//
//  NSObject+.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import Foundation

extension NSObject {
    static var className: String {
        String(describing: self)
    }
}
