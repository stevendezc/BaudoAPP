//
//  CartManager.swift
//  BaudoAP
//
//  Created by Codez on 9/06/23.
//

import Foundation


class cartManager: ObservableObject {
    @Published var cartProducts: [Product] = []
    
    
    
    func addProduct(){
        print("Agregado producto")
        
    }
    
    func removeProduct(){
        print("Remover producto")
    }
    
    func SendPurchesed(){
        print("Productos comprados")
    }
    
    
}
