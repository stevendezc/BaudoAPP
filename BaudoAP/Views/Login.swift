//
//  Login.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI
import FirebaseAuth
import GoogleSignIn


struct Login: View {
    @EnvironmentObject var usersettings: UserSettings
    
    @State private var email = ""
    @State private var password = ""
    @State var userIsLogged = false
    
    var body: some View {
        if userIsLogged {
            TabViews()
        } else {
            content
        }
    }

    var content: some View{
        NavigationView{
            VStack {
                Image("LogoBaudoSmall")
                
                //LOGIN AREA
                
                
                VStack(spacing: 20) {
                    
                    Image("AccederFacebook")
                    Image("AccederGoogle")
//                    Button(action: signInWithGoogle{
//                        Text("Email")
//                    }
                  
                        
                    
                    Image("AccederApple")
                   
                    TextField("Email", text: $email)
                        .padding()
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    SecureField("Password", text:$password)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Button("Acceder") {
                        login()
                        
                    }
                        .padding(.top)
                    Button("Registrarme"){
                        register()
                    }
                        
                }
                .padding(30)
                
                
            }
           
            

            //FONDO DE TODO EL CONTENT VIEW
            .background(
                Image("Fondo")
                    .ignoresSafeArea()
            )
            //TituloNavigation
//            .navigationTitle("Sign In")
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil{
                    userIsLogged.toggle()
                }

            }
        }
    }
//
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in if error != nil {
            print(error!.localizedDescription)
        }
        }
        usersettings.isLoggedIn = true
    }
//
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}




struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}



extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
