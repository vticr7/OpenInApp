//
//  DashboardViewModel.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//

import Foundation
import SwiftUI


class DashboardViewModel: ObservableObject {
    @Published var chartData: [Double] = []
    @Published var topLinks: [Link] = []
    @Published var recentLinks: [Link] = []
    @Published var todayClicks: Int = 0
    @Published var topLocation: String = ""
    @Published var topSource: String = ""
    @Published var supportNumber: String = ""
    
    func fetchData() {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let responseData = jsonResult["data"] as? [String: Any] {
                    print("API Response:")
                    print(jsonResult)
                    
                    if let recentLinksArray = responseData["recent_links"] as? [[String: Any]],
                       let topLinksArray = responseData["top_links"] as? [[String: Any]],
                       let overallUrlChart = responseData["overall_url_chart"] as? [String: Int] {
                        DispatchQueue.main.async {
                            self.recentLinks = recentLinksArray.compactMap { data in
                                try? JSONDecoder().decode(Link.self, from: JSONSerialization.data(withJSONObject: data))
                            }
                            self.topLinks = topLinksArray.compactMap { data in
                                try? JSONDecoder().decode(Link.self, from: JSONSerialization.data(withJSONObject: data))
                            }
                            self.chartData = overallUrlChart.sorted { $0.key < $1.key }.map { Double($0.value) }
                        }
                    }
                    
                    if let todayClicks = jsonResult["today_clicks"] as? Int {
                        DispatchQueue.main.async {
                            self.todayClicks = todayClicks
                            
                        }
                    }
                    
                    if let topLocation = jsonResult["top_location"] as? String {
                        DispatchQueue.main.async {
                            self.topLocation = topLocation
                        }
                    }
                    
                    if let topSource = jsonResult["top_source"] as? String {
                        DispatchQueue.main.async {
                            self.topSource = topSource
                        }
                    }
                    
                    if let supportNumber = jsonResult["support_whatsapp_number"] as? String {
                        DispatchQueue.main.async {
                            self.supportNumber = supportNumber
                        }
                    }
                }
            } catch {
                print("Failed to parse JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
