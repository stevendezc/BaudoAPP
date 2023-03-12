//
//  Eventos.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI


struct Eventos: View {
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    Text("Welcome to")
                    Text("Eventos")
                }
                //TituloNavigation
                .navigationTitle("Eventos")
            }
        }
    }
}


struct Eventos_Previews: PreviewProvider {
    static var previews: some View {
        Eventos()
    }
}
