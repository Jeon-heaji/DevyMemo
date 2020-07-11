//
//  MainView.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/05.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class MemoListView: UIView {
  
  lazy var tableView: UITableView = {
    let tb = UITableView()
    tb.backgroundColor = .clear
    tb.separatorStyle = .none
    tb.isScrollEnabled = true
    tb.showsVerticalScrollIndicator = false
    tb.register(MainCell.self, forCellReuseIdentifier: MainCell.identifier)
    return tb
  }()
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    addSubViews()
    setupSNP()
    
  }
  
  private func addSubViews() {
    [tableView]
      .forEach { self.addSubview($0) }
    
  }
  
  private func setupSNP() {
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  

}
