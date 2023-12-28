//
//  ContentView.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var viewModel: NewsViewModel
    
    var body: some View {
        VStack {
            Image(.nytLogo)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .clipped()
                .padding(.vertical, -30)
            
            CollectionView(newsForCell: $viewModel.news)
        }
        .padding()
    }
}

#Preview {
    NewsView()
        .environmentObject(NewsViewModel())
}
