//
//  SlideMenuView.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 4/06/24.
//

import SwiftUI

struct SlideMenuView: View {
    
    @StateObject var viewModel: HomePageViewModel

    init(viewModel: HomePageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
                        ForEach(viewModel.fetchMenuList, id: \.self) { menuItem in
                            HomeListItemView(data: menuItem, isLastItem: menuItem == viewModel.fetchMenuList.last)
                        }
                    }
                    .padding(10)
                }
                Spacer()
            }
            .frame(width: geometry.size.width * 0.7)
            .padding(20)
            .background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomeListItemView: View {
    
    // MARK: - View Properties
    
    @State private var selectedOption: String?

    let data: String
    let isLastItem: Bool
    
    // MARK: - View Body

    var body: some View {
        HStack {
            Image(systemName: "square.fill")
                .foregroundColor(.blue)
            Text("\(data)")
                .font(.title3)
                .foregroundColor(Color.white)
                .underline(color: Color.white)
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
                    Image("drop_dow")
                        .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: 15, height: 15)
                        .background(.blue)
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
