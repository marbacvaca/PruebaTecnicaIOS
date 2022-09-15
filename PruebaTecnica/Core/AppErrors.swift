//
//  AppErrors.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 15/09/22.
//

import Foundation

enum AppErrors: Error {
    case invalidFormat
    case noMail
    case unknownError
    case passwordLengthError
    case duplicatedAccount

    static func checkErrorCode(_ errorCode: Int) -> AppErrors {
        switch errorCode {
        case 17008:
            return .invalidFormat
        case 17011:
            return .noMail
        case 17026:
            return .passwordLengthError
        case 17007:
            return .duplicatedAccount
        default:
            return .unknownError
        }
    }
}

extension AppErrors: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .unknownError:
            return "Ocurrio un error al autenticar este usuario."
        case .invalidFormat:
            return "Formato de mail invalido."
        case .noMail:
            return "No encontramos esos datos de la cuenta."
        case .passwordLengthError:
            return "La contraseña debe tener mas de 6 caracteres"
        case .duplicatedAccount:
            return "Este mail ya esta en uso."
        }
    }
}
