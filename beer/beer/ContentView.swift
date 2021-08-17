//
//  ContentView.swift
//  beer
//
//  Created by Antonin Douillard on 30/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var beerStore : BeerStore = BeerStore(beers: beerData)
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            
            List {
            
                // Search bar
                HStack{
                    HStack{
                        TextField("Search beer", text: $searchText)
                            .padding(.leading, 24)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    //.padding(.horizontal)
                    .onTapGesture(perform: {
                        isSearching = true
                    })
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            
                            if isSearching {
                                Button(action: { searchText = "" }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                })
                            }
                            
                        }.padding(.leading, 15)
                        .padding(.trailing, 15)
                        .foregroundColor(.gray)
                    ).transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    if isSearching {
                        Button(action: {
                            isSearching = false
                            searchText = ""
                            
                            // Keyboard disapear
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, 0)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                
                
                ForEach(beerStore.beers.filter({ "\($0)".contains(searchText) || searchText.isEmpty })) { beer in
                    ListCell(beer: beer)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Beers"))
            .padding(.leading, -5)
            .padding(.trailing, -5)
            
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: AddNewBeer(BeerStore: self.beerStore)){
                Text("Add").foregroundColor(.green)
            })
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        beerStore.beers.remove(atOffsets: offsets)
    }
    
    func moveItems(from source: IndexSet, to destination: Int) {
        beerStore.beers.move(fromOffsets: source, toOffset: destination)
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
                Image(beer.image_url_official)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 60)
                VStack(alignment: .leading, spacing: 10) {
                    Text(beer.name).font(.headline).bold()
                    Text(beer.type + " - " + beer.percent_proof + "°").fontWeight(.light)
                }
            }
        }
    }
}
