//
//  UITableView+.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/05.
//

import UIKit

extension UITableView {
    func register<T>(cellType: T.Type) where T: UITableViewCell {
        let className = T.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
}
