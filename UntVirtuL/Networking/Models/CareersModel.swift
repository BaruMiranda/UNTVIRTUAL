//
//  CareersModel.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 4/06/24.
//

import Foundation

struct CareersModel: Decodable, Hashable {
    
    let nameCareer: String
    let description: String
    
    init(nameCareer: String, description: String) {
        self.nameCareer = nameCareer
        self.description = description
    }
    
}
