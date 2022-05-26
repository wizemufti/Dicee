//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Mufti, Shayan on 4/26/22.
//

import SwiftUI

struct ContentView: View {
    
    // Variable's to set dice images
    // State lets us update variables
    @State var leftDiceNum = 1
    @State var rightDiceNum = 1
    
    var body: some View {
        
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Image("diceeLogo")
                
                Spacer()                // puts space between image and HStack (Dices)
                
                // Put dices left and right (horizontal)
                HStack {
                    DiceView(n:leftDiceNum)           // left dice
                    DiceView(n:rightDiceNum)          // right dice
                }
                .padding(.horizontal)
                
                Spacer()                // puts space between Dices and text
                
                // Create button with some action
                Button(action: {
                    
                    // Assign dice to change to a random integer between 1 and 6
                    // Must add self inside of any closure to make it exclusive
                    self.leftDiceNum = Int.random(in: 1...6)
                    self.rightDiceNum = Int.random(in: 1...6)
                    
                }) {
                    Text("ROLL IT")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                
                .background(Color.red) // background color of text
            }
        }
    }
}

// extracted view of DiceView
struct DiceView: View {
    
    let n: Int      // n = dice number so we can enter different dice images
    
    var body: some View {
        
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


