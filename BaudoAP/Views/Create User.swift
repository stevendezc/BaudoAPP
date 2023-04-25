//
//  Create User.swift
//  BaudoAP
//
//  Created by Codez on 24/04/23.
//

import SwiftUI
import FirebaseAuth

struct createUser : View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @Binding var userIsLogged : Bool
    @Binding var UserName: String
    
    
    var body: some View {
        VStack(spacing: 10) {
            
   //                    Image("AccederFacebook")
   //                    Image("AccederGoogle")
            //                    Button(action: signInWithGoogle{
            //                        Text("Email")
            //                    }
            
   //                    Image("AccederApple")
            
            Image("LogoBaudoSmall")
            TextField("Nombre", text: $name)
                .padding()
                .foregroundColor(.black)
                .textFieldStyle(.plain)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            
            TextField("Correo", text: $email)
                .padding()
                .foregroundColor(.black)
                .textFieldStyle(.plain)
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            
            SecureField("Contraseña", text:$password)
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(20)
            

            

            .padding(.top)
            Button("Registrarme"){
               register()
            }
            .padding()
            .foregroundColor(.black)
            .background(Color("Buttons"))
            .clipShape(Capsule())
            .padding(.top)
            
        }.navigationTitle("Crear usuario")
        .padding(30)
        .background(
            Image("Fondo")
                .ignoresSafeArea()
        )
    }
     
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if error != nil {
            print(error!.localizedDescription)
            UserName = email
            print("USERNAME",UserName)
        }
            
        }
    }
 }


struct Create_User_Previews: PreviewProvider {
    static var previews: some View {
        createUser(userIsLogged: .constant(true), UserName: .constant(""))
    }
}
