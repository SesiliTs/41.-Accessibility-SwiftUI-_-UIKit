//
//  ContentView.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var viewModel: NewsViewModel
    @State private var fontSize = 14.0

    var body: some View {
        VStack {
            Image(.nytLogo)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .clipped()
                .padding(.vertical, -30)
            
            CollectionView(newsForCell: $viewModel.news, fontSize: CGFloat(fontSize))
            
            Slider(
                value: $fontSize, in: 10...24,
                step: 2
            ) {
                Text("Font")
            } minimumValueLabel: {
                Text("aA")
                    .font(.system(size: 10))
            } maximumValueLabel: {
                Text("aA")
                    .font(.system(size: 24))
            }
        }
        .padding()
    }
}

#Preview {
    NewsView()
        .environmentObject(NewsViewModel())
}
