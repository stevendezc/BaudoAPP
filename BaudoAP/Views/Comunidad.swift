//
//  Comunidad.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Comunidad: View {
    @ObservedObject var users = ContentViewModelComunidad()
//    @State var filteredComunidad: [Users] = []
    
    @State private var showFilteredResultsproductivos = false
    @State private var showFilteredResultscultura = false
    @State private var showFilteredResultsturismo = false
    
    var ToToggle = false
    
    var filteredComunidad: [Users] {
           if showFilteredResultsproductivos {
               return users.usersComunidad.filter({$0.category == "productivos"})
           } else if showFilteredResultscultura{
               return users.usersComunidad.filter({$0.category == "cultura"})
           } else if showFilteredResultsturismo{
               return users.usersComunidad.filter({$0.category == "turismo"})
           }
            else {
                return users.usersComunidad
            }
       }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    HStack(alignment: .center, spacing: 10){
                        Button {
                            showFilteredResultsproductivos.toggle()
                            showFilteredResultscultura = false
                            showFilteredResultsturismo = false
                        } label: {
                            Image("Proyectosproductivos").resizable().aspectRatio(contentMode: .fit)
                                
                        }.padding(0)
                        
                        Button {
                            showFilteredResultsproductivos = false
                            showFilteredResultscultura.toggle()
                            showFilteredResultsturismo = false
                        } label: {
                            Image("Cultura").resizable().aspectRatio(contentMode: .fit)
                        }
                        
                        Button {
                            showFilteredResultsproductivos = false
                            showFilteredResultscultura = false
                            showFilteredResultsturismo.toggle()
                        } label: {
                            Image("Turismo").resizable().aspectRatio(contentMode: .fit)
                        }
                        
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 25,height: 25, alignment: .trailing)
                        
                    }.padding(10)
                    

                    ForEach(filteredComunidad) { Users in
                        PostCardComunidad(model: Users)
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



