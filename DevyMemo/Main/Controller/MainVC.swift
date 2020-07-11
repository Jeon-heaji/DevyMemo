//
//  MainVC.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/05.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class MemoListVC: UIViewController {
  
  let mainView = MainView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .appColor(.whiteTwo)
    
   
    setupNavi()
    addSubViews()
    setupSNP()
    
    mainView.tableView.dataSource = self
    mainView.tableView.delegate = self
    
    
  }
  
  private func addSubViews() {
    [mainView]
      .forEach { view.addSubview($0) }
    
  }
  
  private func setupSNP() {
    mainView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  func setupNavi() {
    title = "DevyMemo"
    navigationController?.navigationBar.prefersLargeTitles = true
    
    let leftBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .done, target: self, action: #selector(didTapLeftBtn))
    leftBtn.tintColor = .appColor(.aBk)
    navigationItem.leftBarButtonItem = leftBtn
    
    let rightBtn = UIBarButtonItem(image: UIImage(named: "picADD"), style: .done, target: self, action: #selector(didTapRightBtn))
    rightBtn.tintColor = .appColor(.aBk)
    navigationItem.rightBarButtonItems = [rightBtn]

    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "JalnanOTF", size: 15.i) ?? UIFont()]
    
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .appColor(.whiteTwo)
    
  }
  
  @objc func didTapLeftBtn(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
    //    navigationController?.popToViewController(doctorCardListVC, animated: true)
    
  }
  
  @objc func didTapRightBtn(_ sender: UIButton) {
    print("didTapRightBtn")
    //    navigationController?.popViewController(animated: true)
    //    navigationController?.popToViewController(doctorCardListVC, animated: true)
    
  }
  
}

extension MemoListVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.identifier, for: indexPath) as! MainCell
    
    cell.selectionStyle = .none
    return cell
  }
  
  
}

extension MemoListVC: UITableViewDelegate {
  
}
