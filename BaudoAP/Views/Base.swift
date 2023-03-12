//
//  Base.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import SwiftUI

struct Base: View {
//    @EnvironmentObject var usersettings: UserSettings
//    Define user is logged or not
    @State var userIsLogged = false
    
    var body: some View {
        if userIsLogged {
            TabViews(userIsLogged: $userIsLogged)
            
        }else{
            Login(userIsLogged: $userIsLogged)
        }
    }
}

struct Base_Previews: PreviewProvider {
    static var previews: some View {
        Base()
    }
}
