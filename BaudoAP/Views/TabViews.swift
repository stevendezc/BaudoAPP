//
//  TabViews.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI
import FirebaseAuth


struct TabViews: View {
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var usersettings: UserSettings
    
    
    var body: some View {
        
        VStack(spacing: 0){

            HStack{
                    Image("Cara1")
                        
                    Menu("Hola\nIsabella") {
                        Button("LogOut") {
                            logout()
                        }
                        Text(colorScheme == .dark ? "Dark" : "Light").foregroundColor(.white)
                        
                                                
                    }.frame(width: 100)
                    .padding(10)
                    Spacer()
                    Image("LogoBaudoO").frame(maxWidth: .infinity, alignment: .trailing)
                
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                 .frame(maxWidth: .infinity, alignment: .leading)
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
                    usersettings.isLoggedIn = true
                }

            }
        }
    }
    func logout(){
        try! Auth.auth().signOut()
        print("Logged out button pressed")
        usersettings.isLoggedIn = false
        
        
    }
    
}// FIN struct TabViews

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
