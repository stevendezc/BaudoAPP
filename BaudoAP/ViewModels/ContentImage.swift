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

class ContentImage: ObservableObject {

    @Published var posts: [Post] = []
    
    init() {
        fetchposts()
    }
    
    func fetchposts() {
        // NECESARIO ??
        posts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Posts")
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let Name = data["Name"] as? String ?? ""
                    let Url = data["Url"] as? String ?? ""
                    let Tipo = data["Tipo"] as? String ?? ""
                    let Info = data["Info"] as? String ?? ""
                    let Descripcion = data["Descripcion"] as? String ?? ""
                    let Categoria = data["Categoria"] as? String ?? ""
                    
                    let post = Post(id: id,Name: Name,Url: Url, Tipo: Tipo, Descripcion: Descripcion,Categoria: Categoria)
                    self.posts.append(post)
                    
                }
            }
            
        }
    }
    
    
    
    
}

