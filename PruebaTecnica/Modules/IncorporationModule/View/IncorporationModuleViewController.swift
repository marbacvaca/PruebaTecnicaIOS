//
//  IncorporationModuleViewController.swift
//  PruebaTecnica
//
//  Created by CSA MEX on 13/09/22.
//

import UIKit

protocol IncorporationModuleViewControllerProtocol: AnyObject {}

class IncorporationModuleViewController: UIViewController {
    @IBOutlet weak var incoporationButton: UIButton!
    @IBOutlet weak var payParkingLabel: UILabel!
    @IBOutlet weak var guestButtonContinue: UIButton!
    
    private let viewPresenter: IncorporationModulePresenterProtocol

    required init(presenter: IncorporationModulePresenterProtocol) {
        self.viewPresenter = presenter
        super.init(nibName: IncorporationModuleViewController.typeName,
                   bundle: Bundle(for: IncorporationModuleViewController.self))
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confLabel()
        confSignUpBButton()
    }

    @IBAction func incorporationButtonAction(_ sender: Any) {
        viewPresenter.didTapLogin()
    }
    
    private func confLabel() {
        payParkingLabel.lineBreakMode = .byWordWrapping
        payParkingLabel.numberOfLines = 3
        payParkingLabel.text = "Paga el estacionamiento, gana puntos, evita filas, aprovecha las promociones de temporada, compra desde la app"
        payParkingLabel.textColor = UIColor(red: 28/256, green: 29/256, blue: 77/256, alpha: 1.0)
        payParkingLabel.font = UIFont(name: "raleway_semi_bold", size: CGFloat(15))
    }
    
    private func confSignUpBButton() {
        incoporationButton.layer.cornerRadius = incoporationButton.frame.size.height / 2
        incoporationButton.clipsToBounds = true
        incoporationButton.setTitle("Iniciar sesión o regístrate", for: .normal)
        incoporationButton.setTitleColor(.white, for: .normal)
        incoporationButton.backgroundColor = UIColor(red: 104/256, green: 200/256, blue: 199/256, alpha: 1.0)
    }
}

extension IncorporationModuleViewController: IncorporationModuleViewControllerProtocol {}
