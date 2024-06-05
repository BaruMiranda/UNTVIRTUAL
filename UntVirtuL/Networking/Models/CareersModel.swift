//
//  CareersModel.swift
//  UntVirtuL
//
//  Created by Baru Rafael Miranda Salas on 4/06/24.
//

import Foundation

struct CareersModel: Decodable, Hashable {
    
    let nameIcon: String
    let nameCareer: String
    let description: String
    
    init(
        nameIcon: String,
        nameCareer: String,
        description: String
    ) {
        self.nameIcon = nameIcon
        self.nameCareer = nameCareer
        self.description = description
    }
    
}
