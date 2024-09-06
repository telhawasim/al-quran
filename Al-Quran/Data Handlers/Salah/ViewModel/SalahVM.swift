//
//  SalahVM.swift
//  Al-Quran
//
//  Created by Telha Wasim on 06/09/2024.
//

import Foundation
import Combine

class SalahVM: ObservableObject {
    
    //MARK: - VARIABLES -
    
    //Published
    @Published var model: SalahResponseModel?
    //Normal
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - GET SALAH API -
    func getSalahTime(currentTime: String, city: String, country: String) {
        let endPoint = "https://api.aladhan.com/v1/timingsByCity/\(currentTime)?city=\(city)&country=\(country)"
        
        NetworkManager.shared.request(endPoint: endPoint, method: .get)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request finished")
                case .failure(let failure):
                    print("Error: \(failure)")
                }
            }, receiveValue: { (data: SalahResponseModel) in
                self.model = data
            })
            .store(in: &self.cancellables)
    }
}
