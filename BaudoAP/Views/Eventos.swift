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
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Welcome to").foregroundColor(.white)
                    Text("Eventos").foregroundColor(.white)
                }
                //TituloNavigation
                .navigationTitle("Eventos").foregroundColor(.white)
            }
        }
    }
}


struct Eventos_Previews: PreviewProvider {
    static var previews: some View {
        Eventos()
    }
}
