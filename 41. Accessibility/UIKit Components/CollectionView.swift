//
//  CollectionView.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import UIKit
import SwiftUI

struct CollectionView: UIViewRepresentable {
    @Binding var newsForCell: [News]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        // Additional configuration for your UICollectionView
        
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
    
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
        var parent: CollectionView
        
        init(parent: CollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            parent.$newsForCell.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            let currentCell = parent.newsForCell[indexPath.row]
            cell.configure(with: currentCell)
            return cell
        }
    }
}

#Preview {
    CollectionView(newsForCell: .constant([
        News(id: 1, title: "title", text: "some text", url: "https://www.reuters.com/investigates/special-report/tesla-insurance/", image: "https://www.reuters.com/investigates/special-report/assets/tesla-insurance/mastheads/tesla-insurance-share.jpg?v=313810211123", publishDate: "2023-11-21 15:03:40", author: "STEVE STECKLOW", authors: [
            "STEVE STECKLOW"
        ], language: "en", sourceCountry: "gb", sentiment: -0.63),
        News(id: 2, title: "second Title", text: "some text", url: "https://www.reuters.com/investigates/special-report/tesla-insurance/", image: "https://www.reuters.com/investigates/special-report/assets/tesla-insurance/mastheads/tesla-insurance-share.jpg?v=313810211123", publishDate: "2023-11-21 15:03:40", author: "STEVE STECKLOW", authors: [
            "STEVE STECKLOW"
        ], language: "en", sourceCountry: "gb", sentiment: -0.63)]))
}
