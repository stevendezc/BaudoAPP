//
//  BaudoAPApp.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//
import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct BaudoApApp: App {
    @StateObject var contentImage = ContentImage()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //Llama al preload screen view
            PreloadScreenView()
            //Call Straight Home
            //TabViews()
                .environmentObject(contentImage)
        }
    }
}
