//
//  ContentView.swift
//  Classical Music Tag Editor
//
//  Created by Massimiliano Federici on 19/07/2020.
//  Copyright © 2020 Massimiliano Federici. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
           Button(action: {
                self.load()
            }) {
                Text("Button title")
            }
        }
    }
    
    func load(){
        let audioFile = AudioFile().load(url: URL(fileURLWithPath: "/tmp/test.flac"))
        Metadata().readFrom(fileID: audioFile!)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
