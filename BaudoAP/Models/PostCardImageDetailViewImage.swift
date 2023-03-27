//
//  PostImageDetailViewImage.swift
//  BaudoAP
//
//  Created by Codez on 12/03/23.
//


import SwiftUI
import SDWebImageSwiftUI

struct PostCardImageDetailViewImage: View {
    
    var model: Post
    @Binding var isPresented: Bool
    
    var body: some View {

        ZStack(alignment: .topLeading){
                    
                    ScrollView(.horizontal){
                    WebImage(url: URL(string: model.MainMediaUrl))
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    
                    //                .border(Color.red, width: 3)
                        
                    }
                   
                    Button("X"){
                        isPresented = false
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,4)
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
                    .font(.system(size: 25))
                    .padding(40)
                        
            }
        
        }
}

struct PostCardImageDetailViewImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImage(model: Post(id: "10",Thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Author: "Foto por: BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FFoto0-50.jpg?alt=media&token=276dcba3-b7bf-4d0b-9535-a4f030715344", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title",CreationDate: "23/Marzo/2023"))
    }
}
