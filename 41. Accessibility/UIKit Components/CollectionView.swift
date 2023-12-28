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
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
    
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let spacing: CGFloat = 15
            let collectionViewWidth = collectionView.frame.width
            let collectionViewHeight = collectionView.frame.height
            let itemWidth = (collectionViewWidth - spacing) / 2
            return CGSize(width: itemWidth, height: collectionViewHeight/2.5)
        }
    }
}

#Preview {
    CollectionView(newsForCell: .constant([News(url: "https://www.nytimes.com/2023/12/27/arts/the-crown-best-worst.html", id: 100000009237739, source: "New York Times", publishedDate: "2023-12-27", section: "Arts", byline: "By Sarah Lyall", type: "Article", title: "The Best and Worst (and Dumbest) From 6 Seasons of ‘The Crown’", media: [Media(mediaMetadata: [MediaMetadatum(url: "https://static01.nyt.com/images/2023/12/27/multimedia/27crown-awards-wclv/27crown-awards-wclv-thumbStandard.jpg")])]),
                                           News(url: "https://www.nytimes.com/2023/12/27/arts/the-crown-best-worst.html", id: 100000009237739, source: "New York Times", publishedDate: "2023-12-27", section: "Arts", byline: "By Sarah Lyall", type: "Article", title: "The Best and Worst (and Dumbest) From 6 Seasons of ‘The Crown’", media: [Media(mediaMetadata: [MediaMetadatum(url: "https://static01.nyt.com/images/2023/12/27/multimedia/27crown-awards-wclv/27crown-awards-wclv-thumbStandard.jpg")])])
                                          ]))
}
