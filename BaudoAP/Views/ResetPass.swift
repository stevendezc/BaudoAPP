//
//  ResetPass.swift
//  BaudoAP
//
//  Created by Codez on 24/04/23.
//

import SwiftUI
import FirebaseAuth


struct resetPass: View {
    
    @State private var email = ""
    
    var body: some View {
        VStack{
            Image("LogoBaudoSmall")
            Text("Reset Password")
            TextField("Email", text: $email)
                .padding()
                .foregroundColor(.black)
                .textFieldStyle(.plain)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            
            
            Button("Reset"){
               resetPassword()
            }
        }
        .navigationTitle("Recuperar contraseña")
        .padding(30)
        .background(
            Image("Fondo")
                .ignoresSafeArea()
        )
    }
    
    func resetPassword(){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            // Your code here
            print("Password reset sent")
        }
    }
}

struct ResetPass_Previews: PreviewProvider {
    static var previews: some View {
        resetPass()
    }
}

