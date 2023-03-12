//
//  Navegantes.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Navegantes: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("Welcome to")
                    Text("NAVEGANTES")
                }
                //TituloNavigation
                .navigationTitle("Navegantes")
            }
        }
    }
}

struct Navegantes_Previews: PreviewProvider {
    static var previews: some View {
        Navegantes()
    }
}
