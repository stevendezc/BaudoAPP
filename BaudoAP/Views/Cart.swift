//
//  Cart.swift
//  BaudoAP
//
//  Created by Codez on 2/06/23.
//

import SwiftUI

struct Cart: View {
    
    @ObservedObject var contentProduct = ContentViewModelShop()
    
    var body: some View {
        ScrollView{
            
            HStack{
                Text("Tu Carrito").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title2))
                
            }
            ScrollView{
                
                LazyVStack{
                    ForEach(contentProduct.postsProducts) { product in
                        
                            PostCardCartProduct(model: product)
                    }
                }.padding(.horizontal,20)
                
            }
                
            
        }
        
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
