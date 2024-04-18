//
//  LinkRow.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 16/04/24.
//

import Foundation
import SwiftUI
import Foundation
import SwiftUI

struct LinkRow: View {
    let link: Link
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: link.originalImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(width: 60, height: 60)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(link.title)
                        .font(.headline)
                        .lineLimit(1)
                    
                    Text(formatDate(dateString: link.createdAt))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(link.totalClicks)")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("Clicks")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.white)
            
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .fill(Color(red: 200/255, green: 220/255, blue: 255/255))
                
                RoundedRectangle(cornerRadius: 0)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(.blue)
                
                HStack {
                    Text(link.webLink)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button(action: {
                        UIPasteboard.general.string = link.webLink
                    }) {
                        Image(systemName: "doc.on.doc")
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing, 16)
                }
                .padding(.vertical, 8)
                .padding(.leading, 16)
            }
            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 0, y: 2)
        .padding(.vertical, 8)
    }
    
    func formatDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: date)
        }
        
        return dateString
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


