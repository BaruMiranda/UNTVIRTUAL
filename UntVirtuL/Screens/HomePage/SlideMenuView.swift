//
//  SlideMenuView.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 4/06/24.
//

import SwiftUI

struct SlideMenuView: View {
    
    // MARK: - View Body
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("unt_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                Divider ()
                    .frame (width: 200, height: 2) .background (Color.white)
                    .padding(.horizontal, 16)
                    .blur(radius: 0.5)
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(0..<4) { index in
                            HomeListItemView(data: "items[index]", index: index, isLastItem: index == 4 - 1)
                        }
                    }
                    .padding(10)
                }
                Spacer()
            }
            .frame(width: geometry.size.width * 0.7)
            .padding(20)
            .background(Color.blue)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeListItemView: View {
    
    // MARK: - View Properties
    
    @State private var selectedOption: String?

    let data: String
    let index: Int
    let isLastItem: Bool
    
    // MARK: - View Body

    var body: some View {
        HStack {
            Image(systemName: "square.fill")
                .foregroundColor(.white)
            Text("\(data) \(index)")
            Spacer()
            if isLastItem {
                Menu {
                    Button(action: {
                        self.selectedOption = "Materia 1"
                    }) {
                        Text("Materia 1")
                    }
                    Button(action: {
                        self.selectedOption = "Materia 2"
                    }) {
                        Text("Materia 2")
                    }
                } label: {
                    Image(systemName: "square.fill")
                        .foregroundColor(.white)
                        .contextMenu {
                            Text("Seleccionar opción")
                        }
                }
            } else {
                Spacer()
            }
        }
        .onChange(of: selectedOption) { _ in
            if let newValue = selectedOption {
                print("Opción seleccionada: \(newValue)")
            }
        }
    }
}

#Preview {
    SlideMenuView()
}
