//
//  CollectionViewCell.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private var newsImage = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    private var newsTitle = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = label.text?.uppercased()
        return label
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalCentering
        stackView.alignment = .leading
        return stackView
    }()
    
    //MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        stackViewConstraints()
        prepareForReuse()
        sampleModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(newsImage)
        mainStackView.addArrangedSubview(newsTitle)
        
    }
    
    private func stackViewConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
        newsTitle.text = nil
    }
    
    func configure(with model: News) {
        newsImage.loadFrom(stringUrl: model.image)
        newsTitle.text = model.title
    }
    
    func sampleModel() {
        newsImage.loadFrom(stringUrl: "https://www.reuters.com/investigates/special-report/assets/tesla-insurance/mastheads/tesla-insurance-share.jpg?v=313810211123")
        newsTitle.text = "news title"
    }
    
}


extension UIImageView {
    func loadFrom(stringUrl: String) {
        if let url = URL(string: stringUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let imageData = data else { return }
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            }.resume()
        }
    }
}

#Preview {
    CollectionViewCell()
}
