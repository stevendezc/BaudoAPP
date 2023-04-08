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
                    WebImage(url: URL(string: model.thumbnail))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                        .frame(width:130)
//                        .border(model.CategoryCom == "Proyectos productivos" ? Color.yellow : .blue)
                        .overlay(
                            model.category == "productivos" ?
                            RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 4) : RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 4)
                            
                            )
                    
                    //                .border(Color.red, width: 3)
                    
                    VStack(alignment: .leading,spacing: 5) {
//                        if model.CategoryCom == "Proyectos productivos" {
//                            Text(model.title).font(.custom("SofiaSans-Medium",size: 20,relativeTo: .caption)).foregroundColor(Color("ComuPro"))
//                        }
//                        if model.CategoryCom == "Cultura e inclusion" {
//                            Text(model.title).font(.custom("SofiaSans-Medium",size: 20,relativeTo: .caption)).foregroundColor(Color("ComuPcul"))
//                        }
//                        if model.CategoryCom == "Turismo comunitario" {
//                            Text(model.title).font(.custom("SofiaSans-Medium",size: 20,relativeTo: .caption)).foregroundColor(Color("ComuTur"))
//                        }
                        
                        Text(model.name).foregroundColor(model.category == "productivos" ? Color.green : Color.blue).font(.custom("SofiaSans-Bold",size: 18,relativeTo: .title))
                        
                        Text(model.creationDateString).font(.custom("SofiaSans-Medium",size: 15,relativeTo: .caption))
                        
                        Text(model.description).font(.caption)
                    }.foregroundColor(Color("Text"))
                    
                }
            HStack{
                Button {
                    openURL(URL(string: model.instagram)!)
                } label: {
                    Image("fb")
                }
                Button {
                    openURL(URL(string: model.whatsapp)!)
                } label: {
                    Image("ig")
                }
                Button {
                    openURL(URL(string: model.twitter)!)
                } label: {
                    Image("wa")
                }
                Button {
                    openURL(URL(string: model.facebook)!)
                } label: {
                    Image("tw")
                }
               
            }
            
           
                
            
        }   .padding(15)
            .background(Color("BackgroundCards"))
            .cornerRadius(20)
        
    }
}

struct PostCardComunidad_Previews: PreviewProvider {
    static var previews: some View {
        PostCardComunidad(model: Users( thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Comunidad%2FLogo%20Casa%20Matriz.png?alt=media&token=bceaa152-4df6-43a4-b693-c3515cc5f62b", description: "Casa dedicada al desarrollo integral del ser y a la recuperación de el poder de las raíces a través de su trabajo como centro de desarrollo cultural en el municipio de Filandia Quindío y que por los últimos 4 años se ha dedicado al trabajo colectivo...", category: "Proyectos productivos", name: "Casa Matriz", creation_date: Date(), instagram: "https://www.instagram.com/matriz__casa/", facebook: "", twitter: "", whatsapp: "https://wa.me/3008405349",number: "", email: ""))
    }
}
