//
//  SalahView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 06/09/2024.
//

import SwiftUI

struct SalahView: View {
    
    //MARK: - VARIABLES -
    
    //State
    @State private var currentTime: String = ""
    //StateObject
    @StateObject private var viewModel = SalahVM()
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (spacing: 0) {
            HStack (spacing: 20) {
                Button(action: {
                    
                }, label: {
                    Image(ImageEnum.icSidebar.rawValue)
                })
                Text("Salah Time")
                    .font(.getBold(20.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                Spacer()
            } // Sidebar and Title
            Text(self.currentTime)
                .font(.getBold(34.0))
                .foregroundStyle(ColorEnum.color_240F4F.getColor)
                .padding(.top, 30)
            LazyVStack (spacing: 20) {
                CustomSalahTime(
                    title: "Fajr",
                    time: self.convertTo12HourFormat(timeString: self.viewModel.model?.data?.timings?.fajr ?? "")
                )
                CustomSalahTime(
                    title: "Dhuhr",
                    time: self.convertTo12HourFormat(timeString: self.viewModel.model?.data?.timings?.dhuhr ?? "")
                )
                CustomSalahTime(
                    title: "Asr",
                    time: self.convertTo12HourFormat(timeString: self.viewModel.model?.data?.timings?.asr ?? "")
                )
                CustomSalahTime(
                    title: "Maghrib",
                    time: self.convertTo12HourFormat(timeString: self.viewModel.model?.data?.timings?.maghrib ?? "")
                )
                CustomSalahTime(
                    title: "Isha",
                    time: self.convertTo12HourFormat(timeString: self.viewModel.model?.data?.timings?.isha ?? "")
                )
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding(.horizontal, 25)
        .onAppear {
            self.currentTime = self.getCurrentDate()
            self.updateTime()
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                self.updateTime()
            }
            self.viewModel.getSalahTime(currentTime: self.currentTime, city: "Lahore", country: "PK")
        }
        .animation(.default, value: self.viewModel.model != nil)
    }
    
    //MARK: - UPDATE TIME -
    private func updateTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        self.currentTime = formatter.string(from: Date())
    }
    
    //MARK: - CONVERT TO 12 HOUR FORMAT -
    private func convertTo12HourFormat(timeString: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        
        if let date = formatter.date(from: timeString) {
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: date)
        }
        return timeString
    }
    
    //MARK: - GET CURRENT DATE -
    private func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: Date())
    }
}

#Preview {
    SalahView()
}
