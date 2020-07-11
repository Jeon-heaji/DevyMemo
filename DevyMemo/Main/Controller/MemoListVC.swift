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
  
  let memoListView = MemoListView()
  
  var token: NSObjectProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .appColor(.whiteTwo)
    
   
    setupNavi()
    addSubViews()
    setupSNP()
    
    memoListView.tableView.dataSource = self
    memoListView.tableView.delegate = self
    
//  token =  NotificationCenter.default.addObserver(forName: ComposeVC.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
//      memoListView.tableView.reloadData()
//    }
    // 네번째 파라미터로 전달한 쓰레드가 세
  }
  
//  deinit {
//    if let token = token {
//      NotificationCenter.default.removeObserver(token)
//    }
//  }
  // deinit으로
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    memoListView.tableView.reloadData()
//    print(#function)
  }
  
  private func addSubViews() {
    [memoListView]
      .forEach { view.addSubview($0) }
    
  }
  
  private func setupSNP() {
    memoListView.snp.makeConstraints {
//      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  func setupNavi() {
    title = "DevyMemo"
    
    navigationController?.navigationBar.prefersLargeTitles = true

    let rightBtn = UIBarButtonItem(image: UIImage(named: "picADD"), style: .done, target: self, action: #selector(didTapRightBtn))
    rightBtn.tintColor = .appColor(.gr1)
    
    navigationItem.rightBarButtonItem = rightBtn

    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "GmarketSansTTFBold", size: 35.i) ?? UIFont()]
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "NanumSquareR", size: 15.i) ?? UIFont()]
    
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .appColor(.whiteTwo)
    
  }
  
  @objc func didTapRightBtn(_ sender: UIButton) {
    let composeVC = ComposeVC()
    composeVC.modalPresentationStyle = .overFullScreen
//    self.present(composeVC, animated: true, completion: nil)
    navigationController?.pushViewController(composeVC, animated: true)
  }
  
}

extension MemoListVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Memo.dummyMemoList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MemoListCell.identifier, for: indexPath) as! MemoListCell
   let target = Memo.dummyMemoList[indexPath.row]
    cell.memoLabel.text = target.content
    cell.dateLabel.text = target.insertDate.description
    cell.selectionStyle = .none
    return cell
  }
  
  
}

extension MemoListVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let memoDetailVC = MemoDetailVC()
    memoDetailVC.title = ""
    navigationController?.pushViewController(memoDetailVC, animated: true)
  }
}
