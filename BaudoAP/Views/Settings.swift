//
//  Settings.swift
//  BaudoAP
//
//  Created by Codez on 1/04/23.
//

import SwiftUI
import FirebaseAuth



struct Settings: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = true
    @Environment(\.colorScheme) var colorScheme
    @Binding var userIsLogged : Bool
    
    @Binding var UserName: String
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Ajustes")
                        .font(.custom("SofiaSans-Bold",size: 25,relativeTo: .title))
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Spacer()
                    }
                    NavigationLink(destination: VideoNosotros(), label: {
                        HStack(spacing: 20){
                            Image("logoBaudoWhite")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                            Text("¿Qué es Baudó")
                                .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .body))
                            Spacer()
                        }
                            .padding(20)
                            .background(Color("BackgroundCards"))
                            .cornerRadius(17)
                            .foregroundColor(Color("YellowBlack"))
                    })
                    
                    
                    HStack(spacing: 20){
                        Image(systemName: "envelope")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:25)
                            .foregroundColor(Color("WhiteBlack"))
                        Text("Contacto")
                            .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .body))
                        Spacer()
                    }
                        .padding(20)
                        .background(Color("BackgroundCards"))
                        .cornerRadius(17)
                        .foregroundColor(Color("YellowBlack"))
                    
                    HStack(spacing: 20){
                        Image(systemName: "questionmark.app")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(Color("WhiteBlack"))
                        Text("Preguntas frecuentes")
                            .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .body))
                        Spacer()
                    }
                        .padding(20)
                        .background(Color("BackgroundCards"))
                        .cornerRadius(17)
                        .foregroundColor(Color("YellowBlack"))
                    
                    
                    HStack(spacing: 20){
                        Image(systemName: "lock.doc")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25)
                            .foregroundColor(Color("WhiteBlack"))
                        Text("Acuerdo de confidencialidad")
                            .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .body))
                        Spacer()
                    }
                        .padding(20)
                        .background(Color("BackgroundCards"))
                        .cornerRadius(17)
                        .foregroundColor(Color("YellowBlack"))
                    
                    HStack(spacing: 20){
                        Button {
                            logout()
                        }label: {
                            Image(systemName: "x.square")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25)
                                .foregroundColor(Color("WhiteBlack"))
                            Text("Cerrar session")
                                .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .body))
                                .padding(.leading,10)
                        }
                        
                        Spacer()
                    }
                        .padding(20)
                        .background(Color("BackgroundCards"))
                        .cornerRadius(17)
                        .foregroundColor(Color("YellowBlack"))
                    
                    
                    HStack{
                        Picker("Mode", selection: $isDarkMode) {
                            Text("Dark")
                                .tag(true)
                            Text("Light")
                                .tag(false)
                        
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                        .font(.custom("SofiaSans-Bold",size: 15,relativeTo: .body))
                        .padding(20)
                        .background(Color("BackgroundCards"))
                        .cornerRadius(17)
                        .foregroundColor(Color("YellowBlack"))
                    
                    
                    Spacer()
                }.padding(20)
                
                Image("LogoBaudo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                
            }
        }

    }
    
    func logout(){
        try! Auth.auth().signOut()
        print("Logged out button pressed")
        userIsLogged = false
        print("userIsLogged is: ",userIsLogged)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(userIsLogged: .constant(false), UserName: .constant("None"))
            .preferredColorScheme(.dark)
    }
}
