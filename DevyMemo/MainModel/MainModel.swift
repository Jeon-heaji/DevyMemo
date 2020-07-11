//
//  MainModel.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/05.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import Foundation

class Memo {
  var content: String
  var insertDate: Date
  
  init(content: String) {
    self.content = content
    insertDate = Date()     // 현재 날짜를 바로 받으면 되니까 별도의 파라미터는 필요 없음
  }
  
  static var dummyMemoList = [
    Memo(content: "Lorem Ipsum"),
    Memo(content: "Devy Memo + 😍"),
    
  ]
   
  
}
