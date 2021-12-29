//
//  ContentView.swift
//  NSD-OSC Builder
//
//  Created by Eric Boxer on 8/9/21.
//

import SwiftUI
import BoxOSC

struct ContentView: View {
    
    //    @Binding var oscString:String = ""
    @State private var oscString:String = "/osc/message/here"
    @State private var targetIP:String = "10.0.1.101"
    @State private var targetPort:String = "5555"
    
    init() {}
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            HStack{
                TextField("OSC String", text: $oscString, onEditingChanged: {_ in
                    print(OSC(from: oscString).address)
                })
            }
//            HStack{
//                Button("Copy To Clipboard", action: {
//                    let pasteboard = NSPasteboard.general
//                    pasteboard.declareTypes([.string], owner: nil)
//                    pasteboard.setString(OSC(from: oscString).asQLabFormattedOSCString(), forType: .string)
//                })
//                Text(OSC(from: oscString).asQLabFormattedOSCString())
//            }
//            HStack{
//            Button("Copy To Clipboard", action: {
//                let pasteboard = NSPasteboard.general
//                pasteboard.declareTypes([.string], owner: nil)
//                pasteboard.setString(OSC(from: oscString).asBytesString(), forType: .string)
//            })
//            Text(OSC(from: oscString).asBytesString())
//            }
//            HStack{
//            Button("Copy To Clipboard", action: {
//                let pasteboard = NSPasteboard.general
//                pasteboard.declareTypes([.string], owner: nil)
//                pasteboard.setString(OSC(from: oscString).asHexString(), forType: .string)
//            })
//            Text(OSC(from: oscString).asHexString())
//            }
            HStack{
                Text("Target IP:")
                TextField("targetIP", text: $targetIP)
                Text("Target Port:")
                TextField("targetPort", text: $targetPort)
//                Text(OSC(from: oscString).asHexString())
                Button("Copy NSD To Clipboard", action: {
                    let pasteboard = NSPasteboard.general
                    pasteboard.declareTypes([.string], owner: nil)
                    pasteboard.setString("!nsd\(targetIP):\(targetPort):\(OSC(from: oscString).asHexString())#", forType: .string)
                    
                    print(String(describing: OSC(from: oscString).asBytesString()))
                })
            }
        }).padding(10)
//        .frame(minWidth: 100, idealWidth: 300, maxWidth: 500, minHeight: 100, idealHeight: 100, maxHeight: 200, alignment: .leading)
        .frame(width: 500, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
