//
//  SignUpModuleViewController.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 12/09/22.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

protocol SignUpModuleViewControllerProtocol: LoaderProtocol {
    var password: String { get }
    var email: String { get }
    
    func showError(error: Error)
}

class SignUpModuleViewController: BaseViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccount: UIButton!
    
    private let viewPresenter: SignUpModulePresenterProtocol

    required init(presenter: SignUpModulePresenterProtocol) {
        self.viewPresenter = presenter
        super.init(nibName: SignUpModuleViewController.typeName,
                   bundle: Bundle(for: SignUpModuleViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confTextField()
        confSignUpbutton()
    }
   
    @IBAction func signUpButtonAction(_ sender: Any) {
        viewPresenter.makeRegistration()
    }
    
    func confSignUpbutton() {
         createAccount.setTitle("Regístrarme", for: .normal)
         createAccount.layer.cornerRadius = 12
         createAccount.setTitleColor(.white, for: .normal)
         createAccount.backgroundColor = UIColor(red: 104/256, green: 200/256, blue: 199/256, alpha: 1.0)
    }
   
    func confTextField() {
        emailTextField.placeholder = "Correo electrónico"
        passwordTextField.placeholder = "Contraseña"
        let myColor = UIColor.gray
        emailTextField.layer.borderColor = myColor.cgColor
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.cornerRadius = 4
        passwordTextField.layer.borderColor = myColor.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 4
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension SignUpModuleViewController: SignUpModuleViewControllerProtocol {
    var password: String {
        return passwordTextField.text ?? ""
    }
    
    var email: String {
        return emailTextField.text ?? ""
    }
    
    func showError(error: Error) {
        showAlert(with: error)
    }
}

extension SignUpModuleViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
