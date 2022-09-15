//
//  HomeModuleFactory.swift
//  PruebaTecnica
//
//  Created by CSA MEX  on 15/09/22.
//

import UIKit

public class HomeModuleFactory {
    
    public static func showHome() {
        let view = HomeModuleViewController()

        NavigationManager.setDisplayedController(controller: view)
    }
}
