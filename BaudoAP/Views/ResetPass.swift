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
    @State var showingAlert = false
    @State var errorAlert = ""
    
    var body: some View {
        VStack{
            Image("LogoBaudoSmall").padding(.bottom,50)
            HStack{
                Text("Olvidaste tu contraseña?")
                    .font(.custom("SofiaSans-Bold",size: 25,relativeTo: .title))
            }.padding(.bottom,20)
            
            Text("Ingresa el correo electronico del usuario del cual desea restablecer la contraseña")
                .font(.custom("SofiaSans-Medium",size: 18,relativeTo: .body))
            
            TextField("Correo", text: $email)
                .padding()
                .foregroundColor(.black)
                .textFieldStyle(.plain)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                
            Button("Recuperar Contraseña"){
               resetPassword()
                showingAlert.toggle()
            }
            .padding()
            .foregroundColor(.white)
            .background(.gray)
            .clipShape(Capsule())
            .padding(.top)
        }.alert("Correo enviado", isPresented: $showingAlert) {
            // add buttons here
        } message: {
            Text("Revisa tu correo y restablece tu contraseña")
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

