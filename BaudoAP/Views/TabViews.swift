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
    
    @Binding var userIsLogged : Bool
    
    @Binding var UserName: String
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    
    @ObservedObject var contentImage = ContentViewModelImage()
    @ObservedObject var contentVideo = ContentViewModelVideo()
    @ObservedObject var contentPodcast = ContentViewModelPodcast()
    
  
//    @EnvironmentObject var usersettings: UserSettings
    
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 0){

                HStack{
                    NavigationLink(destination: User(userIsLogged: $userIsLogged, UserName: $UserName)) {
                        Image("Mambo")
                            .resizable()
//                            .border(Color.accentColor, width: 4)
                            .frame(width: 50,height: 50,alignment: .center)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color("Buttons"), lineWidth: 1)
                                )
                    }
                        
    //                  .border(Color.red, width: 3)
                        
                        
                    
                    Text("Hola,\n\(UserName)").font(.caption2)
                    
                    Image("LogoBaudoO").frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                     .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                     .frame(maxWidth: .infinity, alignment: .leading)
                     .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(Color("Buttons")), alignment: .bottom)
                    
                
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
                }.preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
        
        .onAppear {
//            contentImage.fetchpostsImages()
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil{
                    userIsLogged = true
                    UserName = user?.email ?? ""
                    print(user?.email ?? "Na")
                    print(user?.uid ?? "id not Found")
                    print("Este es el id del usuario TabViews ", user?.uid ?? "")
                    
                }else{
                    print("Este es el id del usuario que cerro session", UserName)
                }

            }
        }


    }
        
    
    
}// FIN struct TabViews

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews(userIsLogged: .constant(true), UserName: .constant("Mambo Hernandez"))
    }
}
