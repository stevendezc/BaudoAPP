//
//  PostCardProductDetail.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardProductDetail: View {
    
    var model: Product
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .bottom){
                    WebImage(url: URL(string: model.thumbnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                    //                .border(Color.red, width: 3)
                    HStack{
                        Text(model.title)
                            .font(.custom("SofiaSans-Medium", size: 13,relativeTo: .body))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Text"))
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                           // .background(RoundedCorners(color: Color("ButtonsProducts"), tl: 0, tr: 10, bl:30, br: 10))
                        
                    }.padding(.bottom,5)

            }
            .padding(10)
            .cornerRadius(30)
            
            VStack(spacing: 15){
                HStack{
                    Text("Precio $\(model.price)")
                        .font(.custom("SofiaSans-Black", size: 18,relativeTo: .title))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack{
                    Text(model.description)
                        .font(.custom("SofiaSans-Bold", size: 15,relativeTo: .title))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
            .padding(.horizontal,20)
            
            HStack{
                Text("Estilo")
                Spacer()
            }.padding(.top,20)
                .padding()
            
            
            HStack{
                Text("Ceñido")
                    .padding()
                    .background(Color("Yellow"))
                    .cornerRadius(30)
                    .foregroundColor(.black)
                
                Text("Regular")
                    .padding()
                    .background(Color("Yellow"))
                    .cornerRadius(30)
                    .foregroundColor(.black)
                
                Spacer()
            }.padding()
            
            HStack{
                VStack{
                    HStack{
                        Text("Talla")
                        Spacer()
                    }
                    
                    
                    HStack{
                        Button{ }label:{ Text("XS").padding(.horizontal,5).padding(.vertical,5).background(Color("ButtonsProducts")).cornerRadius(5) }
                        Button{ }label:{ Text("S").padding(.horizontal,10).padding(.vertical,5).background(Color("ButtonsProducts")).cornerRadius(5) }
                        Button{ }label:{ Text("M").padding(.horizontal,10).padding(.vertical,5).background(Color("ButtonsProducts")).cornerRadius(5) }
                        Button{ }label:{ Text("L").padding(.horizontal,10).padding(.vertical,5).background(Color("ButtonsProducts")).cornerRadius(5) }
                        Button{ }label:{ Text("XL").padding(.horizontal,10).padding(.vertical,5).background(Color("ButtonsProducts")).cornerRadius(5) }
                        Spacer()
                    }
                    .foregroundColor(.black)
                    
                }
                
                VStack{
                    Text("Cantidad")
                    HStack{
                        Button{
                            
                        }label: {
                            Image(systemName: "minus")
                        }
                        Text("1")
                        Button{
                            
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                    .foregroundColor(.black)
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    .background(Color("ButtonsProducts"))
                    .cornerRadius(20)
                }
            }
            .padding(.top,20)
            .padding(.horizontal,20)
            
            
            HStack{
                NavigationLink{
                    Checkout()
                } label: {
                    Text("Comprar Ahora")
                        .padding()
                        
                        .background(Color("Yellow"))
                        .cornerRadius(30)
                        .foregroundColor(.black)
                }
                
                NavigationLink{
                    Cart()
                } label: {
                    Text("Agregar a carrito")
                        .padding()
                        
                        .background(Color("Yellow"))
                        .cornerRadius(30)
                        .foregroundColor(.black)
                }

                
            }.padding(.top,30)
        }
    }
}

struct PostCardProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        PostCardProductDetail(model: Product(title: "Buso Beige", thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Products%2FFotolibro%20-%20Tierra%20Prometida.jpg?alt=media&token=8f37b9da-9ef0-46a8-836e-6721572f24aa&_gl=1*14pan3q*_ga*MTI1ODc4NDM2MC4xNjc2Mjk5OTAy*_ga_CW55HF8NVT*MTY4NTcyOTA0Ni41Mi4xLjE2ODU3MjkzNDkuMC4wLjA.", sizes: "SMLXL", description: "Esto es una breve description", gallery: "Array Images", price: "130.000", type: "Ropa",creation_date: Date()))
        
    }
}



