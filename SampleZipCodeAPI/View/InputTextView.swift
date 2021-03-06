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
    
    func setAddressFromZipCode(entity: AddressEntity) {
        guard let address = entity.address?.first else {
            setErrorMessage(text: ErrorMessageType.notFound.rawValue)
            return
        }
        
        let mainAddress = address.address1 + address.address2 + address.address3
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.errorMessageLabel.isHidden = true
            self.mainAddressTextField.text = mainAddress
        }
    }
    
    func setErrorMessage(text: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.errorMessageLabel.text = text
            self.errorMessageLabel.isHidden = false
        }
    }
    
    func addPersonalInfo() {
        guard let name = nameTextFiled.text,
              let phoneNum = phoneNumTextField.text,
              let mainAddress = mainAddressTextField.text,
              let subAddress = subAddressTextField.text else { return }
       
        let address = mainAddress + subAddress
        
        let entity = PersonalInfoEntity()
        entity.setup(name: name,
                     phoneNum: phoneNum,
                     address: address)
        
        RealmManager.savePersonalInfo(entity: entity)
    }
    
    @IBAction private func didTapSearchAddressButton(_ sender: UIButton) {
        guard let zipCodeText = zipCodeTextField.text?.trimmingCharacters(in: .whitespaces) else { return }
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
