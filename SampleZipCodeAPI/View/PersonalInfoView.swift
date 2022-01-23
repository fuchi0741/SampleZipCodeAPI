//
//  PersonalInfoView.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import UIKit

final class PersonalInfoView: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneNumLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    
    func setPersonalInfo(name: String, phoneNum: String, address: String) {
        nameLabel.text = "名前:\(name)"
        phoneNumLabel.text = "TEL:\(phoneNum)"
        addressLabel.text = "住所:\(address)"
    }
}
