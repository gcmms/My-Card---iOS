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
    
    func verificaSenha()-> Bool{
        let senha = senhaLabel
        let confirma = confirmarSenhaLabel
        if senha == confirma {
            return true
        } else {
            erroMensagem.showMessage(type: .senhaNaoConfere(" "))
            return false
        }
    }
    
    @IBAction func criarConta(_ sender: Any) {
        let email = emailLabel.text!
        let senha = senhaLabel.text!
        verificaSenha()
        let cadastrar = user.cadastraUsuario(email: email, senha: senha)
        if cadastrar {
            //showMessage(mensagem: "Cadastrado ", withIdentifier: nil)
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        } else {
            erroMensagem.showMessage(type: .telaCadastro)
        }
        
    } 
    
    

}
