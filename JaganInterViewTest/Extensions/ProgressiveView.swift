//
//  ProgressiveView.swift
//  JaganInterViewTest
//
//  Created by Ammulu on 20/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import UIKit
import Foundation
import MBProgressHUD
import QuartzCore

extension UIViewController {

func showHud(_ message: String) {
    let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
    hud.label.text = message
    hud.isUserInteractionEnabled = false
}

func hideHUD() {
    MBProgressHUD.hide(for: self.view, animated: true)
}
    
 }
