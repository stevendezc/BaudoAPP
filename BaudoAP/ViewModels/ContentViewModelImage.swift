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

class ContentViewModelImage: ObservableObject {
    @Published var postsImages: [Post] = []
    
    
    init() {
        fetchpostsImages()
        print("Fetch from init in the content view IMAGES")
    }
    
//    Function for Fetch posts from firebase
    func fetchpostsImages() {
        
        // NECESARIO ??
//       postsImages.removeAll()
        let dbImg = Firestore.firestore()
        let refImage = dbImg.collection("Posts").whereField("Typo", isEqualTo: "Image").order(by: "CreationDate" ,descending: true)
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
//        print("Estos son los post de Imagenes", refImage)
        
        print("Firestore query started IMAGES")
        refImage.getDocuments { snapshot, error in
            print("Firestore query started IMAGES - GOT DOCUMENT")
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                print("Firestore query started IMAGES - SNAPSHOT")
                for document in snapshot.documents {
                    var num = 0
                    print("Firestore query started IMAGES - DOCUMENTS", num)
                    num += 1
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
                    let CreationDate = data["CreationDate"] as? String ?? ""
                    
                    let postimage = Post(id: id,Thumbnail: Thumbnail,Thumbnail2: Thumbnail2, Author: Author,Location: Location, MainMediaUrl: MainMediaUrl, Typo: Typo, Description: Description,Category: Category,Title: "Title",CreationDate: CreationDate)
                    self.postsImages.append(postimage)
                    
//                    print(self.postsImages)
                }
            }
        }

    }
    

   
}

