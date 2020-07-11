//
//  MemoDetailVC.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/07.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class MemoDetailVC: UIViewController {
  
  let memoDetailView = MemoDetailView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .appColor(.whiteTwo)
    navigationController?.navigationBar.isHidden = false
    
    setupNavi()
    addSubViews()
    setupSNP()
    
  }
  
  private func addSubViews() {
    [memoDetailView]
      .forEach { view.addSubview($0) }
    
  }
  
  private func setupSNP() {
    memoDetailView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  private func setupNavi() {
    navigationController?.navigationBar.prefersLargeTitles = false
    
    let leftBtn = UIBarButtonItem(image: UIImage(named: "backButton"), style: .done, target: self, action: #selector(didTapLeftBtn(_:)))
    leftBtn.tintColor = .appColor(.aBk)
    navigationItem.leftBarButtonItem = leftBtn
 
    
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .appColor(.whiteTwo)
    
  }
  
  @objc func didTapLeftBtn(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
    //    navigationController?.popToRootViewController(animated: true)
    
  }
  

  
}
