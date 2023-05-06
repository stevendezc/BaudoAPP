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
              
            
                //LOGIN AREA
                
                
                VStack(spacing: 10) {
                    
                    Image("AccederGoogle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                    
                    Image("AccederApple")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                    
                    Image("LineacircleLinea")
                    
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
                    
                    HStack{
                        Spacer()
                        NavigationLink(destination:
                                        resetPass(), label: {
                            Text("Olvidé mi contraseña")
                            .foregroundColor(.black)
                            .font(.custom("SofiaSans-Regular",size: 15,relativeTo: .title2))
                        } )
                    }
                    
                    
                    HStack{
                        Button{
                            login()
                        }label: {
                            Text("Acceder")
                                .font(.custom("SofiaSans-Medium",size: 18,relativeTo: .title2))
                                .padding(.horizontal,55)
                                .padding(.vertical,15)
                                .foregroundColor(.black)
                                .background(Color("Buttons"))
                                .clipShape(Capsule())
                                .padding(.top)
                        }
                    }

                   
                    
                    HStack{
                        Text("¿No tienes una cuenta?")
                            .foregroundColor(Color("Text"))
                            .font(.custom("SofiaSans-Regular",size: 15,relativeTo: .title2))
                        NavigationLink(destination: createUser(userIsLogged: .constant(false), UserName: .constant("Steven")), label: {
                                Text("Crear usuario")
                                    .foregroundColor(Color("Text"))
                                    .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .title))
                                            }
                        )
                    }.padding(.top,20)
                    
                    
                    
                }
                .padding(30)
                Image("LogoBaudo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120)
                
            }

            
            //FONDO DE TODO EL CONTENT VIEW
            .background(
                Image("Fondo")
                    .ignoresSafeArea()
            )
            //TituloNavigation
            //            .navigationTitle("Sign In")
        }
        .alert("Error", isPresented: $showingAlert) {
            // add buttons here
        } message: {
            Text("Correo o contraseña invalida")
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

