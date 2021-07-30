//
//  BeerStore.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import Foundation
import SwiftUI
import Combine
 
class BeerStore : ObservableObject {
    
    @Published var beers: [Beer]
    
    init (beers: [Beer] = []) {
        self.beers = beers
    }
}
