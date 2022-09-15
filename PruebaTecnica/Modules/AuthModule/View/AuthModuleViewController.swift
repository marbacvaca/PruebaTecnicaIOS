//
//  AuthModuleViewController.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 12/09/22.
//

import UIKit

protocol AuthModuleViewControllerProtocol: LoaderProtocol {
    var password: String { get }
    var email: String { get }
    
    func showError(error: Error)
}

class AuthModuleViewController: BaseViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signOnLabel: UILabel!
    @IBOutlet weak var forgetMyPassword: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTexField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorContainer: UIView!
    @IBOutlet weak var errorContainerLabel: UILabel!

    private let viewPresenter: AuthModulePresenterProtocol

    required init(presenter: AuthModulePresenterProtocol) {
        self.viewPresenter = presenter
        super.init(nibName: AuthModuleViewController.typeName,
                   bundle: Bundle(for: AuthModuleViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Autenticaciòn"

        confSignUpBButton()
        confSingOnLabel()
        confTextField()
        setupErrorContainer()
    }
    
    func confSignUpBButton() {
        signUpButton.setTitle("!Regístrate!", for: .normal)
        signUpButton.setTitleColor(UIColor.getCustomButtonColor(), for: .normal)
        signUpButton.titleLabel?.font =  UIFont(name: "raleway_semi_bold", size: 15)
        
        forgetMyPassword.setTitle("Olvidé mi contraseña", for: .normal)
        forgetMyPassword.setTitleColor(UIColor.getCustomButtonColor(), for: .normal)
        forgetMyPassword.titleLabel?.font =  UIFont(name: "raleway_semi_bold", size: 12)
        
        loginButton.setTitle("Iniciar sesión", for: .normal)
        loginButton.layer.cornerRadius = 25
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.backgroundColor = UIColor(red: 213/256, green: 213/256, blue: 213/256, alpha: 1.0)
    }
    
    func confSingOnLabel() {
        errorContainer.isHidden = true

        signOnLabel.lineBreakMode = .byWordWrapping
        signOnLabel.text = "Inicia sesión"
        signOnLabel.textColor = UIColor(red: 28/256, green: 29/256, blue: 77/256, alpha: 1.0)
        signOnLabel.font = UIFont(name: "raleway_semi_bold", size: CGFloat(15))
    }
    
    func confTextField() {
        emailTexField.placeholder = "Correo electrónico"
        passwordTextField.placeholder = "Contraseña"
        let myColor = UIColor.gray
        emailTexField.layer.borderColor = myColor.cgColor
        emailTexField.layer.borderWidth = 1.0
        emailTexField.layer.cornerRadius = 4
        passwordTextField.layer.borderColor = myColor.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 4
        emailTexField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setupErrorContainer() {
        errorContainer.layer.borderWidth = 1
        errorContainer.layer.borderColor = UIColor.red.cgColor
        errorContainer.layer.cornerRadius = 1
        errorContainerLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        errorContainer.isHidden = true
        emailTexField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        viewPresenter.didTapLogin()
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        viewPresenter.didTapSignUp()
    }
}

extension AuthModuleViewController: AuthModuleViewControllerProtocol {
    var password: String {
        return passwordTextField.text ?? ""
    }
    
    var email: String {
        return emailTexField.text ?? ""
    }
    
    func showError(error: Error) {
        errorContainer.isHidden = false
        errorContainerLabel.text = error.localizedDescription
    }
}

extension AuthModuleViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

