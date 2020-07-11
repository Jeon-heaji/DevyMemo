//
//  UINavigationBar.swift
//  DevyMemo
//
//  Created by VIVA_DEV_IOS on 2020/07/05.
//  Copyright © 2020 SooAhJeon. All rights reserved.
//

import Foundation
import UIKit

typealias UINavigationController = _FullScreenModalNavigationController

class _FullScreenModalNavigationController: UIKit.UINavigationController {
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.modalPresentationStyle = .fullScreen
    self.navigationBar.setTitleVerticalPositionAdjustment(-1.5, for: UIBarMetrics.default)
  }
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    self.modalPresentationStyle = .fullScreen
    self.navigationBar.setTitleVerticalPositionAdjustment(-1.5, for: UIBarMetrics.default)
  }
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    self.modalPresentationStyle = .fullScreen
    self.navigationBar.setTitleVerticalPositionAdjustment(-1.5, for: UIBarMetrics.default)
  }
}
