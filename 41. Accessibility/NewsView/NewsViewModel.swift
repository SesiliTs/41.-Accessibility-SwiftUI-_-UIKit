//
//  NewsViewModel.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import Foundation
import NetworkManager

final class NewsViewModel: ObservableObject {
    
    @Published var news = [News]()

    // MARK: - Initialisation
    
    init() {
        fetchData()
    }
    
    // MARK: - Network Call
    func fetchData() {
        let url = "https://api.worldnewsapi.com/search-news?api-key=756a0d88a49143989896b1497489a023&text=tesla."
        
        NetworkService.shared.getData(urlString: url) { [weak self] (result: Result<NewsData, Error>) in
            guard let self else { return }
            
            switch result {
            case .success(let data):
                self.news = data.news
            case .failure(let error):
                print(error)
            }
        }
    }

    
}
