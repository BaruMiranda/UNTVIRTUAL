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
        let itemsMenu = ["Área Personal", "Página Principal", "Calendario", "Mis Cursos"]
        return itemsMenu
    }
    
    func fetchCareers() -> [CareersModel] {
        let careersListModel = [
            CareersModel(nameIcon: "ic_ciencia", nameCareer: "Ciencias Agropecuarias", description: "Decano: Dr. Víctor Javier Vásquez Villalobos"),
            CareersModel(nameIcon: "ic_enfermera", nameCareer: "Enfermería", description: "Decano: Dra. Esther Justina Ramírez García"),
            CareersModel(nameIcon: "ic_cbiologicas", nameCareer: "Ciencias Biológicas", description: "Decano: Mg. Adalberto Javier Gonzáles Varas"),
            CareersModel(nameIcon: "ic_farmacia", nameCareer: "Farmacia y Bioquímica", description: "Decano: Dr. William Antonio Sagástegui Guarniz"),
            CareersModel(nameIcon: "ic_ceconomicas", nameCareer: "Ciencias Económicas", description: "Decano: Dr. Santiago Néstor Bocanegra Osorio"),
            CareersModel(nameIcon: "ic_ingenieria", nameCareer: "Ingeniería", description: "Decano: Dr. Miguel Armando Benites Gutiérrez"),
            CareersModel(nameIcon: "ic_fisicas", nameCareer: "Ciencias Físicas y Matemáticas", description: "Decano: Dra. Rosa Adriana Chu Campos"),
            CareersModel(nameIcon: "ic_quimica", nameCareer: "Ingeniería Química", description: "Decano: Dr. Mario Esven Reyna Linares"),
            CareersModel(nameIcon: "ic_sociales", nameCareer: "Ciencias Sociales", description: "Decano: Mg. Luis Enrique Coronado Tello"),
            CareersModel(nameIcon: "ic_medicina", nameCareer: "Medicina", description: "Decano: Dr. Luis Alberto Concepción Urteaga"),
            CareersModel(nameIcon: "ic_derecho", nameCareer: "Derecho y Ciencias Políticas", description: "Decano: Dr. Teódulo Jenaro Santos Cruz"),
            CareersModel(nameIcon: "ic_estomatologia", nameCareer: "Estomatología", description: "Decano: Dra. Teresa Etelvina Ríos Caro"),
            CareersModel(nameIcon: "ic_educacion", nameCareer: "Educación y Ciencias de la Comunicación", description: "Decano: Dr. Ervando Guevara Guevara")
        ]
        return careersListModel
    }
    
}
