//
//  CartButton.swift
//  BaudoAP
//
//  Created by Codez on 2/06/23.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "cart.fill").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title2))
            
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .foregroundColor(.white)
                    .frame(width:15, height: 15)
                    .background(Color("Yellow"))
                    .font(.caption2)
                    .cornerRadius(50)
            }
        }
        
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
