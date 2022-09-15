//
//  AuthModuleInteractor.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import Foundation
import FirebaseAuth

protocol AuthModuleInteractorProtocol: AnyObject {
    func executeLogin(email: String, password: String)
}

class AuthModuleInteractor {
    weak var presenter: AuthModulePresenterProtocol?

}

extension AuthModuleInteractor: AuthModuleInteractorProtocol {
    func executeLogin(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (_, error) in
            guard let self = self else { return }
            if let authError = error {
                let appError = AppErrors.checkErrorCode((authError as NSError).code)
                self.presenter?.handleError(error: appError)
            } else {
                self.presenter?.showHome()
            }
        }
    }
}
