//
//  BottomButtonView.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 17/04/24.
//

import Foundation
import SwiftUI



import SwiftUI




import SwiftUI

struct BottomButtonsView: View {
    let supportNumber: String
    
    var body: some View {
        VStack(spacing: 20) {
            // "View All Links" Button remains centered as per your previous request
            Button(action: {}) {
                HStack {
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.black)
                    Text("View All Links")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 55)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }

            // "Talk with us" Button content aligned with the start
            Button(action: {}) {
                HStack {
                    Image(systemName: "message.fill") // Replace with a WhatsApp icon if available
                        .foregroundColor(.green)
                    Text("Talk with us")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .padding([.leading, .top, .bottom])
                .background(Color(red: 74/255, green: 209/255, blue: 95/255, opacity: 0.12))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }

            // "Frequently Asked Questions" Button content aligned with the start
            Button(action: {}) {
                HStack {
                    Image(systemName: "questionmark.circle.fill") // Replace with your 'F and Q' icon if available
                        .foregroundColor(.blue)
                    Text("Frequently Asked Questions")
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .padding([.leading, .top, .bottom])
                .background(Color(red: 232 / 255, green: 241 / 255, blue: 255 / 255, opacity: 1))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }

            // Additional button (if needed) here...
        }
        .padding(.horizontal)
    }
}




