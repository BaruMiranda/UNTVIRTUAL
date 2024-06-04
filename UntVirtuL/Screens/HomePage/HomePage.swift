//
//  HomePage.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 3/06/24.
//

import SwiftUI

struct HomePageView: View {
    
    @State private var showMenu = false
    @State private var currentIndex = 0
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

@StateObject var viewModel: HomePageViewModel
    
    init(viewModel: HomePageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Image("logo_principal")
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .padding()
            TabView(selection: $currentIndex) {
                ForEach(viewModel.fetchCarouselList.indices, id: \.self) { index in
                    Image(viewModel.fetchCarouselList[index])
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer) { _ in
                let newIndex = (currentIndex + 1) % viewModel.fetchCarouselList.count
                currentIndex = newIndex
            }
            VStack(alignment: .leading) {
                           Text("Nuestras Facultades")
                               .font(.title)
                               .padding(.bottom, 10)
                               .padding(.top, 20)
                               .padding(.leading, 20)
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                        ForEach(viewModel.fetchCareers(), id: \.self) { item in
                            VStack {
                                HStack {
                                    Image(systemName: "circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 30, height: 30)
                                    
                                    Text(item.nameCareer)
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                    
                                }
                                Text("Descripción del ítem")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
                           .padding(.horizontal, 10)
                       }
            Spacer()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(
            leading: Button(action: {
                self.showMenu.toggle()
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
            },
            trailing: HStack {
                Button(action: {
                    // Acción notificaciones
                }) {
                    Image(systemName: "bell")
                        .imageScale(.large)
                }
                Button(action: {
                    
                }) {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                }
            }
        )
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showMenu) {
            VStack {
                Image("unt_logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(0..<4) { index in
                            HomeListItemView(data: "items[index]", index: index, isLastItem: index == 4 - 1)
                        }
                    }
                    .padding(10)
                }
            }
            .padding(20)
        }
    }
}

struct HomeListItemView: View {
    let data: String
    let index: Int
    let isLastItem: Bool
    @State private var selectedOption: String?
    
    var body: some View {
        HStack {
            Image(systemName: "square.fill")
                .foregroundColor(.blue)
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
                        .foregroundColor(.green)
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
