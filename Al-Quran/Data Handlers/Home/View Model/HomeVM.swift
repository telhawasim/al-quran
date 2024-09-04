//
//  HomeVM.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import Foundation
import Combine

class HomeVM: ObservableObject {
    
    //MARK: - VARIABLES -
    
    //Published
    @Published var surahs: SurahList?
    //Normal
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - GET HOME API -
    func getHomeAPI() {
        let endPoint = "https://quranapi.pages.dev/api/surah.json"
        
        NetworkManager.shared.request(endPoint: endPoint, method: .get)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request finished")
                case .failure(let failure):
                    print("Error: \(failure)")
                }
            }, receiveValue: { (data: SurahList) in
                self.surahs = data
            })
            .store(in: &self.cancellables)
    }
}
