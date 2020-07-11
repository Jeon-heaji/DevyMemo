//
//  MemoDetailView.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/07.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class MemoDetailView: UIView {
  
  lazy var tableView: UITableView = {
    let tb = UITableView()
    tb.backgroundColor = .clear
    tb.separatorStyle = .singleLine
    tb.isScrollEnabled = true
    tb.showsVerticalScrollIndicator = false
//    tb.register(MemoListCell.self, forCellReuseIdentifier: MemoListCell.identifier)
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
