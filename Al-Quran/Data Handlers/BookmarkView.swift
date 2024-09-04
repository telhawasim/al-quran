//
//  BookmarkView.swift
//  Al-Quran
//
//  Created by Telha Wasim on 01/09/2024.
//

import SwiftUI

struct BookmarkView: View {
    
    //MARK: - VIEWS -
    var body: some View {
        VStack (spacing: 0) {
            HStack (spacing: 20) {
                Button(action: {
                    
                }, label: {
                    Image(ImageEnum.icSidebar.rawValue)
                })
                Text("Bookmarks")
                    .font(.getBold(20.0))
                    .foregroundStyle(ColorEnum.color_672CBC.getColor)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(ImageEnum.icSearch.rawValue)
                })
            } // Top View
            HStack {
                Button(action: {
                    
                }, label: {
                    Image(ImageEnum.icAddCollection.rawValue)
                    Text("Add new collection")
                        .font(.getSemibold(16.0))
                        .foregroundStyle(ColorEnum.color_672CBC.getColor)
                        .padding(.leading, 1)
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(ImageEnum.icFilter.rawValue)
                })
            } // Add New Collection
            .padding(.top, 24)
            ScrollView {
                HStack (alignment: .top, spacing: 16) {
                    Image(ImageEnum.icFolder.rawValue)
                    VStack (alignment: .leading) {
                        Text("My Favourite")
                            .font(.getSemibold(16.0))
                            .foregroundStyle(ColorEnum.color_240F4F.getColor)
                        Text("8 items")
                            .font(.getSemibold(12.0))
                            .foregroundStyle(ColorEnum.color_8789A3.getColor)
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(ImageEnum.icOptions.rawValue)
                    })
                    .padding(.top, 10)
                }
            }
            .padding(.top, 32)
        }
        .padding(.horizontal, 25)
    }
}

#Preview {
    BookmarkView()
}
