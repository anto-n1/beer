//
//  Beer.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import Foundation
import SwiftUI
 
struct Beer : Codable, Identifiable {
    var id: String
    var name: String
    
    var type: String
    var percent_proof: Int
    
    var image_url: String
}
