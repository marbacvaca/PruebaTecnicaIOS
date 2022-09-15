//
//  SignInModuleInteractor.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation
import FirebaseAuth

protocol SignUpModuleInteractorProtocol: AnyObject {
    func executeSignUp(email: String, password: String)
}

class SignUpModuleInteractor {
    weak var presenter: SignUpModulePresenterProtocol?

}

private extension SignUpModuleInteractor {
    func makeLogin(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (_, error) in
            guard let self = self else { return }
            if let authError = error {
                self.presenter?.handleError(error: authError)
            } else {
                self.presenter?.showHome()
            }
        }
    }
}

extension SignUpModuleInteractor: SignUpModuleInteractorProtocol {
    func executeSignUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (_, error) in
            guard let self = self else { return }
            if let signUpError = error {
                let appError = AppErrors.checkErrorCode((signUpError as NSError).code)
                self.presenter?.handleError(error: appError)
            } else {
                self.makeLogin(email: email, password: password)
            }
        }
    }
}
