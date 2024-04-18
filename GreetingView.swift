//
//  GreetingView.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 16/04/24.
//

import Foundation
import SwiftUI
import SwiftUI

struct GreetingView: View {
    let name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Good morning")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255, opacity: 0.6))
            HStack {
                Text(name)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Image(systemName: "hand.wave.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 32))
            }        }
        .padding(.top)
    }
}

