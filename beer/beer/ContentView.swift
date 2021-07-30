//
//  ContentView.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var beerStore : BeerStore = BeerStore(beers: beerData)
    
    var body: some View {
        NavigationView {
            List {
                ForEach (beerStore.beers) { beer in
                    ListCell(beer: beer)
                }
            }
            .navigationBarTitle(Text("Beers"))
            .navigationBarItems(leading: NavigationLink(destination: AddNewBeer(BeerStore: self.beerStore)) {
                       Text("Add").foregroundColor(.blue)
            }, trailing: EditButton())
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ListCell: View {
    
    var beer: Beer
    
    var body: some View {
        NavigationLink(destination: BeerDetail(selectedBeer: beer)) {
            HStack {
                Image(beer.image_url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                Text(beer.name)
            }
        }
    }
}
