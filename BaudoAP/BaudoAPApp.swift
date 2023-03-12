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
//    @UIApplicationDelegateAdaptor(AppdDelegate.self) var appDelegate
    
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
                .environmentObject(UserSettings())
                .environmentObject(contentImage)
                
        }
    }
}
//
//class AppdDelegate: NSObject,UIApplicationDelegate{
//    func application(_ app: UIApplication,
//                     open url: URL,
//                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
//      return GIDSignIn.sharedInstance.handle(url)
//    }
//
//}
