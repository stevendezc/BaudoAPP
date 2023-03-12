//
//  Preload.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI


struct Preload: View {
    @State var isActive : Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.6
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            Base()
        } else {
            VStack {
                VStack {
                    
                    Image("LogoBaudo")
                        .font(.system(size: 100))
                        .foregroundColor(.red)
                    
                }
                
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.00
                    }
                }
            }
            .background(
                    Image("Fondo")
                        .ignoresSafeArea()
                )
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct Preload_Previews: PreviewProvider {
    static var previews: some View {
        Preload()
    }
}
