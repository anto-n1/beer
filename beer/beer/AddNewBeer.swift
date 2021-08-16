//
//  AddNewBeer.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import Foundation
import SwiftUI

struct AddNewBeer: View {
    
    @StateObject var BeerStore: BeerStore
    @State private var name: String = ""
    @State private var type: String = ""
    @State private var percent_proof: String = ""
    @State private var drink_date: String = ""
    @State private var image_url_official: String = ""
    @State private var image_url_personal: String = ""
    
    var body: some View {

        Form {
            
            Section(header: Text("Beer details")) {
                
                //Image(systemName: "beer.fill").resizable().aspectRatio(contentMode: .fit).padding()
                
                DataInput(name: "Name", userInput: $name)
                DataInput(name: "Type", userInput: $type)
                DataInput(name: "Percent proof", userInput: $percent_proof)
                DataInput(name: "Drink date", userInput: $drink_date)
                
            }
            
            Button(action: addNewBeer) {
                Text("Add beer")
            }

        }
    }
    
    func addNewBeer() {
        
        let newBeer = Beer(id: UUID().uuidString, name: name, type: type, percent_proof: percent_proof, drink_date: "Date", image_url_official: "mon_image", image_url_personal: "mon_image")
        
        BeerStore.beers.append(newBeer)
        
        let jsonString = "{\"location\": \"the moon\"}"

        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("beers.json")
            do {
                try jsonString.write(to: pathWithFilename,
                                     atomically: true,
                                     encoding: .utf8)
            } catch {
                // Handle error
            }
        }
        
    }
    
}


struct AddNewBeer_Previews: PreviewProvider {
    static var previews: some View {
        AddNewBeer(BeerStore: BeerStore(beers: beerData))
    }
}

struct DataInput: View {
    
    var name: String
    @Binding var userInput: String
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(name)
                .font(.headline)
            TextField("Enter \(name)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
