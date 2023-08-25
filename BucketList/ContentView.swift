//
//  ContentView.swift
//  BucketList
//
//  Created by Alex Bonder on 8/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .onTapGesture {
                    let str = "I did the thing!"
                    
                    FileManager.default.store(content: str, inFile: "message.txt")
                    
                    do {
                        if let input: String = try FileManager.default.retrieve(String.self, from: "message.txt") {
                            print(input)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
