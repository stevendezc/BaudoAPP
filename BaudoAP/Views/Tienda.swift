//
//  Tienda.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI

struct Tienda: View {
    var body: some View {
        NavigationView{
            
            VStack{
                HStack{
                    Button {
                        
                    } label: {
                        Text("El estrén")
                    }
                        .font(.custom("SofiaSans-Medium",size: 18,relativeTo: .title2))
                        .padding(.horizontal,20)
                        .padding(.vertical,15)
                        .foregroundColor(.black)
                        .background(Color("Buttons"))
                        .clipShape(Capsule())
                    Button {
                        
                    } label: {
                        Text("Editorial &\n Impresos")
                    }
                        .font(.custom("SofiaSans-Medium",size: 18,relativeTo: .title2))
                        .padding(.horizontal,25)
                        .padding(.vertical,10)
                        .foregroundColor(.black)
                        .background(Color("Buttons"))
                        .clipShape(Capsule())
                    Button {
                        
                    } label: {
                        Text("Cositas")
                    }
                        .font(.custom("SofiaSans-Medium",size: 18,relativeTo: .title2))
                        .padding(.horizontal,25)
                        .padding(.vertical,15)
                        .foregroundColor(.black)
                        .background(Color("Buttons"))
                        .clipShape(Capsule())
                    
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 25,height: 25, alignment: .trailing)
                }
                    
                
                ScrollView{
                    HStack{
                        Spacer()
                        
                    }
                    
                    Image("Tienda")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(20)
                    
                }
            }
            }
           
        //TituloNavigation
        //.navigationTitle("Tienda")
    }
}

struct Tienda_Previews: PreviewProvider {
    static var previews: some View {
        Tienda()
    }
}
