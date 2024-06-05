//
//  HomePage.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 3/06/24.
//

import SwiftUI

struct HomePageView: View {
    
    // MARK: - View Properties
    
    @State private var showMenu = false
    @State private var showMenuFloating = false
    @State private var currentIndex = 0
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    @StateObject var viewModel: HomePageViewModel
    
    init(viewModel: HomePageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View Body
    
    var body: some View {
        ZStack {
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
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(item.nameIcon)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 15, height: 15)
                                        
                                        Text(item.nameCareer)
                                            .font(.headline)
                                            .padding(.horizontal)
                                            .foregroundColor(.blue)
                                        
                                    }
                                    Text(item.description)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .padding(.horizontal)
                                }
                            }
                        }

                    }
                }
                .padding(.horizontal, 10)
            }
            GeometryReader { _ in
                VStack {
                    SlideMenuView(viewModel: viewModel)
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                        .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
                        .animation(.easeInOut(duration: 0.5), value: showMenu)
                }
                .background(Color.black.opacity(showMenu ? 1 : 0))
            }
            GeometryReader { _ in
                HStack {
                    Spacer()
                    FloatingMenuView()
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                        .offset(x: showMenuFloating ? 0 : UIScreen.main.bounds.width)
                        .animation(.easeInOut(duration: 0.5), value: showMenuFloating)
                }
            }
            .navigationBarTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.showMenu.toggle()
                    self.showMenuFloating = false
                }) {
                    if showMenu {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundColor(Color.white)
                    } else {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                },
                trailing: HStack {
                    Button(action: {
                        // Acción notificaciones
                    }) {
                        Image(systemName: "bell")
                            .imageScale(.large)
                    }
                    Button(action: {
                        self.showMenuFloating.toggle()
                        self.showMenu = false

                    }) {
                        Image(systemName: "person.crop.circle")
                            .imageScale(.large)
                    }
                }
            )
            .navigationBarBackButtonHidden(true)
        }
    }
}
