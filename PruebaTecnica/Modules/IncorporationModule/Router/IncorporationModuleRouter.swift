//
//  IncorporationModuleRouter.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import Foundation
import UIKit

protocol IncorporationModuleRouterProtocol: AnyObject {
    func showLoginScreen()
}

class IncorporationModuleRouter {
    weak var view: UIViewController?
}

extension IncorporationModuleRouter: IncorporationModuleRouterProtocol {
    func showLoginScreen() {
        guard let navigation = view?.currentNavigationController else { return }
        let viewController = AuthModuleFactory.build()
        navigation.pushViewController(viewController, animated: true)
    }
}
