//
//  MotivationViewModel.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI
import Alamofire

final class MotivationViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var podcasts: [Podcasts] = []
    
    @Published var selectedPodcast: Podcasts = Podcasts(id: 0, title: "", image: "https://", audio: "https://", duration: 0)
    @Published var isDetail: Bool = false
    @Published var isFavorites: Bool = false
    @Published var isAffirmation: Bool = false
    @Published var isSavedAffir: Bool = false

    
    @AppStorage("listened") var listened: Int = 0
    
    @AppStorage("savedPodcasts") var savedPodcasts: [String] = []
    
    func getFavoritePodcasts() -> [Podcasts] {
        
        return podcasts.filter{savedPodcasts.contains($0.title ?? "")}
    }
    
    func favoritesManager(_ video: Podcasts) {
        
        guard let title = video.title else { return }
        
        if savedPodcasts.contains(title) {
            
            if let indexer = savedPodcasts.firstIndex(of: title) {
                
                savedPodcasts.remove(at: indexer)
            }
            
        } else {
            
            savedPodcasts.append(title)
        }
    }
    
    func isFavorited(_ video: Podcasts) -> Bool {
        
        guard let title = video.title else { return false }
        
        return savedPodcasts.contains(title) ? true : false
    }
    
    func getPodcasts() {
        
        isLoading = true
        
        self.fetchPodcasts() { result in
            
            switch result {
                
            case .success(let success):
                
                self.podcasts = success.rows ?? []
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchPodcasts(completion: @escaping (Result<MotivationModel, Error>) -> Void ) {
        
        isLoading = true

        let params: Parameters = [
            
            "token": "d783cf23-19e1-4abc-af30-5bf2dd708920",
        ]
        
        let request = AF.request("https://quixoz.space/api/v2/podcasts", method: .get, parameters: params)
        
        request.responseDecodable(of: MotivationModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
            
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}

