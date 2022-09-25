//
//  ContentView.swift
//  cw7p2
//
//  Created by Othman Alkous on 25/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var tapped = false
    @State var major = ""
    var body: some View {
        VStack{
            
            HStack {
                Image(systemName: tapped ? "minus.circle" : "plus.circle")
                    .foregroundColor(tapped ? .red : .green)
                    .font(.title2)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.70)){
                        tapped.toggle()
                        }
                    }
                    
                Text("اختر تخصصك")
                    .font(.largeTitle)
            }
            .padding()
            
            if tapped {
                
            Text("علوم كمبيوتر")
                .font(.title2)
                .frame(width: 300, height: 50)
                .background(Color.cyan)
                .cornerRadius(14)
                .onTapGesture {
                    major = "علوم كمبيوتر"
                }
                
            Text("هندسة كمبيوتر")
                .font(.title2)
                
                .frame(width: 300, height: 50)
                .background(Color.cyan)
                .cornerRadius(14)
                .onTapGesture {
                    major = "هندسة كمبيوتر"
                }
            Text("تخصص اخر")
                .font(.title2)
                .frame(width: 300, height: 50)
                .background(Color.cyan)
                .cornerRadius(14)
                .onTapGesture {
                    major = "تخصص اخر"
                }
                
            }
            Spacer()
            Text("تخصصك: \(major)")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
