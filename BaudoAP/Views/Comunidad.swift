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
                
                VStack{
                    Text("Welcome to")
                    Text("COMUNIDAD")
                }
                //TituloNavigation
                .navigationTitle("Comunidad")
            }
        }
    }
}


struct Comunidad_Previews: PreviewProvider {
    static var previews: some View {
        Comunidad()
    }
}

