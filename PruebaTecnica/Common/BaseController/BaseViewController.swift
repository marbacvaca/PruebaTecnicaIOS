//
//  BaseViewController.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation
import UIKit

protocol LoaderProtocol: AnyObject {
    func showLoader()
    func removeLoader()
}

class BaseViewController: UIViewController {
    lazy var loader = LoaderView()
}

extension BaseViewController: LoaderProtocol {
    func showLoader() {
        loader.addFullScreenActivityIndicator(view: self.view)
    }
    
    func removeLoader() {
        loader.removeFullScreenActivityIndicator()
    }
}
