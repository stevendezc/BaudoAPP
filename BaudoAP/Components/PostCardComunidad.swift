//
//  PostCardComunidad.swift
//  BaudoAP
//
//  Created by Codez on 27/03/23.
//

import SwiftUI
import SDWebImageSwiftUI


//extension Photo: Transferable {
//    static var transferRepresentation: some TransferRepresentation {
//        ProxyRepresentation(exporting: \.image)
//    }
//}

struct PostCardComunidad: View {
    @Environment(\.openURL) var openURL
    var model: Users
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            
            
            if model.category == "productivos" {
                HStack{
                    VStack{
                        WebImage(url: URL(string: model.thumbnail))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:120, height: 120)
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color("ComuPro"), lineWidth: 2)
                            )
                        Spacer()
                    }.padding(.top,5)

                    VStack(alignment: .leading,spacing: 5) {
                        
                        Text(model.name)
                            .foregroundColor(Color("ComuPro"))
                            .font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title))
                        
                        Text(model.description)
                            
                            .font(.custom("SofiaSans-Medium",size: 14,relativeTo: .body))
                    }.foregroundColor(Color("Text"))
                        .padding(.leading,10)
                        .padding(.trailing,15)
                }
                    
                HStack{
                    
                    if model.facebook != "" {
                        Button {
                            openURL(URL(string: model.facebook)!)
                        } label: {
                            Image("fb")
                        }
                    }
                    
                    if model.instagram != "" {
                        Button {
                            openURL(URL(string: model.instagram)!)
                        } label: {
                            Image("ig")
                        }
                    }
                    
                    if model.whatsapp != "" {
                        Button {
                            openURL(URL(string: model.whatsapp)!)
                        } label: {
                            Image("wa")
                        }
                    }
                    
                    if model.twitter != "" {
                        Button {
                            openURL(URL(string: model.twitter)!)
                        } label: {
                            Image("tw")
                        }
                    }
                    
                    Spacer()
                    
                    Image("share")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20)
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color("ComuPro"), lineWidth: 2)
                        )
                }
            }
            
            if model.category == "cultura" {
                HStack{
                    VStack{
                        WebImage(url: URL(string: model.thumbnail))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:120, height: 120)
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color("ComuCul"), lineWidth: 2)
                            )
                        Spacer()
                    }.padding(.top,5)
                    

                    VStack(alignment: .leading,spacing: 5) {
                        
                        Text(model.name)
                            .foregroundColor(Color("ComuCul"))
                            .font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title))
                        
                        Text(model.description)
                            
                            .font(.custom("SofiaSans-Medium",size: 14,relativeTo: .body))
                    }.foregroundColor(Color("Text"))
                        .padding(.leading,10)
                        .padding(.trailing,15)
                }
                    
                HStack{
                    
                    if model.facebook != "" {
                        Button {
                            openURL(URL(string: model.facebook)!)
                        } label: {
                            Image("fb")
                        }
                    }
                    
                    if model.instagram != "" {
                        Button {
                            openURL(URL(string: model.instagram)!)
                        } label: {
                            Image("ig")
                        }
                    }
                    
                    if model.whatsapp != "" {
                        Button {
                            openURL(URL(string: model.whatsapp)!)
                        } label: {
                            Image("wa")
                        }
                    }
                    
                    if model.twitter != "" {
                        Button {
                            openURL(URL(string: model.twitter)!)
                        } label: {
                            Image("tw")
                        }
                    }
                    Spacer()
                    Image("share")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20)
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color("ComuCul"), lineWidth: 2)
                        )
                }
            }
            
            if model.category == "turismo" {
                HStack{
                    VStack{
                        WebImage(url: URL(string: model.thumbnail))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:120, height: 120)
                            .background(.white)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20).stroke(Color("ComuTur"), lineWidth: 2)
                            )
                        Spacer()
                    }.padding(.top,5)
                    VStack(alignment: .leading,spacing: 5) {
                        
                        Text(model.name)
                            .foregroundColor(Color("ComuTur"))
                            .font(.custom("SofiaSans-Bold",size: 20,relativeTo: .title))
                        
                        Text(model.description)
                            
                            .font(.custom("SofiaSans-Medium",size: 14,relativeTo: .body))
                    }.foregroundColor(Color("Text"))
                        .padding(.leading,10)
                        .padding(.trailing,15)
                }
                    
                HStack{
                    
                    if model.facebook != "" {
                        Button {
                            openURL(URL(string: model.facebook)!)
                        } label: {
                            Image("fb")
                        }
                    }
                    
                    if model.instagram != "" {
                        Button {
                            openURL(URL(string: model.instagram)!)
                        } label: {
                            Image("ig")
                        }
                    }
                    
                    if model.whatsapp != "" {
                        Button {
                            openURL(URL(string: model.whatsapp)!)
                        } label: {
                            Image("wa")
                        }
                    }
                    
                    if model.twitter != "" {
                        Button {
                            openURL(URL(string: model.twitter)!)
                        } label: {
                            Image("tw")
                        }
                    }
                    Spacer()
//                    ShareLink(item: Post, preview: SharePreview(model.description, image: model.thumbnail))
                    Image("share")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:20)
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(Color("ComuTur"), lineWidth: 2)
                        )
                }
            }
            
            
        }
        .padding(15)
        .background(Color("BackgroundCards"))
        .cornerRadius(20)
    }
}

struct PostCardComunidad_Previews: PreviewProvider {
    static var previews: some View {
        PostCardComunidad(model: Users( thumbnail: "https://firebasestorage.googleapis.com/v0/b/baudoapp-c89ed.appspot.com/o/Comunidad%2FLogo%20Casa%20Matriz.png?alt=media&token=bceaa152-4df6-43a4-b693-c3515cc5f62b", description: "Casa dedicada al desarrollo integral del ser y a la recuperación de el poder de las raíces a través de su trabajo como centro de desarrollo cultural en el municipio de Filandia Quindío y que por los últimos 4 años se ha dedicado al trabajo colectivo...", category: "productivos", name: "Casa Matriz", creation_date: Date(), instagram: "https://www.instagram.com/matriz__casa/", facebook: "", twitter: "", whatsapp: "https://wa.me/3008405349",number: "", email: ""))
    }
}
