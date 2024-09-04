//
//  NetworkManager.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import Foundation
import Alamofire
import Combine

class NetworkManager {
    
    //MARK: - VARIABLES -
    static let shared = NetworkManager()
    private init() {}
    
    //MARK: - REQUEST -
    func request<T: Decodable>(endPoint: String, method: HTTPMethod, parameters: Parameters? = nil) -> AnyPublisher<T, AFError> {
        return Future<T, AFError> { promise in
            AF.request(endPoint, method: method, parameters: parameters)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                            print("Raw JSON Response: \(json)")
                        }
                        do {
                            let decodedData = try JSONDecoder().decode(T.self, from: data)
                            promise(.success(decodedData))
                        } catch {
                            print("Decoding Error: \(error.localizedDescription)")
                            promise(.failure(AFError.responseSerializationFailed(reason: .decodingFailed(error: error))))
                        }
                    case .failure(let error):
                        print("Request Error: \(error.localizedDescription)")
                        promise(.failure(error))
                    }
                }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
