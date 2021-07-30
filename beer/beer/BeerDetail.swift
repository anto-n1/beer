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
                        Image(selectedBeer.image_url)
                            .resizable()
                            .cornerRadius(12.0)
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            
                            Text(selectedBeer.name)
                                .font(.headline)
                    
                            Text(selectedBeer.type)
                                .font(.body)
                        
                            HStack {
                                Text("Test").font(.headline)
                                Spacer()
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
