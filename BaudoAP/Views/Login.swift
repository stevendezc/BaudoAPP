//
//  Login.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI
import FirebaseAuth
//import GoogleSignIn




struct Login: View {
    
    @State private var email = ""
    @State private var password = ""
    @Binding var userIsLogged : Bool
    @Binding var UserName: String
    @State var showingAlert = false
    @State var errorAlert = ""
    
    var body: some View {
        NavigationView{
            if userIsLogged {
                TabViews(userIsLogged: self.$userIsLogged, UserName: $UserName)
            } else {
                content
            }
        }
        
    }
    
    

    var content: some View{
        NavigationView{
            VStack {
                Image("LogoBaudoSmall")
                
                
                //LOGIN AREA
                
                VStack(spacing: 20) {
                    
//                    Image("AccederFacebook")
//                    Image("AccederGoogle")
                    //                    Button(action: signInWithGoogle{
                    //                        Text("Email")
                    //                    }
                    
//                    Image("AccederApple")
                    
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
                    
                    HStack{
                        Spacer()
                        NavigationLink(destination:
                                        resetPass(), label: {
                            Text("Olvide mi contraseña").foregroundColor(.black) } )
                    }
                    
                    
                    HStack{
                        Button("Acceder") {
                            login()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.gray)
                        .clipShape(Capsule())
                        .padding(.top)
                        
                        NavigationLink(destination:
                                        createUser(userIsLogged: .constant(false), UserName: .constant("Steven")), label: {
                            Text("Crear usuario")
                                .padding()
                                .foregroundColor(.white)
                                .background(.gray)
                                .clipShape(Capsule())
                                .padding(.top)
                        } )
                    }
                    
                    Image("LogoBaudo").resizable().aspectRatio(contentMode: .fit).frame(width:130)
                    
                    
                   
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
        .alert("Ha habido un problema", isPresented: $showingAlert) {
            // add buttons here
        } message: {
            Text(errorAlert)
        }
//        .navigationTitle("Inicio session")
        
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil{
                    userIsLogged = true
                    
                }
                
            }
        }
    }
    //
    func login(){
       
        Auth.auth().signIn(withEmail: email, password: password){ result, error in if error != nil {
           
            print(error!.localizedDescription)
            showingAlert.toggle()
            errorAlert = error!.localizedDescription
            
        }else{
            userIsLogged = true
            UserName = email
            print("Username Correo: \(UserName)")
            //            result?.user.uid ?? "NONE"
            //            contentImage.fetchpostsImages()
            //            print("Images Fetched from login")
        }
        }
    }
    

}





struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(userIsLogged: .constant(false), UserName: .constant("Steven"))
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

