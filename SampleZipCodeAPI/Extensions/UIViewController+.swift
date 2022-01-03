//
//  UIViewController+.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import UIKit

extension UIViewController {
    /// モーダル遷移
    /// - Parameter viewControllerName: 遷移先のVC名
    func modalTransition(to viewControllerName: String) {
        let storyboard = UIStoryboard(name: viewControllerName, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: viewControllerName)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
