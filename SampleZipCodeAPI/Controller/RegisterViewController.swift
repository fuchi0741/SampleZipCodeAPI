//
//  RegisterViewController.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var inputTextView: InputTextView!
    @IBOutlet private weak var registerView: RegisterButtonView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchAddress()
        setupRegister()
    }
    
    private func searchAddress() {
        inputTextView.searchAddressBlock = { [weak self] zipCode in
            guard let self = self else { return }
            
            ZipCodeManager.fetchAddress(zipCode: zipCode) { [weak self] addressEntity in
                guard let self = self else { return }
                self.inputTextView.setAddressFromZipCode(entity: addressEntity)
            }
        }
    }
    
    private func setupRegister() {
        registerView.registerButtonBlock = { [weak self] in
            guard let self = self else { return }
            
            self.dismiss(animated: true, completion: nil)
        }
        
        registerView.cancelButtonBlock = { [weak self] in
            guard let self = self else { return }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
