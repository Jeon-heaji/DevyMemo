//
//  ComposeVC.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/06.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class ComposeVC: UIViewController {
  
  let composeView = ComposeView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .appColor(.whiteTwo)
    navigationController?.navigationBar.isHidden = false
    
    setupNavi()
    addSubViews()
    setupSNP()
    
  }
  
  private func addSubViews() {
    [composeView]
      .forEach { view.addSubview($0) }
    
  }
  
  private func setupSNP() {
    composeView.snp.makeConstraints {
//      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  private func setupNavi() {
    title = "New Memo"
    
    navigationController?.navigationBar.prefersLargeTitles = false
    
    let leftBtn = UIBarButtonItem(image: UIImage(named: "bk"), style: .done, target: self, action: #selector(didTapLeftBtn(_:)))
    leftBtn.tintColor = .appColor(.aBk)
    navigationItem.leftBarButtonItem = leftBtn
    
    let rightBtn = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapRightBtn(_:)))
    rightBtn.tintColor = .appColor(.aBl)
    rightBtn.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "NanumSquareR", size: 15.i) ?? UIFont()], for: .normal)
    navigationItem.rightBarButtonItem = rightBtn
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "NanumSquareR", size: 15.i) ?? UIFont()]
    
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .appColor(.whiteTwo)
    
  }
  
  @objc func didTapLeftBtn(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
    //    navigationController?.popToRootViewController(animated: true)
    
  }
  
  @objc func didTapRightBtn(_ sender: UIButton) {
    
    guard let memo = composeView.textView.text, memo.count > 0 else {
      alert(message: "메모를 입력하세요!")
      return
    }
    
    let newMemo = Memo(content: memo)
    Memo.dummyMemoList.append(newMemo)
    
    // sheet를 내릴때
//    NotificationCenter.default.post(name: ComposeVC.newMemoDidInsert, object: nil)
    
    navigationController?.popViewController(animated: true)
    
  }
  
  
  
}

//extension ComposeVC {
//  // notification 통해 sheet를 내려준다
//  static let newMemoDidInsert = Notification.Name("newMemoDidInsert")
//
//}
