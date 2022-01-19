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
                
                let statusCode = addressEntity.statusCode
                switch statusCode {
                case 200:
                    self.inputTextView.setAddressFromZipCode(entity: addressEntity)
                case 400:
                    self.inputTextView.setErrorMessage(text: "郵便番号を7桁の数字で入力してください。")
                case 500:
                    self.inputTextView.setErrorMessage(text: "システムメンテナンス中です。時間をおいてお試しください。")
                default:
                    print("想定外のステータスコード")
                }
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
