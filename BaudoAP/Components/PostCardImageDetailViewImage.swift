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
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                //                .border(Color.red, width: 3)
                
            }
            VStack{
                HStack{
                    Button("←"){
                        isPresented = false
                    }
                    .padding(.horizontal,5)
                    .padding(.vertical,1)
                    .foregroundColor(Color("Yellow"))
                    .background(Color.black)
                    .cornerRadius(30)
                    .font(.system(size: 30))
                    .padding(.leading,20)
                    
                    Spacer()
                    
                    Image("BaudoImage").padding(.trailing,20)
                }
                .padding(.vertical,40)
                Spacer()
                HStack{
                    Image("ReactionsVertical").padding(20)
                    Spacer()
                }
                
            }
            
            
            
            
            
            
        }
        
    }
}

struct PostCardImageDetailViewImage_Previews: PreviewProvider {
    static var previews: some View {
        PostCardImageDetailViewImage(model: Post(Thumbnail:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Thumbnail2:  "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FThumb1.png?alt=media&token=2bf3ad6b-51b2-4727-9d80-29755377c5c1",Author: "Foto por: BaudoAP", Location: "Triguba,Choco", MainMediaUrl: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Imagenes%2FComicLargo.png?alt=media&token=0e738d91-f4b7-43c6-9324-05dd3c0c2889", Typo: "Imagen", Description: "Esta es una breve descripcion de contenido de imagen para pruebas en el postCardImage y para solo visualizar coo se veria el texto en las cartas del home", Category: "Medio Ambiente",Title: "Title",CreationDate: "23/Marzo/2023"), isPresented: .constant(true))
    }
}
