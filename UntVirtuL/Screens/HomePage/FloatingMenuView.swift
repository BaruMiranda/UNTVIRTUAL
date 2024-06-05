//
//  FloatingMenuView.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 4/06/24.
//

import SwiftUI

struct FloatingMenuView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                // Acción al seleccionar "Área personal"
                print("Área personal")
            }) {
                Text("Área personal")
                    .foregroundColor(.blue)
            }
            Button(action: {
                // Acción al seleccionar "Perfil"
                print("Perfil")
            }) {
                Text("Perfil")
                    .foregroundColor(.blue)
            }
            NavigationLink(destination: InitialView()) {
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.white)
                    Text("Cerrar sesión")
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
