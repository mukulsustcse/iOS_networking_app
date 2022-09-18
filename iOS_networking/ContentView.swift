//
//  ContentView.swift
//  iOS_networking
//
//  Created by M. A. Alim Mukul on 18.09.22.
//

import SwiftUI

/*
 Fetch a string from "http://numbersapi.com/random/trivia" website and show it to the screen. Pressing the button allows user to get a new fact.
 */

struct ContentView: View {
    
    @ObservedObject var model:Model
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text(model.fact)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            Button(action: {
                
                model.getRemoteData()
                
            }, label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.green)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .frame(width: 220, height: 56)
                    
                    Text("Get me a new fact")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: Model())
    }
}
