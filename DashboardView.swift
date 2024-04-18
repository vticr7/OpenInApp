//
//  DashboardView.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//

import Foundation
import SwiftUI






import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 14/255, green: 111/255, blue: 255/255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Text("Dashboard")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color(white: 1, opacity: 0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 20) {
                            GreetingView(name: "Vaibhav Tiwary")
                                .padding(.leading, 20)
                            
                            // Enclosing OverviewView and ChartView in the same rectangle
                            VStack {
                                OverviewView(dateRange: "22 Aug - 23 Sept")
                                ChartView(data: viewModel.chartData)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)
                            
                            MetricsView(todayClicks: viewModel.todayClicks, topLocation: viewModel.topLocation, topSource: viewModel.topSource)
                            LinksView(topLinks: viewModel.topLinks, recentLinks: viewModel.recentLinks)
                            BottomButtonsView(supportNumber: viewModel.supportNumber)
                            Spacer(minLength: 75)
                        }
                    }
                    .background(Color(red: 245/255.0, green: 245/255.0, blue: 245/255.0))
                    .cornerRadius(16)
                }
            }
            .onAppear {
                viewModel.fetchData()
            }
            .overlay(
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                }
            )
        }
    }
}


struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Spacer()
            
            TabBarButton(imageName: "link", title: "Links", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            
            TabBarButton(imageName: "book", title: "Courses", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            
            ZStack {
                Circle()
                    .foregroundColor(Color(red: 14/255, green: 111/255, blue: 255/255))
                    .frame(width: 60, height: 60)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                    
                
                Image(systemName: "plus")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
            }
            .zIndex(8)
            .offset(y: -10)
             // Add this line to make the circle appear above other views
            
            TabBarButton(imageName: "rectangle.stack", title: "Campaigns", isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            
            TabBarButton(imageName: "person", title: "Profile", isSelected: selectedTab == 3) {
                selectedTab = 3
            }
            
            Spacer()
        }
        .frame(height: 80)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

struct TabBarButton: View {
    let imageName: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .blue : .gray)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

