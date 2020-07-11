//
//  MainCell.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/05.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class MemoListCell: UITableViewCell {
  
  static let identifier = "MemoListCell"
  
  let memoLabel: UILabel = {
    let label = UILabel()
    label.textColor = .appColor(.aBk)
    label.font = UIFont(name: "NanumSquareR", size: 15.i)
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .appColor(.gr1)
    label.font = UIFont(name: "NanumSquareR", size: 13.i)
    return label
  }()

  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    self.backgroundColor = .appColor(.whiteTwo)
    addSubViews()
    setupSNP()
    
  }
  
  private func addSubViews() {
    [memoLabel, dateLabel]
      .forEach { self.addSubview($0) }
    
  }
  
  private func setupSNP() {
    memoLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(15.i)
      $0.leading.equalToSuperview().offset(25.i)
    }
    
    dateLabel.snp.makeConstraints {
      $0.top.equalTo(memoLabel.snp.bottom).offset(10.i)
      $0.leading.equalTo(memoLabel)
      $0.bottom.equalToSuperview().offset(-15.i)
    }
    
  }

}
