//
//  PersonalInfoListViewController.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import UIKit

final class PersonalInfoListViewController: UIViewController {
        
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: PersonalInfoView.self)
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didTapAddButton(_ sender: UIBarButtonItem) {
        modalTransition(to: RegisterViewController.className)
    }
}

extension PersonalInfoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: 後のタスクにて実装予定
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoView.className, for: indexPath)
        return cell
    }
}
