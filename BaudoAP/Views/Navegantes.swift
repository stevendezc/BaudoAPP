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
                Color.black.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Welcome to").foregroundColor(.white)
                    Text("NAVEGANTES").foregroundColor(.white)
                }
                //TituloNavigation
                .navigationTitle("Navegantes").foregroundColor(.white)
            }
        }
    }
}

struct Navegantes_Previews: PreviewProvider {
    static var previews: some View {
        Navegantes()
    }
}
