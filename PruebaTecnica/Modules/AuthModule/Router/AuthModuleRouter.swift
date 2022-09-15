//
//  AuthModuleRouter.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import Foundation
import UIKit

protocol AuthModuleRouterProtocol: AnyObject {
    func showHome()
    func showSignUp()
}

class AuthModuleRouter {
    weak var view: UIViewController?
}

extension AuthModuleRouter: AuthModuleRouterProtocol {
    func showHome() {
        HomeModuleFactory.showHome()
    }
    
    func showSignUp() {
        guard let navigation = view?.currentNavigationController else { return }

        let viewController = SignUpModuleFactory.build()
        navigation.pushViewController(viewController, animated: true)
    }
}
