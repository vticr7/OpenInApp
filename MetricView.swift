//
//  MetricView.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//


import Foundation
import SwiftUI



struct TabItem: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .foregroundColor(isSelected ? .white : .gray)
            
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .white : .gray)
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(isSelected ? Color.blue : Color.clear)
        .cornerRadius(8)
    }
}

import SwiftUI

import SwiftUI

struct MetricsView: View {
    let todayClicks: Int
    let topLocation: String
    let topSource: String
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                MetricView(value: "\(todayClicks)", label: "Today's Clicks", iconName: "hand.tap.fill")
                    .padding()
                    .frame(maxWidth: .infinity) // Ensures that each view stretches
                    .background(Color.white) // Sets the background color
                    .cornerRadius(8) // Adds rounded corners
                    .shadow(radius: 5) // Optional: Adds a shadow for a card-like appearance

                MetricView(value: topLocation, label: "Top Location", iconName: "location.fill")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)

                MetricView(value: topSource, label: "Top Source", iconName: "square.and.arrow.up.fill")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)
            }
            .padding(.horizontal) // Adds padding to the sides of the HStack

            HStack {
                Image(systemName: "chart.bar.fill")
                    .foregroundColor(.black)
                
                Text("View Analytics")
                    .font(.headline)
            }
            .frame(width: 328, height: 32) // Set specific width and height
            .padding() // Adjust padding to properly center content
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding(.horizontal) // Adds horizontal padding to the entire VStack
    }
}




struct MetricView: View {
    let value: String
    let label: String
    let iconName: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundColor(.blue)
            
            Text(value)
                .font(.headline)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
