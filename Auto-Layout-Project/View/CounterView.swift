//
//  CounterView.swift
//  Auto-Layout-Project
//
//  Created by MacBook Air on 30/04/24.
//

import SwiftUI


struct CounterView: View {
    @State var counter: Int = 0
    
    var body: some View {
        GeometryReader {
            geo in
            VStack (alignment: .center, spacing: 16) {
                HStack {
                    ButtonMinusView(value: $counter)
                    Text("\(counter)")
                        .font(.title)
                        .frame(width: geo.size.width/3, height: 50)
                    ButtonPlusView(value: $counter)
                }
                ButtonResetView(value: $counter)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .navigationBarTitle("Numeric Counter")
    }
}

struct ButtonPlusView: View {
    @Binding var value: Int
    
    var body: some View {
        Button(action: {value += 1}) {
            Image(systemName: "plus")
                .frame(width: 80, height: 50)
        }
        .background(.myPrimary)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

struct ButtonMinusView: View {
    @Binding var value: Int
    
    var body: some View {
        Button(action: {value -= 1}) {
            Image(systemName: "minus")
                .frame(width: 80, height: 50)
        }
        .background(.myPrimary)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

struct ButtonResetView: View {
    @Binding var value: Int
    
    var body: some View {            
        Button(action: {value = 0}) {
                Text("Reset")
                    .frame(width: 200, height: 50)
        }.overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.blue, lineWidth: 2) // Menambahkan border dengan warna biru dan ketebalan 1
        )
        .foregroundColor(Color.myPrimary)
    }
}

#Preview {
    CounterView()
}
