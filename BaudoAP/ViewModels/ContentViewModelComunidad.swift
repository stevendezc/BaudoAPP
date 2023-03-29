//
//  ContentViewModelComunidad.swift
//  BaudoAP
//
//  Created by Codez on 26/03/23.
//

import Foundation
//
//  ContentViewModelPodcast.swift
//  BaudoAP
//
//  Created by Codez on 24/03/23.
//

import Foundation

import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

class ContentViewModelComunidad: ObservableObject {
    
    @Published var usersComunidad: [Users] = []
    
    init() {
        fetchusersComunidad()
    }
    
//    Function for Fetch posts from firebase
    func fetchusersComunidad() {
        
        // NECESARIO ??
        usersComunidad.removeAll()
        let dbCom = Firestore.firestore()
        
        let refComunidad = dbCom.collection("Comunidad")
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
//        print("Estos son los post de Imagenes", refImage)
        

        print("Firestore query started COMUNIDAD")
        refComunidad.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {

                    let data = document.data()
                    
                    let id: String = UUID().uuidString
                    let Thumbnail = data["Thumbnail"] as? String ?? ""
                    let Title = data["Title"] as? String ?? ""
                    let Description = data["Description"] as? String ?? ""
                    let CreationDate = data["CreationDate"] as? String ?? ""
                    let CategoryCom = data["CategoryCom"] as? String ?? ""
                    let Instagram = data["Instagram"] as? String ?? ""
                    let Facebook = data["Facebook"] as? String ?? ""
                    let Whatsapp = data["Whatsapp"] as? String ?? ""
                    let Twitter = data["Twitter"] as? String ?? ""
                    
                    let postcomunidad = Users(id: id, Thumbnail: Thumbnail, Description: Description, CategoryCom: CategoryCom, Title: Title, CreationDate: CreationDate, Instagram: Instagram, Facebook: Facebook, Twitter: Twitter, Whatsapp: Whatsapp)
                    self.usersComunidad.append(postcomunidad)
                    
                }
            }
        }
        
    }
   
}

