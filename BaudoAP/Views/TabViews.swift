//
//  TabViews.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//


import SwiftUI
import FirebaseAuth


struct TabViews: View {
    // Defines colorSceme 9i9
    @Environment(\.colorScheme) var colorScheme
    
    @State var userIsLogged = true
    
    
    var body: some View {
        
        VStack(spacing: 0){
            HStack{
                
                HStack{
                    Image("Cara1")
                        
                    Menu("Hola\nIsabella") {
                        Button("LogOut") {
                            logout()
                        }
                        
                                                
                    }
                    .padding()
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .foregroundColor(Color(white: 1.0))

                }
                
                Image("LogoBaudoO").foregroundColor(.white)
                
                Text(colorScheme == .dark ? "Dark" : "light").foregroundColor(.white)
                
            }.background(Color.black)
             .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(Color.yellow), alignment: .bottom)
             

            
            
            
            TabView{
                Home()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Inicio")
                    }
                Tienda()
                    .tabItem{
                        Image(systemName: "bag")
                        Text("Tienda")
                    }
                Comunidad()
                    .tabItem{
                        Image(systemName: "person.3")
                        Text("Comunidad")
                    }
                Eventos()
                    .tabItem{
                        Image(systemName: "calendar")
                        Text("Eventos")
                    }
                Navegantes()
                    .tabItem{
                        Image(systemName: "sailboat")
                        Text("Navegantes")
                    }
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil{
                    userIsLogged.toggle()
                }

            }
        }
    }
    func logout(){
        try! Auth.auth().signOut()
        print("Logged out button pressed")
        userIsLogged = false
        
    }
}// FIN struct TabViews

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}




