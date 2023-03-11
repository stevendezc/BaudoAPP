//
//  Preload.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI


import SwiftUI

struct PreloadScreenView: View {
    @State var isActive : Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.6
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            Login()
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct PreloadScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PreloadScreenView()
    }
}
