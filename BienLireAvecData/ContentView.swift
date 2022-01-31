//
//  ContentView.swift
//  BienLireAvecData
//
//  Created by sawako barberon on 01/01/2022.
//
import UIKit
import SwiftUI
import AVFoundation



struct ContentView: View {
    
    @State var items: [ItemModel]=[
    ItemModel(lemot: "carotte", legroupe: "a", leson: "son_carotte"),

    ItemModel(lemot: "maison", legroupe: "ai", leson: "son_maison"),

    ItemModel(lemot: "bateau", legroupe: "eau", leson: "son_bateau")
    ]

     let noms = ["aaa","bbb","ccc","ddd"]
     
     let PremierMot = ItemModel(lemot: "carotte", legroupe: "a", leson: "son_carotte")

    @State var currentNum = 1
    
    @State var text1 = ""
    @State var text2 = "le mot"
    @State var text3 = "le son"
    
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
    
        
        VStack{
        
        Label: do {
            Text("le groupe de son : \(text1)")
                .frame(width: 300, height: 50, alignment:.center)
                .background(Color.gray)
        }
        
        Label: do {
            Text(text2)
                .bold()
                .font(.largeTitle)
        
                .frame(width: 200, height: 200, alignment: .center)
        }
            
            
        Button("🔈") {
                
                if Bundle.main.path(forResource:items[currentNum].leson, ofType: "wav") != nil{
                    print("continue")
                } else{
                    print("error")
                }
                    
                do {
                    if let fileURL = Bundle.main.path(forResource:items[currentNum].leson, ofType: "wav"){
                        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileURL))
                    } else{
                        print("error")
                    }
                } catch let error {
                    print("cant't play \(error.localizedDescription)")
                }
                
                audioPlayer?.numberOfLoops = 0
                audioPlayer?.play()
                
            }
            .padding(.vertical)
            .foregroundColor(Color.black)
            .frame(width: 200, height: 200)
            .cornerRadius(70.0)
            .font(.largeTitle)
            
            HStack{
            Button("⬅️") {
                
                if currentNum == 0 {
                    currentNum = (items.count)-1
                } else {
                    currentNum -= 1
                }
                
                self.text1 = items[currentNum].legroupe
                
                self.text2 = items[currentNum].lemot
            }
            .font(.largeTitle)
            //.frame(width: 300, height: 1, alignment: .bottomLeading)
            .frame(alignment: .bottomLeading)
        
            Button("➡️") {
                
                if currentNum + 1 >= items.count {
                    currentNum = 0
                } else {
                    currentNum += 1
                }
                
                self.text1 = items[currentNum].legroupe
                
                self.text2 = items[currentNum].lemot
            }
            .font(.largeTitle)
            //.frame(width: 300, height: 1, alignment: .bottomLeading)
            .frame(alignment: .topLeading)
            
        }
            .frame(width: 300)
        }
    }
    
    
    mutating func NextOne(_ sender: Any) {
        if currentNum + 1 >= items.count {
            currentNum = 0
        } else {
            currentNum += 1
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
}
