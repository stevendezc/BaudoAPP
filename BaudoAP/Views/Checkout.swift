//
//  Checkout.swift
//  BaudoAP
//
//  Created by Codez on 2/06/23.
//

import SwiftUI

struct Checkout: View {
    
    @State private  var correo = ""
    @State private  var nombre = ""
    @State private  var documento = ""
    @State private  var departamento = ""
    @State private  var ciudad = ""
    @State private  var direccion = ""
    @State private  var telefono = ""
    
    var body: some View {
        
        ScrollView {
            VStack{
                Text("Informacion \n de contacto").font(.custom("SofiaSans-Black",size: 25,relativeTo: .title2))
                
                VStack(alignment: .leading){
                    
                    Group {
                        Text("Correo")
                            .font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2))
                            .padding(.leading,10)
                        .foregroundColor(Color("Yellow"))
                        TextField("Correo", text: $correo)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        Text("Nombre").font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2)).padding(.leading,10).foregroundColor(Color("Yellow"))
                        
                        TextField("nombre", text: $nombre)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        Text("Documento de identidad")
                            .font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2))
                            .padding(.leading,10)
                            .foregroundColor(Color("Yellow"))
                        TextField("Documento", text: $documento)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        Text("Departamento")
                            .font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2))
                            .padding(.leading,10)
                            .foregroundColor(Color("Yellow"))
                        TextField("Departamento", text: $departamento)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        Text("Ciudad").font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2)).padding(.leading,10).foregroundColor(Color("Yellow"))
                        TextField("Ciudad", text: $ciudad)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        Text("Direccion").font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2)).padding(.leading,10).foregroundColor(Color("Yellow"))
                        TextField("Direccion", text: $direccion)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        Text("Telefono").font(.custom("SofiaSans-Black",size: 20,relativeTo: .title2)).padding(.leading,10).foregroundColor(Color("Yellow"))
                        TextField("Telefono", text: $telefono)
                            .padding()
                            .foregroundColor(.black)
                            .textFieldStyle(.plain)
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(20)
                    }
                    
                    Group {
                        HStack(alignment: .center){
                            Button(action: {}, label: {
                                Text("Continuar")
                                    .padding().overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("Yellow"), lineWidth: 2))
                            })
                        }
                        
                    }
                }
                .padding(.top,30)
                .padding(.horizontal,20)
            }
        }
        
       
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}
