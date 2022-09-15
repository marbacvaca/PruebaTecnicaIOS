//
//  SignInModulePresenter.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation

protocol SignUpModulePresenterProtocol: AnyObject {
    func showHome()
    func handleError(error: Error)
    
    func makeRegistration()
}

class SignUpModulePresenter {
    weak var view: SignUpModuleViewControllerProtocol?
    private let interactor: SignUpModuleInteractorProtocol
    private let router: SignUpModuleRouterProtocol

    init(interactor: SignUpModuleInteractorProtocol,
         router: SignUpModuleRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension SignUpModulePresenter: SignUpModulePresenterProtocol {
    func makeRegistration() {
        guard let email = view?.email,
              let password = view?.password,
              let name = view?.nombre,
                !email.isEmpty, !password.isEmpty,!name.isEmpty else {
            view?.showError(error: AppErrors.unfilledFields)
            return
        }
        
        if password.isValidPassword() {
            view?.showLoader()
            interactor.executeSignUp(email: email, password: password)
        } else {
            view?.showError(error: AppErrors.passwordFormat)
        }
    }
    
    
    func showHome() {
        view?.removeLoader()
        router.showHome()
    }
    
    func handleError(error: Error) {
        view?.removeLoader()
        view?.showError(error: error)
    }
}

