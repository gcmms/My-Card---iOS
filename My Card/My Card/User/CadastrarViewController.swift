//
//  CadastrarViewController.swift
//  My Card
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 23/08/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit
import Firebase

class CadastrarViewController: UIViewController {
    var user = userLogin()
    let erroMensagem = ErroAlert()
    //MARK: Outlet
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var senhaLabel: UITextField!
    @IBOutlet weak var confirmarSenhaLabel: UITextField!
    @IBOutlet weak var nomeLabel: UITextField!
    @IBOutlet weak var dataNascLabel: UITextField!
    @IBOutlet weak var telefoneLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func verificaSenha()-> String? {
        let senha = senhaLabel.text!
        let confirma = confirmarSenhaLabel.text!
        if senha != confirma {
            erroMensagem.showMessage(type: .senhaNaoConfere(" "))
            return nil
        } else {
            return senha
        }
    }
    
    @IBAction func criarConta(_ sender: Any) {
        let email = emailLabel.text!
        let senha = verificaSenha()
        
        if let senha = senha {
            Auth.auth().createUser(withEmail: email, password: senha){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "UsuarioIdentificado", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        } else {
            erroMensagem.showMessage(type: .telaCadastro)
        }
        
        
        
    }
    

    
    

}
