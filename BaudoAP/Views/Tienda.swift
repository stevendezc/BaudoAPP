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
                        HStack{
                            Spacer()
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 25,height: 25, alignment: .trailing)
                        }
                       
                        Image("Tienda")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(20)
                            
                    }
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
