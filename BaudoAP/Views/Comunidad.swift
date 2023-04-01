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
                    Spacer(minLength: 20)
                    HStack(alignment: .center, spacing: 10){
                        Button {
//
                        } label: {
                            Image("Proyectosproductivos").resizable().aspectRatio(contentMode: .fit)
                                
                        }.padding(0)
                        
                            
                        Button {
//
                        } label: {
                            Image("Cultura").resizable().aspectRatio(contentMode: .fit)
                        }
                        Button {
//
                        } label: {
                            Image("Turismo").resizable().aspectRatio(contentMode: .fit)
                        }
                    }.padding(10)
                    
                    ForEach(0 ..< 10) { item in
                        
                        ForEach(users.usersComunidad) {Users in
                            PostCardComunidad(model: Users)
                           
                        }
                    }
                }
            }
//            .refreshable {
//                users.fetchusersComunidad()
//            }
        }
    }
}


struct Comunidad_Previews: PreviewProvider {
    static var previews: some View {
        Comunidad()
    }
}



