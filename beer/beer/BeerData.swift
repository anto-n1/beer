//
//  BeerData.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import Foundation
import UIKit
import SwiftUI

var beerData: [Beer] = loadJson("beers.json")
 
func loadJson<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename,
                                  withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
