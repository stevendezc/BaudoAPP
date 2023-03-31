//
//  ContentImage.swift
//  BaudoAP
//
//  Created by Codez on 11/03/23.
//

import Foundation


import SwiftUI
import FirebaseFirestore
import Firebase
import FirebaseAuth

class ContentViewModelVideo: ObservableObject {
    @Published var postsVideos: [Post] = []
    
    
    init() {
        fetchpostsVideos()
        
    }
    
//    Function for Fetch posts from firebase
    func fetchpostsVideos() {
        
        // NECESARIO ??
       postsVideos.removeAll()
        let dbVid = Firestore.firestore()
        
        let refVideo = dbVid.collection("Posts").whereField("Typo", isEqualTo: "Video")
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
//        print("Estos son los post de Imagenes", refImage)
        

        print("Firestore query started VIDEO")
        refVideo.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {

                    let data = document.data()
                    
                    let id: String = UUID().uuidString
                    let Thumbnail = data["Thumbnail"] as? String ?? ""
                    let Thumbnail2 = data["Thumbnail2"] as? String ?? ""
                    let Author = data["Author"] as? String ?? ""
                    let Location = data["Location"] as? String ?? ""
                    let MainMediaUrl = data["MainMediaUrl"] as? String ?? ""
                    let Typo = data["Typo"] as? String ?? ""
                    let Description = data["Description"] as? String ?? ""
                    let Category = data["Category"] as? String ?? ""
                    let Title = data["Title"] as? String ?? ""
                    let CreationDate = data["CreationDate"] as? String ?? ""
                    
                    let postvideo = Post(id: id, Thumbnail: Thumbnail,Thumbnail2: Thumbnail2,Author: Author,Location: Location, MainMediaUrl: MainMediaUrl, Typo: Typo, Description: Description,Category: Category,Title: Title,CreationDate: CreationDate)
                    self.postsVideos.append(postvideo)
                    
                }
            }
        }
        

    }
   
}

