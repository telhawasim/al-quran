//
//  SurahDetailVM.swift
//  Al-Quran
//
//  Created by Telha Wasim on 02/09/2024.
//

import Foundation
import Combine
import AVFoundation

class SurahDetailVM: ObservableObject {
    
    //MARK: - VARIABLES -
    
    //Published
    @Published var model: SurahDetailResponseModel?
    @Published var isPlaying = false
    @Published var currentPlayingIndex: Int? = nil
    //Normal
    private var player: AVPlayer?
    private var cancellables = Set<AnyCancellable>()
    private var surahID: String = ""
    
    //MARK: - GET HOME API -
    func getSurahDetailAPI(id: String) {
        self.surahID = id
        let endPoint = "https://quranapi.pages.dev/api/\(id).json"
        
        NetworkManager.shared.request(endPoint: endPoint, method: .get)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request finished")
                case .failure(let failure):
                    print("Error: \(failure)")
                }
            }, receiveValue: { (data: SurahDetailResponseModel) in
                self.model = data
            })
            .store(in: &self.cancellables)
    }
    
    //MARK: - PLAY AUDIO -
    func playAudio(from url: String, index: Int) {
        guard let audioURL = URL(string: url) else { return }
        let playerItem = AVPlayerItem(url: audioURL)
        self.player = AVPlayer(playerItem: playerItem)
        self.player?.play()
        self.isPlaying = true
        currentPlayingIndex = index
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.playerDidFinishPlaying),
            name: .AVPlayerItemDidPlayToEndTime,
            object: playerItem
        )
    }
    
    //MARK: - STOP AUDIO -
    func stopAudio() {
        self.player?.pause()
        self.isPlaying = false
        self.currentPlayingIndex = nil
    }
    
    //MARK: - PLAYER DID FINISH PLAYING -
    @objc private func playerDidFinishPlaying(note: NSNotification) {
        self.isPlaying = false
        self.playNextAudio()
    }
    
    //MARK: - PLAY NEXT AUDIO -
    private func playNextAudio() {
        guard let currentIndex = currentPlayingIndex else { return }
        let nextIndex = currentIndex + 1
        if nextIndex < self.model?.totalAyah ?? 0 {
            let nextUrl = "https://quranaudio.pages.dev/1/\(surahID)_\(nextIndex + 1).mp3"
            self.playAudio(from: nextUrl, index: nextIndex)
        } else {
            self.currentPlayingIndex = nil
        }
    }
}
