//
//  DecksView.swift
//  newcrossdj
//
//  Created by Emanuele Giunta on 10/12/21.
//

import Foundation
import SwiftUI

struct dconfig {
    var LHVolume = 50.0
    var LMVolume = 50.0
    var LLVolume = 50.0
    var LVolume = 50.0
    var RVolume =  50.0
    var RHVolume = 50.0
    var RMVolume = 50.0
    var RLVolume = 50.0
    var balance = 50.0
}

// Meglio una state config o una struct con varie state var?

struct DecksView: View {
    //
    @State private var isEditing = false
    @State private var decksConfig = dconfig(
        LHVolume: 50.0,
        LMVolume: 50.0,
        LLVolume: 50.0,
        LVolume: 50.0,
        RVolume: 50.0,
        RHVolume: 50.0,
        RMVolume: 50.0,
        RLVolume: 50.0,
        balance: 50.0
    )
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack{
                        VStack(alignment: .center){
                            Slider(
                                value: $decksConfig.LHVolume,
                                in: 0...100,
                                step: 2.5,
                                minimumValueLabel: Text("\(Image(systemName: "speaker.fill"))"),
                                maximumValueLabel: Text("HI") + Text("G").foregroundColor(Color(UIColor.systemBackground)),
                                label: {
                                    Text("HI")
                                }
                            )
                            Slider(
                                value: $decksConfig.LMVolume,
                                in: 0...100,
                                step: 2.5,
                                minimumValueLabel: Text("\(Image(systemName: "speaker.fill"))"),
                                maximumValueLabel: Text("MID"),
                                label: {
                                    Text("MID")
                                }
                            )
                            Slider(
                                value: $decksConfig.LLVolume,
                                in: 0...100,
                                step: 2.5,
                                minimumValueLabel: Text("\(Image(systemName: "speaker.fill"))"),
                                maximumValueLabel: Text("LOW"),
                                label: {
                                    Text("LOW")
                                }
                            )
                        }.padding()
                    }.overlay(RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 3.0)
                                .foregroundColor(Color.orange)
                    ).padding()
                    Spacer()
                    VStack{
                        Text("qui ci andrebbe l'audio")
                        Text("Ma ancora non l'ho fatto")
                        Text("Mi sanu sentiri placeholder")
                    }
                    Spacer()
                    VStack{
                        VStack{
                            Slider(
                                value: $decksConfig.RHVolume,
                                in: 0...100,
                                step: 2.5,
                                minimumValueLabel: Text("\(Image(systemName: "speaker.fill"))"),
                                maximumValueLabel: Text("G").foregroundColor(Color(UIColor.systemBackground)) + Text("HI"),
                                label: {
                                    Text("HI")
                                }
                            )
                            Slider(
                                value: $decksConfig.RMVolume,
                                in: 0...100,
                                step: 2.5,
                                minimumValueLabel: Text("\(Image(systemName: "speaker.fill"))"),
                                maximumValueLabel: Text("MID"),
                                label: {
                                    Text("MID")
                                }
                            )
                            Slider(
                                value: $decksConfig.RLVolume,
                                in: 0...100,
                                step: 2.5,
                                minimumValueLabel: Text("\(Image(systemName: "speaker.fill"))"),
                                maximumValueLabel: Text("LOW"),
                                label: {
                                    Text("LOW")
                                }
                            )
                        }.padding()
                    }.overlay(RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 3.0)
                                .foregroundColor(Color.blue)
                    ).padding()
                }
            }
            VStack{
                HStack{
                    VStack{
                        Circle()
                            .foregroundColor(Color.orange)
                            .shadow(radius: 2)
                            .overlay(Circle()
                                        .scale(1/3)
                                        .foregroundColor(Color.black))
                        Slider(
                            value: $decksConfig.LVolume,
                            in: 0...100,
                            step: 2.5
                        ).padding()
                        Spacer()
                    }
                    Slider(
                        value: $decksConfig.balance,
                        in: 0...100,
                        step: 50,
                        minimumValueLabel: Text("L"),
                        maximumValueLabel: Text("R"),
                        label: {
                            Text("Balance")
                        }
                    ).padding()
                    
                    VStack {
                        Circle()
                            .foregroundColor(Color.blue)
                            .shadow(radius: 2)
                            .overlay(Circle()
                                        .scale(1/3)
                                        .foregroundColor(Color.black)
                            )
                            .onTapGesture{
                                GSAudio.sharedInstance.playSound(soundFileName: "Destra")
                            }
                        Slider(
                            value: $decksConfig.RVolume,
                            in: 0...100,
                            step: 2.5
                        ).padding()
                        Spacer()
                    }
                }.padding()
            }
        }
    }
}



struct DecksView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).previewInterfaceOrientation(.landscapeLeft)
    }
}
