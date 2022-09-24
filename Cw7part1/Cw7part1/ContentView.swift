//
//  ContentView.swift
//  Cw7part1
//
//  Created by Othman Alkous on 23/09/2022.
//

import SwiftUI



struct filmsdetails: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let actors: [actorsdetails]
}
struct actorsdetails: Identifiable {
    let id = UUID()
    let actor: String
    let actorimage: String
}

struct ContentView: View {
    let movies = [
        
             filmsdetails(
                name: "dump&dumper", image: "dump&dumper",
                actors: [actorsdetails(actor: "Jim", actorimage: "jim"),
                          actorsdetails(actor: "Jeff", actorimage: "jeff"),
                         actorsdetails(actor: "Lauren", actorimage: "lauren"),
                         actorsdetails(actor: "Brady", actorimage: "brady"),
                         actorsdetails(actor: "Mike", actorimage: "mike")                        ]
    ),
                    filmsdetails(
                        name: "captainphilips", image: "captainphilips", actors: [actorsdetails(actor: "Tom", actorimage: "tom"),
                        actorsdetails(actor: "Barkhad", actorimage: "barkhad"),actorsdetails(actor: "Faysal", actorimage: "faysal"),actorsdetails(actor: "Mahat", actorimage: "mahat"),actorsdetails(actor: "Barkhad", actorimage: "barkhad1")                                                                                 ]
                                                                            
        ), filmsdetails(
            name: "the perge", image: "theperge",
            actors: [actorsdetails(actor: "Frank", actorimage: "frank"), actorsdetails(actor:"Zach",actorimage:"zach"),
                     actorsdetails(actor: "Zoe", actorimage: "zoe") ,actorsdetails(actor: "Carmen", actorimage: "carmen")
                     ,actorsdetails(actor: "Kiele", actorimage: "kiele")]
        )
             ]
    
    var body: some View {
        NavigationView{
        List{
            ForEach(movies){movie in
                NavigationLink(destination: secondview(movie: movie)){
                MovieList(movie: movie)
                }
            }
            
            
        }
            .navigationTitle("Movies")        }.accentColor(.white)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct secondview: View {
    let movie: filmsdetails
    var body: some View{
        
        ZStack {
            Color.black
            Image(movie.image)
                .resizable()
                .scaledToFit()
                .opacity(0.5)
                .blur(radius: 5)
            VStack {
                Image(movie.image)
                    .resizable()
                    .frame(width: 190, height: 190)
                    .clipShape(Circle())
                    .padding(8)
                    
                    .background(Color.white)
                    .clipShape(Circle());                Text(movie.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                ScrollView(.horizontal){
                HStack{
                    
                    ForEach(movie.actors) { actorr in
                        VStack{
                           
                            Image(actorr.actorimage)
                                .resizable()
                                .frame(width: 120, height: 120)
                                .clipShape(Circle())
                                
                        Text(actorr.actor)
                            .foregroundColor(.white)
                        }
                    }
                    }
                }
            }
        }.ignoresSafeArea()
}
}

struct MovieList: View {
    let movie: filmsdetails
    
    var body: some View {
        
        HStack {
            Image(movie.image)
                .resizable()
                .frame(width: 150, height: 150)
            .clipShape(Circle())
            Text(movie.name)
                .font(.title2)
                .fontWeight(.semibold)
        }
        
    }
}

