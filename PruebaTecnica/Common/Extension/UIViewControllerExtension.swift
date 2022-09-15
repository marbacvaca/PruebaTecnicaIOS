//
//  UIViewControllerExtension.swift
//  PruebaTecnica
//
//  Created by CSA MEX  on 14/09/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    static var typeName: String {
        return String(describing: self)
    }
    
    public var currentNavigationController: UINavigationController? {
        if let navigationController = self.navigationController {
            return navigationController
        } else if let nav = self.presentedViewController as? UINavigationController {
            return nav
        } else {
            return nil
        }
    }
    
    public func showAlert(with error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
    }
    
    public func showAlert(title: String, message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
        present(alertViewController, animated: true, completion: nil)
    }
}
