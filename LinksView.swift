//
//  LinksView.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//

import Foundation
import SwiftUI
struct LinksView: View {
    let topLinks: [Link]
    let recentLinks: [Link]
    @State private var selectedTab = "Top Links"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Picker("", selection: $selectedTab) {
                    Text("Top Links").tag("Top Links")
                    Text("Recent Links").tag("Recent Links")
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(width: 36, height: 36)
                        .background(Color(red: 235/255, green: 235/255, blue: 235/255))
                        .clipShape(RoundedRectangle(cornerRadius: 8))                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(selectedTab == "Top Links" ? topLinks : recentLinks) { link in
                        LinkRow(link: link)
                    }
                }
                .padding(.horizontal)            }
        }
    }
}
