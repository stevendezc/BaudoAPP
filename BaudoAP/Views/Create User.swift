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
    @State var Politica = true
    
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 10) {
                
                Group{
                    Image("LogoBaudoSmall")
                    HStack{
                        Text("Ingresa tus datos para registrarte")
                            .font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title))
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.vertical,30)
                }
                
                
                Group{
                    HStack{
                        Text("Nombre")
                            .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title2))
                            .padding(.leading,20)
                        Spacer()
                    }
                    TextField("Nombre", text: $name)
                        .padding()
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    HStack{
                        Text("Correo")
                            .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title2))
                            .padding(.leading,20)
                        Spacer()
                    }
                    TextField("Correo", text: $email)
                        .padding()
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                    
                    HStack{
                        Text("Contraseña")
                            .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title2))
                            .padding(.leading,20)
                        Spacer()
                    }
                    SecureField("Contraseña", text:$password)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    
                }
                
                Group{
                    
                    Toggle("Acepto la politica de datos", isOn: $Politica)
                        .font(.custom("SofiaSans-Regular",size: 15,relativeTo: .title2))
                        .tint(Color("Buttons"))
                        .padding(10)
                    
                    
                    
                    
                    
                    Button{
                        register()
                    }label: {
                        Text("Registrarme")
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("Buttons"))
                            .clipShape(Capsule())
                            .padding(.top)
                    }
                }
                
                
            }
            //        .navigationTitle("Crear usuario")
            .padding(30)
            .background(
                Image("Fondo")
                    .ignoresSafeArea()
            )
            
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if error != nil {
                print(error!.localizedDescription)
                UserName = email
                print("USERNAME",UserName)
            }else {
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    // ...
                    print("Verification Email Sent")
                }
            }
        }
    }
}

struct Create_User_Previews: PreviewProvider {
    static var previews: some View {
        createUser(userIsLogged: .constant(true), UserName: .constant(""))
    }
}
