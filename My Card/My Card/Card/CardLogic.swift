//
//  CardLogic.swift
//  My Card
//
//  Created by Gabriel Chirico Mahtuk de Melo Sanzone on 23/08/19.
//  Copyright © 2019 Gabriel Chirico Mahtuk de Melo Sanzone. All rights reserved.
//

import Foundation

class CardLogic {
    
    // Dados do usuario
    private var idUser: Int = 0
    private var cardNumero: String = ""
    private var cardTitular: String = ""
    private var cardVencimento:String = ""
    private var cardCVV: Int = 0
    
    
    private var saldo: Double = 0

    
    init(idUser: Int) {
        self.idUser = idUser
    }
    
    
    private func selectInfoUserAccount() {
        let idUser = self.idUser
        self.cardNumero = "1234-1234-1234-1234"
        self.cardTitular = "Gabriel Chirico Mahtuk de Melo"
        self.cardVencimento = "02/09"
        self.cardCVV = self.idUser
        self.saldo = 20.50
    }
    
    
    func getCartao() -> Card {
        selectInfoUserAccount()
        let myCard = Card(cardNumero: cardNumero, cardTitular: cardTitular, cardVencimento: cardVencimento, cardCVV: cardCVV)
        return myCard
    }
}

