//
//  ComposeView.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/06.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import UIKit
import SnapKit

class ComposeView: UIView {
  
  let textView: UITextView = {
    let tv = UITextView()
    tv.textColor = .appColor(.gr1)
    tv.backgroundColor = .appColor(.whiteTwo)
    tv.isEditable = true
    let style = NSMutableParagraphStyle()
    style.lineSpacing = 6.i
    let attributedString = NSMutableAttributedString(
      string: "자세한 수정사항을 입력해주세요!",
      attributes: [
        .font: UIFont(name: "NanumSquareR", size: 17.i) ?? UIFont(),
        .foregroundColor: UIColor.appColor(.gr1),
        .kern: 0.0,
        .paragraphStyle: style
      ]
    )
    tv.attributedText = attributedString
    tv.isScrollEnabled = true
    tv.textContainer.lineFragmentPadding = 0
    return tv
  }()
  

  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    self.backgroundColor = .appColor(.whiteTwo)
    addSubViews()
    setupSNP()
    
  }
  
  private func addSubViews() {
    [textView]
      .forEach { self.addSubview($0) }
    
  }
  
  private func setupSNP() {
    textView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview().inset(20.i)
      
    }
  }


}
