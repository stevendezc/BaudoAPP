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
                    ScrollView{
                        Image("Tienda")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                    }.padding(20)
                }
                //TituloNavigation
                //.navigationTitle("Tienda")
    }
}

struct Tienda_Previews: PreviewProvider {
    static var previews: some View {
        Tienda()
    }
}
