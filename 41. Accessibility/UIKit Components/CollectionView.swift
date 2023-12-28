//
//  CollectionView.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import SwiftUI

struct CollectionView: UIViewRepresentable {
    @Binding var newsForCell: [News]
    var fontSize: CGFloat
    
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
        context.coordinator.fontSize = fontSize
        uiView.reloadData()
    }
    
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        var parent: CollectionView
        var fontSize: CGFloat = 14
        
        init(parent: CollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            parent.$newsForCell.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            let currentCell = parent.newsForCell[indexPath.row]
            cell.configure(with: currentCell, fontSize: fontSize)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let collectionViewWidth = collectionView.frame.width
            let collectionViewHeight = collectionView.frame.height
            return CGSize(width: collectionViewWidth - 20, height: collectionViewHeight / 2.1)
        }
    }
}
