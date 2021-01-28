//
//  ContentView.swift
//  Tipper
//
//  Created by Vanessa Virgitti on 28/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var total = "0"
    @State var tipPercent: Double = 12.0
    
    var body: some View {
        ZStack{
//            Color.secondary.ignoresSafeArea()
            VStack{
                Text("Tip Calculator")
                    .font(.title)
                    .fontWeight(.bold)
                    
                
                HStack{
                    Text("£")
                    TextField("Total", text: $total)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.25))
                }
                .padding()
                
                HStack{
                    Slider(value: $tipPercent, in: 1...30, step: 1.0)
                    Text("\(Int(tipPercent))%")
                }
                .padding()
                
                if let totalNum = Double(total) {
                    HStack{
                        Text("Total Tip: ")
                        Text("£\(totalNum * tipPercent / 100, specifier: "%0.2f")").bold().foregroundColor(.purple)
                    }
            
                } else {
                    Text("Please enter a valid numerical value").background(Color.red).foregroundColor(.white)
                }
            
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
