//
//  BeerDetail.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import Foundation
import SwiftUI

struct BeerDetail: View {
    
    let selectedBeer: Beer
    
    var body: some View {
        Form {
            Section(header: Text("Beer Details")) {
                Image(selectedBeer.image_url_personal)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                HStack {
                    Text("Name : ").font(.body)
                    Text(selectedBeer.name).font(.headline)
                }
                
                HStack {
                    Text("Type : ").font(.body)
                    Text(selectedBeer.type).font(.headline)
                }
                
                HStack {
                    Text("Percent proof : ").font(.body)
                    Text(selectedBeer.percent_proof + "°").font(.headline)
                }
                
                HStack {
                    Text("Drink date : ").font(.body)
                    Text(selectedBeer.drink_date).font(.headline)
                }
            }
        }
    }
}

struct BeerDetail_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetail(selectedBeer: beerData[0])
    }
}
