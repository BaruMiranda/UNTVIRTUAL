//
//  ContentView.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 2/06/24.
//

import SwiftUI

struct InitialView: View {
    
    let homePageViewModel = HomePageViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                HStack {
                    Image("unt_logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .aspectRatio(contentMode: .fit)
                    VStack {
                        Text("Bienvenido a\nla plataforma")
                            .font(.title)
                            .padding(.leading, 10)
                        Text("UNTVIRTUAL")
                            .foregroundColor(.blue)
                            .font(.title)
                            .padding(.leading, 10)
                    }
                    .background(
                        GeometryReader { geometry in
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 4, height: geometry.size.height)
                        }
                    )
                }
                Text("Identifiquese usando su cuenta en:")
                    .padding(.top, 25)
                    .padding(.bottom, 15)
                
                NavigationLink(destination: HomePageView(viewModel: homePageViewModel)) {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                        Text("Correo UNT")
                            .foregroundColor(.white)
                            .padding(.horizontal, 90)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 25)
                Spacer()
            }
        }
    }
}


#Preview {
    InitialView()
}
