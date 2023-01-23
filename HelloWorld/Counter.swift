//
//  Counter.swift
//  HelloWorld
//
//  Created by Yogesh Bhawsar on 22/01/23.
//

import SwiftUI

struct Counter: View {
    
    @AppStorage("STR_COUNT") private var count = 0
    
    func increment() {
      count+=1
    }
    func increment(by amount: Int) {
        count+=amount
    }
    func reset() {
        count = 0
    }

    
    var body: some View {
        NavigationView {
                VStack {
                    Text("\(count)")
                        .font(.system(size: 72, weight: .semibold, design: .rounded))
                    
                    HStack{
                        Spacer()
                        Button("Add") {
                            increment()
                        }   .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .background(Color.blue)
                            .cornerRadius(8)
                        Spacer()
                        Button("Add by 5") {
                            increment(by: 5)
                        }   .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .background(Color.green)
                            .cornerRadius(8)
                        Spacer()
                        Button("Reset") {
                            reset()
                        }   .foregroundColor(.white)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                            .background(Color.red)
                            .cornerRadius(8)
                    }
                    
                } .padding(.all, 32)
            .navigationTitle("Counter")
        }
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}
