//
//  InputTextView.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/08.
//

import UIKit

final class InputTextView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    private func loadNib() {
        guard let view = Bundle.main.loadNibNamed(InputTextView.className, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        setup()
        self.addSubview(view)
    }

    private func setup() {
       
    }
}
