//
//  ChartComponets.swift
//  DashboardApp
//
//  Created by Vaibhav  Tiwary on 16/04/24.
//

import Foundation




import SwiftUI

struct ChartView: View {
    let data: [Double]

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    // Drawing the line with area fill
                    if !data.isEmpty {
                        let xScale = geometry.size.width / CGFloat(data.count - 1) // Calculating X scale
                        let yScale = geometry.size.height / 5 // Calculating Y scale

                        let path = Path { path in
                            path.move(to: CGPoint(x: 0, y: geometry.size.height - CGFloat(data[0]) * yScale))
                            for index in data.indices {
                                let x = CGFloat(index) * xScale
                                let y = geometry.size.height - CGFloat(data[index]) * yScale
                                path.addLine(to: CGPoint(x: x, y: y))
                            }
                        }

                        // Gradient under the curve - Dark near the curve, transparent near the X-axis
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(red: 14/255, green: 111/255, blue: 255/255), // Dark blue
                                Color(red: 14/255, green: 111/255, blue: 255/255, opacity: 0) // Transparent blue
                            ]),
                            startPoint: .top, // Start at the top (near the curve)
                            endPoint: .bottom // End at the bottom (near the X-axis)
                        )
                        .mask(path) // Apply the gradient within the path (area under the curve)
                        .opacity(1.0) // Full opacity to make the gradient clearly visible

                        // Stroke path
                        path.stroke(Color(red: 14/255, green: 111/255, blue: 255/255), lineWidth: 2)
                    }

                    // Vertical and horizontal guide lines
                    ForEach(0..<7) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 1, height: geometry.size.height)
                            .position(x: CGFloat(index) * geometry.size.width / 6, y: geometry.size.height / 2)
                    }

                    ForEach(0..<6) { index in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: geometry.size.width, height: 1)
                            .position(x: geometry.size.width / 2, y: CGFloat(index) * geometry.size.height / 5)
                    }
                }
            }
            .frame(height: 160)

            // X-axis labels
            HStack(alignment: .center, spacing: 8) {
                ForEach(0..<7) { i in
                    Spacer(minLength: 0)
                    Text(String(format: "%02d:00", i * 4))
                        .font(.caption)
                        .foregroundColor(Color.gray)
                        .lineLimit(nil)  // Allow text to wrap onto multiple lines
                        .minimumScaleFactor(0.5)  // Reduce font size if needed to fit text
                    Spacer(minLength: 0)
                }
            }
        }
        .frame(height: 200) // Total height including labels
        .overlay(
            VStack(alignment: .leading) {  // Y-axis labels
                ForEach((1...5).reversed(), id: \.self) { i in
                    Spacer()
                    Text("\(i)")
                        .font(.caption)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Text("0")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading)
            , alignment: .leading
        )
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(data: [1, 2, 3, 4, 5])
    }
}


//struct ChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartView(data: [1, 2, 3, 4, 5])
//    }
//}

