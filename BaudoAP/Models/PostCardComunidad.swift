//
//  PostCardComunidad.swift
//  BaudoAP
//
//  Created by Codez on 27/03/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardComunidad: View {
    @Environment(\.openURL) var openURL
    var model: Users
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
                HStack{
                    WebImage(url: URL(string: model.Thumbnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:130)
                    //                .border(Color.red, width: 3)
                    
                    VStack(alignment: .leading,spacing: 5) {
                        Text(model.Title).font(.title3).foregroundColor( model.CategoryCom == "Proyectos productivos" ? .yellow : .blue)
                        
                        Text(model.Description).font(.caption)
                    }.foregroundColor(Color("Text"))
                    
                }
            HStack{
                Button {
                    openURL(URL(string: model.Instagram)!)
                } label: {
                    Image(systemName: "link")
                }
                Button {
                    openURL(URL(string: model.Whatsapp)!)
                } label: {
                    Image(systemName: "link")
                }
                Button {
                    openURL(URL(string: model.Twitter)!)
                } label: {
                    Image(systemName: "link")
                }
                Button {
                    openURL(URL(string: model.Facebook)!)
                } label: {
                    Image(systemName: "link")
                }
               
            }
            
           
                
            
        }   .padding(15)
            .background(Color("BackgroundCards"))
            .cornerRadius(20)
        
    }
}

struct PostCardComunidad_Previews: PreviewProvider {
    static var previews: some View {
        PostCardComunidad(model: Users(id: "1", Thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Comunidad%2FLogo%20Casa%20Matriz.png?alt=media&token=bceaa152-4df6-43a4-b693-c3515cc5f62b", Description: "Casa dedicada al desarrollo integral del ser y a la recuperación de el poder de las raíces a través de su trabajo como centro de desarrollo cultural en el municipio de Filandia Quindío y que por los últimos 4 años se ha dedicado al trabajo colectivo...", CategoryCom: "Proyectos productivos", Title: "Casa Matriz", CreationDate: "", Instagram: "https://www.instagram.com/matriz__casa/", Facebook: "", Twitter: "", Whatsapp: "https://wa.me/3008405349"))
    }
}
