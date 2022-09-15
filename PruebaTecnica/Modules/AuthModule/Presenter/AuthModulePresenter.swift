//
//  AuthModulePresenter.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import Foundation

protocol AuthModulePresenterProtocol: AnyObject {
    func showHome()
    func handleError(error: AppErrors)
    
    func didTapLogin()
    func didTapSignUp()
}

class AuthModulePresenter {
    weak var view: AuthModuleViewControllerProtocol?
    private let interactor: AuthModuleInteractorProtocol
    private let router: AuthModuleRouterProtocol

    init(interactor: AuthModuleInteractorProtocol,
         router: AuthModuleRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension AuthModulePresenter: AuthModulePresenterProtocol {
    func showHome() {
        view?.removeLoader()
        router.showHome()
    }
    
    func handleError(error: AppErrors) {
        view?.removeLoader()
        view?.showError(error: error)
    }
    
    func didTapLogin() {
        guard let email = view?.email,
              let password = view?.password,
              !email.isEmpty, !password.isEmpty else { return }
        
        view?.showLoader()
        interactor.executeLogin(email: email, password: password)
    }
    
    func didTapSignUp() {
        router.showSignUp()
    }
}
