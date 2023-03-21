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
        let db = Firestore.firestore()
        
        let refVideo = db.collection("Posts").whereField("Tipo", isEqualTo: "Video")
        
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
//        print("Estos son los post de Imagenes", refImage)
        

        
        refVideo.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {

                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let Thumb = data["Thumb"] as? String ?? ""
                    let Autor = data["Autor"] as? String ?? ""
                    let Lugar = data["Lugar"] as? String ?? ""
                    let Url = data["Url"] as? String ?? ""
                    let Tipo = data["Tipo"] as? String ?? ""
                    let Descripcion = data["Descripcion"] as? String ?? ""
                    let Categoria = data["Categoria"] as? String ?? ""
                    
                    let post = Post(id: id,Thumb: Thumb,Autor: Autor,Lugar: Lugar, Url: Url, Tipo: Tipo, Descripcion: Descripcion,Categoria: Categoria)
                    self.postsVideos.append(post)
                    
                }
            }
        }
        

    }
   
}

