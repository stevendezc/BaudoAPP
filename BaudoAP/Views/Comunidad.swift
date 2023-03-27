//
//  Comunidad.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Comunidad: View {
    @ObservedObject var users = ContentViewModelComunidad()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Spacer(minLength: 30)
                    HStack(alignment: .center, spacing: 20){
                        Button {
//
                        } label: {
                            Text("Proyectos productivos")
                        }.buttonStyle(.borderedProminent)
                        Button {
//
                        } label: {
                            Text("Cultura e inclusion")
                        }.buttonStyle(.borderedProminent)
                        Button {
//                            <#code#>
                        } label: {
                            Text("Turismo comunitario")
                        }.buttonStyle(.borderedProminent)
                    }
                    
                    ForEach(0 ..< 10) { item in
                        
                        ForEach(users.usersComunidad) {Users in
                            PostCardComunidad(model: Users)
                           
                        }
                    }
                }
            }.refreshable {
                users.fetchusersComunidad()
            }
        }
    }
}


struct Comunidad_Previews: PreviewProvider {
    static var previews: some View {
        Comunidad()
    }
}



