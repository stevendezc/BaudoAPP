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
        
        VStack(alignment: .leading){
            HStack{
                Spacer()
            }
            HStack{
                Image("logoBaudoWhite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                Text("¿Qué es Baudó")
                Spacer()
            }
                .padding(20)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                .foregroundColor(Color("YellowBlack"))
            
            HStack{
                Image(systemName: "envelope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                Text("Contacto")
                Spacer()
            }
                .padding(20)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                .foregroundColor(Color("YellowBlack"))
            
            HStack{
                Image(systemName: "questionmark.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                Text("Preguntas frecuentes")
                Spacer()
            }
                .padding(20)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                .foregroundColor(Color("YellowBlack"))
            
            HStack{
                Image(systemName: "questionmark.app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                Text("Preguntas frecuentes")
                Spacer()
            }
                .padding(20)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                .foregroundColor(Color("YellowBlack"))
            
            HStack{
                Image(systemName: "lock.doc")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                Text("Acuerdo de confidencialidad")
                Spacer()
            }
                .padding(20)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                .foregroundColor(Color("YellowBlack"))
            
            HStack{
                Button {
                    logout()
                }label: {
                    Image(systemName: "x.square")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                    Text("Cerrar session")
                }
                
                Spacer()
            }
                .padding(20)
                .background(Color("BackgroundCards"))
                .cornerRadius(20)
                .foregroundColor(Color("YellowBlack"))
            
            
            Spacer()
        }.padding(20)
        

        List{
            
           
            Text("UserName: \(UserName)")
            
                
            
            Text("Informacion de pago")
            Text("Soporte")
            Text("Preguntas frecuentes")
            Text("Invita a tus amigos")
            Text("Acuerdo de privacidad")
            
//            Text(colorScheme == .dark ? "Dark" : "Light").foregroundColor(Color("Text"))
            Picker("Mode", selection: $isDarkMode) {
                Text("Dark")
                    .tag(true)
                Text("Light")
                    .tag(false)
            
            }.pickerStyle(SegmentedPickerStyle())
            
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
    }
}
