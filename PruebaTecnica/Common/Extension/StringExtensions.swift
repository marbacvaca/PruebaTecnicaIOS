//
//  StringExtensions.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation
import UIKit

extension String {
    public func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
}

