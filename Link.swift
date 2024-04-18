//
//  Link.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//

import Foundation
import SwiftUI
struct Link: Identifiable, Decodable {
    let id: Int
    let webLink: String
    let smartLink: String
    let title: String
    let totalClicks: Int
    let originalImage: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "url_id"
        case webLink = "web_link"
        case smartLink = "smart_link"
        case title
        case totalClicks = "total_clicks"
        case originalImage = "original_image"
        case createdAt = "created_at"
    }
}
