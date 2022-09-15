//
//  SignInModuleFactory.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import UIKit

public class SignUpModuleFactory {
    
    public static func build() -> UIViewController {
        let router = SignUpModuleRouter()
        let interactor = SignUpModuleInteractor()
        let presenter = SignUpModulePresenter(interactor: interactor,
                                              router: router)
        
        let view = SignUpModuleViewController(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
