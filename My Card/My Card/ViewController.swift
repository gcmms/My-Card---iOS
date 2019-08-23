//
//  ViewController.swift
//  My Card
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 21/08/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var cardNumero: UILabel!
    @IBOutlet weak var cardTitular: UILabel!
    @IBOutlet weak var cardVencimento: UILabel!
    @IBOutlet weak var cardCVV: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let card = CardLogic(idUser: 132)
        let myCard = card.getCartao()
        cardNumero.text = myCard.cardNumero
        cardTitular.text = myCard.cardTitular
        cardVencimento.text = myCard.cardVencimento
        cardCVV.text = "\(myCard.cardCVV)"
    
    }
  


}

