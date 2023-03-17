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

class ContentViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    
    init() {
        fetchposts()
    }
    
    func fetchposts() {
        
        // NECESARIO ??
//        posts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        //let ImagenesContent = db.collection("Posts").whereField("Tipo", isEqualTo: "Imagen")
        
        print("Estos son los post de Imagenes", ref)
        
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {

                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let Autor = data["Autor"] as? String ?? ""
                    let Lugar = data["Lugar"] as? String ?? ""
                    let Url = data["Url"] as? String ?? ""
                    let Tipo = data["Tipo"] as? String ?? ""
                    let Descripcion = data["Descripcion"] as? String ?? ""
                    let Categoria = data["Categoria"] as? String ?? ""
                    
                    let post = Post(id: id,Autor: Autor,Lugar: Lugar, Url: Url, Tipo: Tipo, Descripcion: Descripcion,Categoria: Categoria)
                    self.posts.append(post)
                    
                }
            }
        }
        
//        var num = 0
        //TO KNOW HOW MUCH FETCH THERE IS
//        num += 1
//        print("Posts fetched",num)
    }
   
}

