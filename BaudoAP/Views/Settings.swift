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

        List{
            
           
            Text("UserName: \(UserName)")
            
                
            Text("¿Qué es Baudó")
            Text("Informacion de pago")
            Text("El equipo")
            Text("Soporte")
            Text("Preguntas frecuentes")
            Text("Invita a tus amigos")
            Text("Acuerdo de privacidad")
            Button("Cerrar session") {
                logout()
            }
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
