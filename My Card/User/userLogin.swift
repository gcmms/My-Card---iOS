//
//  userLogin.swift
//  My Card
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 23/08/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation
import Firebase


class userLogin {
    //private var email: String
    //private var senha: String
    private let usuario =  Auth.auth()
    private var validate = false
    
    func deslogaUsuario(){
        do {
            try self.usuario.signOut()
        } catch {
            print("Erro ao deslogar usuario")
        }
    }

    func logaUsuario(email:String, senha:String){
        self.usuario.signIn(withEmail: email, password: senha) { (usuario, erro) in
            if erro == nil {
                print("Sucesso ao logar usuario!")
            }else{
                print("Erro ao logar usuario! \(String(describing: erro?.localizedDescription)) ")
            }
        }
    }
    
    func cadastraUsuario(email: String, senha: String)->Bool {
        // CRIANDO NOVO USUARIO
        self.validate = false
         usuario.createUser(withEmail: email, password: senha) { (usuario, erro) in
            if erro == nil {
                self.validate = true
                let uiView = UIViewController()
                print("FIREBASE:: Cadastro realizado ")
                uiView.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else{
                print("FIREBASE:: Erro Cadastro")
                print("Aconteceu algum erro:" + String(describing: erro?.localizedDescription ) )
            }
            
        }
        if self.validate {
            return true
        } else {
            return false
        }
    }
    
    
    
 
}
