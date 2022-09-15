//
//  SignInModuleRouter.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation
import UIKit

protocol SignUpModuleRouterProtocol: AnyObject {
    func showHome()
}

class SignUpModuleRouter {
    weak var view: UIViewController?
}

extension SignUpModuleRouter: SignUpModuleRouterProtocol {
    func showHome() {
        HomeModuleFactory.showHome()
    }
}
