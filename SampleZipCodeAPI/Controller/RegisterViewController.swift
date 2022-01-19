//
//  RegisterViewController.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    private let indicator = UIActivityIndicatorView()
    
    @IBOutlet private weak var inputTextView: InputTextView!
    @IBOutlet private weak var registerView: RegisterButtonView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupIndicator()
        searchAddress()
        setupRegister()
    }
    
    private func searchAddress() {
        inputTextView.searchAddressBlock = { [weak self] zipCode in
            guard let self = self else { return }
            
            self.indicator.startAnimating()
            
            ZipCodeManager.fetchAddress(zipCode: zipCode) { [weak self] addressEntity in
                guard let self = self else { return }
                
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.indicator.stopAnimating()
                }
                
                let statusCode = addressEntity.statusCode
                switch statusCode {
                case 200:
                    self.inputTextView.setAddressFromZipCode(entity: addressEntity)
                case 400:
                    self.inputTextView.setErrorMessage(text: ErrorMessageType.invalidInputText.rawValue)
                case 500:
                    self.inputTextView.setErrorMessage(text: ErrorMessageType.systemError.rawValue)
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
    
    private func setupIndicator() {
        indicator.center = view.center
        indicator.style = .large
        indicator.color = .gray
        view.addSubview(indicator)
    }
}
