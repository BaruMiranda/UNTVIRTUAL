//
//  HomePageViewModel.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 4/06/24.
//

import Foundation

final class HomePageViewModel: ObservableObject {
    
    @Published var careersModel: [CareersModel] = []
    
    init() {
    }

    var fetchCarouselList: [String] {
        let imagesCarousel = ["img_v3", "img_v2", "img_v1"]
        return imagesCarousel
    }
    
    var fetchMenuList: [String] {
        let itemsMenu = ["Área Personal", "img_v2", "img_v1"]
        return itemsMenu
    }
    
    func fetchCareers() -> [CareersModel] {
        let careersListModel = [
            CareersModel(nameCareer: "Ciencias Agropecuarias", description: ""),
            CareersModel(nameCareer: "Enfermería", description: ""),
            CareersModel(nameCareer: "Ciencias Biológicas", description: ""),
            CareersModel(nameCareer: "Farmacia y Bioquímica", description: ""),
            CareersModel(nameCareer: "Ciencias Económicas", description: ""),
            CareersModel(nameCareer: "Ingeniería", description: ""),
            CareersModel(nameCareer: "Ciencias Físicas y Matemáticas", description: ""),
            CareersModel(nameCareer: "Ingeniería Química", description: ""),
            CareersModel(nameCareer: "Ciencias Sociales", description: ""),
            CareersModel(nameCareer: "Medicina", description: ""),
            CareersModel(nameCareer: "Derecho y Ciencias Políticas", description: ""),
            CareersModel(nameCareer: "Estomatología", description: ""),
            CareersModel(nameCareer: "Educación y Ciencias de la Comunicación", description: "")
        ]
        return careersListModel
    }
    
}
