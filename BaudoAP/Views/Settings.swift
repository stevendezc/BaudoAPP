//
//  Settings.swift
//  BaudoAP
//
//  Created by Codez on 1/04/23.
//

import SwiftUI
import Firebase



struct Settings: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.colorScheme) var colorScheme
    @Binding var userIsLogged : Bool
    
    @Binding var UserName: String
    
    var body: some View {
        
        
        
        List{
            Button("LogOut") {
                logout()
            }
            Text(colorScheme == .dark ? "Dark" : "Light").foregroundColor(Color("Text"))
            Text("UserName: \(UserName)")
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
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(userIsLogged: .constant(false), UserName: .constant("None"))
    }
}
