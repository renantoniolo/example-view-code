//
//  StatementViewModel.swift
//  Example-view-code
//
//  Created by Renan Toniolo Rocha on 27/03/22.
//

import Foundation

class StatementViewModel {
    func getCardBalance() -> [CardBalance] {
        let balances = [
            CardBalance(typeName: "Luz", date: "10/10/21", value: 200.00),
            CardBalance(typeName: "Agua", date: "12/10/21", value: 90.90),
            CardBalance(typeName: "Telefone", date: "15/10/21", value: 128.90),
            CardBalance(typeName: "Condomínio", date: "17/10/21", value: 265.50)
        ]
        return balances
    }
}
