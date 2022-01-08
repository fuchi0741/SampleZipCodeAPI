//
//  RegisterButtonView.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/08.
//

import UIKit

final class RegisterButtonView: UIView {
    
    var registerButtonBlock: (() -> Void)?
    var cancelButtonBlock: (() -> Void)?
    
    @IBOutlet private var buttons: [UIButton]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    @IBAction private func didTapRegisterButton(_ sender: UIButton) {
        registerButtonBlock?()
    }
    
    @IBAction private func didTapCancelButton(_ sender: UIButton) {
        cancelButtonBlock?()
    }

    private func loadNib() {
        guard let view = Bundle.main.loadNibNamed(RegisterButtonView.className, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        setup()
        self.addSubview(view)
    }

    private func setup() {
       setupButtons()
    }
    
    private func setupButtons() {
        buttons.forEach {
            $0.layer.cornerRadius = 6.0
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
}
