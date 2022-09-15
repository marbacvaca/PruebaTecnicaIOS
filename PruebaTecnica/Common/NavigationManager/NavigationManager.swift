//
//  NavigationManager.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation
import UIKit

class NavigationManager {
    
    static let rootViewAnimationDuration = 0.65
    
    class func setDisplayedController(controller: UIViewController) {
        let window = UIApplication.shared.keyWindow
        let snapshotView = window?.snapshotView(afterScreenUpdates: true)
        
        if let snap = snapshotView {
            controller.view.addSubview(snap)
        }
        
        window?.rootViewController = controller
        UIView.animate(withDuration: rootViewAnimationDuration, animations: {
            snapshotView?.alpha = 0
        }, completion: {
            (value: Bool) in
            snapshotView?.removeFromSuperview()
        })
    }
}
