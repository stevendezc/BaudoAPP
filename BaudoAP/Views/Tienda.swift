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
        NavigationView{
            
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
                        Text("Editorial & Impresos")
                    }
                        .font(.custom("SofiaSans-Medium",size: 13,relativeTo: .title2))
                        .padding(.horizontal,25)
                        .padding(.vertical,10)
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
                        GridItem(.flexible(), spacing: nil, alignment: nil),
                        GridItem(.flexible(), spacing: nil, alignment: nil),
                        
                    ]
                    
                    LazyVGrid(columns: Columns, spacing: 5){
                        ForEach(contentProduct.postsProducts) { product in
                            NavigationLink(destination: PostCardProductDetail(model: product), label: {
                                PostCardProduct(model: product) } )
                        }
                    }.padding(.horizontal,5)
                    
                }
                .padding(.top,5)
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



