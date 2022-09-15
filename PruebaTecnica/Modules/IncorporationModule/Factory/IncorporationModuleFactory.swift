//
//  IncorporationModuleFactory.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 14/09/22.
//

import UIKit

public class IncorporationModuleFactory {
    
    public static func build() -> UIViewController {
        let router = IncorporationModuleRouter()
        let presenter = IncorporationModulePresenter(router: router)

        let view = IncorporationModuleViewController(presenter: presenter)
        
        presenter.view = view
        router.view = view
        
        return view
    }
}
