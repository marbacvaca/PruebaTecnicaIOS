//
//  AuthModuleFactory.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import UIKit

public class AuthModuleFactory {
    
    public static func build() -> UIViewController {
        let router = AuthModuleRouter()
        let interactor = AuthModuleInteractor()
        let presenter = AuthModulePresenter(interactor: interactor,
                                            router: router)
        
        let view = AuthModuleViewController(presenter: presenter)
        
        presenter.view = view
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
}
