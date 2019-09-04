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
    @IBOutlet weak var viLoading: UIView!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    
    /** @var handle
     @brief The handler for the auth state listener, to allow cancelling later.
     */
    //var handle: AuthStateDidChangeListenerHandle?

    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func btnEntrar(_ sender: Any) {
        load(show: true)
        let email = labelEmail.text!
        let senha = labelSenha.text!
        Auth.auth().signIn(withEmail:email, password: senha) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "UsuarioIdentificado", sender: self)
            }
            else{
                self.load(show: false)
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func load(show:Bool) {
        viLoading.isHidden = !show
        if show {
            aiLoading.startAnimating()
        } else {
            aiLoading.stopAnimating()
        }
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
