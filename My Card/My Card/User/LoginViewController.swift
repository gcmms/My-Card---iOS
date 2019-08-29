//
//  LoginViewController.swift
//  My Card
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 23/08/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var user = userLogin()
    @IBOutlet weak var labelEmail: UITextField!
    @IBOutlet weak var labelSenha: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnEntrar(_ sender: Any) {
        user.logaUsuario(email: labelEmail.text!, senha: labelSenha.text!)
    }
    
    func showMessage(mensagem: String, withIdentifier: String?) {
        let title = "Atenção"
        
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if let withIdentifier = withIdentifier {
            let confirmaAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                self.performSegue(withIdentifier: withIdentifier, sender: nil)
            }
            alert.addAction(confirmaAction)
        }
        present(alert, animated: true, completion: nil)
    }

}
