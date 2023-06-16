//
//  Tienda.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI

struct Tienda: View {
    
    @ObservedObject var contentProduct = ContentViewModelShop()
    
    var body: some View {
       
            
            VStack{
                HStack{
                    Button {
                        
                    } label: {
                        Text("El estrén")
                    }
                        .font(.custom("SofiaSans-Medium",size: 13,relativeTo: .title2))
                        .padding(.horizontal,20)
                        .padding(.vertical,15)
                        .foregroundColor(.black)
                        .background(Color("Buttons"))
                        .clipShape(Capsule())
                    Button {
                        
                    } label: {
                        Text("Editorial & \n Impresos")
                    }
                        .font(.custom("SofiaSans-Medium",size: 13,relativeTo: .title2))
                        .padding(.horizontal,25)
                        .padding(.vertical,6)
                        .foregroundColor(.black)
                        .background(Color("Buttons"))
                        .clipShape(Capsule())
                    Button {
                        
                    } label: {
                        Text("Cositas")
                    }
                        .font(.custom("SofiaSans-Medium",size: 13,relativeTo: .title2))
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
                    
                    let Columns: [GridItem] = [
                        GridItem(.flexible(), spacing: 0, alignment: nil),
                        GridItem(.flexible(), spacing: 0, alignment: nil),
                        
                    ]
                    
                    LazyVGrid(columns: Columns, spacing: 0){
                        ForEach(contentProduct.postsProducts) { product in
                            NavigationLink(destination: PostCardProductDetail(model: product), label: {
                                PostCardProduct(model: product) } )
                        }
                    }
                    
                }
                .padding(.top,5)
                .overlay(
                    NavigationLink(destination: Cart(), label: {
                        
                            CartButton()
                                .padding(.horizontal,13)
                                .padding(.vertical,15)
                                .foregroundColor(.black)
                                .background(Color("Yellow"))
                                .cornerRadius(50)
                                
                        
                    }).padding(.trailing,20)
                        .padding(.top,-10)
                    ,alignment: .bottomTrailing
                )
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



