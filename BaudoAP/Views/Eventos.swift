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
            ScrollView{
                Image("FondoCalendar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(50)
                
                //TituloNavigation
//                .navigationTitle("Eventos")
            }
        }
    }
}


struct Eventos_Previews: PreviewProvider {
    static var previews: some View {
        Eventos()
    }
}
