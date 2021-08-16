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
    var percent_proof: String
    
    var image_url_official: String
    var image_url_personal: String
}
