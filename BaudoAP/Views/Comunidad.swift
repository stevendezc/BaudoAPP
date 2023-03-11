//
//  Comunidad.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Comunidad: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Welcome to").foregroundColor(.white)
                    Text("COMUNIDAD").foregroundColor(.white)
                }
                //TituloNavigation
                .navigationTitle("Comunidad").foregroundColor(.white)
            }
        }
    }
}


struct Comunidad_Previews: PreviewProvider {
    static var previews: some View {
        Comunidad()
    }
}

