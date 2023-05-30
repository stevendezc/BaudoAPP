//
//  PostCardProduct.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardProduct: View {
    
    var model: Product
    
    var body: some View {
        
            VStack{
                WebImage(url: URL(string: model.thumbnail))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                    .cornerRadius(9)
                //                .border(Color.red, width: 3)
                
                Text(model.title)
                    .font(.custom("SofiaSans-Bold", size: 20,relativeTo: .title))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.leading)
                    .padding(.top,-35)
                    .foregroundColor(.black)
                
            }
//            .padding(15)
//            .background(Color("BackgroundCards"))
            .cornerRadius(20)
        
    }
}

struct PostCardProduct_Previews: PreviewProvider {
    static var previews: some View {
        
        PostCardProduct(model: Product(title: "Buso Beige", thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Products%2FBusoBeige.png?alt=media&token=44e097f3-6a72-4b00-a07b-bb6fef68bae3&_gl=1*spcl6d*_ga*MTI1ODc4NDM2MC4xNjc2Mjk5OTAy*_ga_CW55HF8NVT*MTY4NTQ2MDg3OS41MC4xLjE2ODU0NjE1MDMuMC4wLjA.", sizes: "SMLXL", description: "Esto es una breve description", gallery: "Array Images", price: "130.000", type: "Ropa",creation_date: Date()))
        
    }
}



