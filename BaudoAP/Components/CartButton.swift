//
//  CartButton.swift
//  BaudoAP
//
//  Created by Codez on 2/06/23.
//

import SwiftUI

struct CartButton: View {
    
    @EnvironmentObject var cartmanager: cartManager
    @State var numberOfProducts = 4
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart.fill").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title2))
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                
                    .foregroundColor(Color("Yellow"))
                
                    .frame(width:20, height: 20)
                    .background(.black)
                    .font(.custom("SofiaSans-Medium",size: 15,relativeTo: .title2))
                    .cornerRadius(50)
                    .padding(.leading,20)
                    
            }
        }

    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton()
    }
}
