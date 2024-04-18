//
//  Overview.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//

import Foundation
import SwiftUI
import SwiftUI

struct OverviewView: View {
    let dateRange: String
    
    var body: some View {
        HStack {
            Text("Overview")
                .font(.headline)
                .foregroundColor(Color(red: 153/255, green: 156/255, blue: 160/255))
                .padding(.leading)
            
            Spacer()
            
            HStack {
                Text(dateRange)
                    .font(.caption)
                    .foregroundColor(.black)
                
                Image(systemName: "clock")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal) // Side padding inside the rectangle
            .padding(.vertical, 8) // Top and bottom padding inside the rectangle
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.trailing)
        }
    }
}
