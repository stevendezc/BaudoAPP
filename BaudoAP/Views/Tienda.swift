//
//  Tienda.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI

struct Tienda: View {
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    ScrollView{
                        Image("Tienda")
                            .padding(15)
                    }
                    
                }
                //TituloNavigation
                //.navigationTitle("Tienda")
            }
        }
    }
}

struct Tienda_Previews: PreviewProvider {
    static var previews: some View {
        Tienda()
    }
}
