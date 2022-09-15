//
//  HomeModuleViewController.swift
//  PruebaTecnica
//
//  Created by CSA MEX  on 15/09/22.
//

import Foundation

class HomeModuleViewController: BaseViewController {

    required init() {
        super.init(nibName: HomeModuleViewController.typeName,
                   bundle: Bundle(for: HomeModuleViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
