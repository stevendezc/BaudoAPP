//
//  BaudoAPApp.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//
import SwiftUI
import Firebase
import FirebaseFirestore
import GoogleSignIn

@main
struct BaudoApApp: App {
    @StateObject var contentImage = ContentImage()
    
    @StateObject var usersettings = UserSettings()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //Llama al preload screen view
            //PreloadScreenView()
            //Call Straight Home
            //TabViews()
           Preload()
                .environmentObject(contentImage)
                .environmentObject(UserSettings())
        }
    }
}
