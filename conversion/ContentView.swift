//
//  ContentView.swift
//  conversion
//
//  Created by shalinth adithyan on 19/05/25.
//

import SwiftUI

struct ContentView: View {
    let conversion = ["Temperature conversion","Length Conversion","Time Conversion","Volume Conversion"]
    var body: some View {
        NavigationStack {
            Form {
                Section("Conversion"){
                    Text("Select Conversion")
                    ForEach(0..<conversion.count, id: \.self) { index in
                        NavigationLink(destination: Text("Hello, World!")) {
                            Text(self.conversion[index])
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                }
            }
            .navigationTitle("Conversion Unit")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
