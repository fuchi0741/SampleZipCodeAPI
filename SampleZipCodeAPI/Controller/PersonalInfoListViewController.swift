//
//  PersonalInfoListViewController.swift
//  SampleZipCodeAPI
//
//  Created by 渕一真 on 2022/01/03.
//

import UIKit
import RealmSwift

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction private func didTapAddButton(_ sender: UIBarButtonItem) {
        modalTransition(to: RegisterViewController.className)
    }
}

extension PersonalInfoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        return realm.objects(PersonalInfoEntity.self).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonalInfoView.className, for: indexPath) as? PersonalInfoView else { return UITableViewCell() }
        let realm = try! Realm()
        let savedDataList = realm.objects(PersonalInfoEntity.self)
        let entity = savedDataList[indexPath.row]
        cell.setPersonalInfo(name: entity.name,
                             phoneNum: entity.phoneNum,
                             address: entity.address)
        return cell
    }
}
