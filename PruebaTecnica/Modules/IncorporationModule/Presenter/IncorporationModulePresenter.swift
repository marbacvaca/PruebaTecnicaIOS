//
//  IncorporationModulePresenter.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import Foundation

protocol IncorporationModulePresenterProtocol: AnyObject {
    func didTapLogin()
}

class IncorporationModulePresenter {
    weak var view: IncorporationModuleViewControllerProtocol?
    private let router: IncorporationModuleRouterProtocol

    init(router: IncorporationModuleRouterProtocol) {
        self.router = router
    }
}

extension IncorporationModulePresenter: IncorporationModulePresenterProtocol {
    func didTapLogin() {
        router.showLoginScreen()
    }
}
