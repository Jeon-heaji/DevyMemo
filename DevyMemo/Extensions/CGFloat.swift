//
//  CGFloat.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/05.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
  
  var iOS: CGFloat {
    let width = UIScreen.main.bounds.width
    let ratio = self / 375
    return ceil(width * ratio)
  }

}
