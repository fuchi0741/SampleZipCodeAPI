//
//  InputTextView.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/08.
//

import UIKit

final class InputTextView: UIView {
    
    var searchAddressBlock: ((String) -> Void)? 
    
    @IBOutlet private weak var nameTextFiled: UITextField!
    @IBOutlet private weak var phoneNumTextField: UITextField!
    @IBOutlet private weak var zipCodeTextField: UITextField!
    @IBOutlet private weak var mainAddressTextField: UITextField!
    @IBOutlet private weak var subAddressTextField: UITextField!
    @IBOutlet private weak var errorMessageLabel: UILabel!
    @IBOutlet private weak var searchAddressButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    func setAddressFromZipCode() {
        print("mainAddressTextFieldのtextプロパティにレスポンスで帰ってきた値を入れる")
    }
    
    @IBAction private func didTapSearchAddressButton(_ sender: UIButton) {
        guard let zipCodeText = zipCodeTextField.text else { return }
        searchAddressBlock?(zipCodeText)
    }
    
    private func loadNib() {
        guard let view = Bundle.main.loadNibNamed(InputTextView.className, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        setup()
        self.addSubview(view)
    }

    private func setup() {
        errorMessageLabel.isHidden = true
        searchAddressButton.layer.cornerRadius = 6.0
    }
}
