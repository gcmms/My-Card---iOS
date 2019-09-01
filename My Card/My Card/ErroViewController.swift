//
//  logErro.swift
//  My Card
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 27/08/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//
import UIKit
import Foundation


class ErroAlert: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum ErroMessageType {
        case senhaNaoConfere(String)
        case telaCadastro
        case senha(String)
    }
    
    func showMessage(type: ErroMessageType) {
        let title: String, message: String
        var hasConfirmation: Bool = false
        switch type {
            case .senhaNaoConfere:
                title   = "Senha Incorreta"
                message = "Reescreva as senhas"
                hasConfirmation = true
            case .senha:
                title   = "Local Encontrado"
                message = "Deseja Adiconar o ?"
                hasConfirmation = true
            case .telaCadastro:
                title   = "Erro ao tentar cadastrar"
                message = "Houve um erro ao tentar te cadastrar. Verifique se TODOS os campos estão preenchidos. Alem disso a senha deve ser letras e numeros e no minimo 6 digitos"
                hasConfirmation = true
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if hasConfirmation {
            let confirmaAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(confirmaAction)
        }
        return present(alert, animated: true, completion: nil)
    }
}
