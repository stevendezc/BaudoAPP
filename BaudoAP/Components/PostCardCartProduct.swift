//
//  PostCardCartProduct.swift
//  BaudoAP
//
//  Created by Codez on 7/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardCartProduct: View {
    
    var model: Product
    
    var body: some View {
        HStack{
            HStack{
                Spacer()
            }
            HStack{
                    WebImage(url: URL(string: model.thumbnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(width:150)
                    //                .border(Color.red, width: 3)
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text(model.title)
                                .font(.custom("SofiaSans-Medium", size: 20,relativeTo: .title))
                                .fontWeight(.heavy)
                                .multilineTextAlignment(.leading)
                                
                                .padding(.vertical,10)
                                
                            
                            Text(model.price)
                                .font(.custom("SofiaSans-Medium", size: 13,relativeTo: .title))
                            Text("Cantidad: 2")
                                .font(.custom("SofiaSans-Bold", size: 15,relativeTo: .title))
                            Text("Total: $260.000")
                                .font(.custom("SofiaSans-Medium", size: 20,relativeTo: .title))
                                .padding(.horizontal,20)
                                .padding(.vertical,10)
                                .overlay(RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("Text"), lineWidth: 1))
                            HStack{
                                Text("Talla: M").font(.custom("SofiaSans-Regular", size: 15,relativeTo: .title))
                                Spacer()
                                Image(systemName: "trash.fill").padding().frame(width: 50,height: 50)
                            }
                        }.padding(10)

                    }.frame(maxWidth: .infinity, alignment: .leading)

            }
            Spacer()
        }
        
        .background(Color("BackgroundCards"))
        .cornerRadius(20)
        
    }
}

struct PostCardCartProduct_Previews: PreviewProvider {
    static var previews: some View {
        PostCardCartProduct(model: Product(title: "Buso Beige", thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Products%2FBuso-Rio.jpg?alt=media&token=0a1bc3fc-3c66-4dc7-a4d1-efbabec0ffa1&_gl=1*14pxcx4*_ga*MTI1ODc4NDM2MC4xNjc2Mjk5OTAy*_ga_CW55HF8NVT*MTY4NTcyOTA0Ni41Mi4xLjE2ODU3MjkzMDcuMC4wLjA.", sizes: "SMLXL", description: "Esto es una breve description", gallery: "Array Images", price: "130.000", type: "Ropa",creation_date: Date()))
    }
}
