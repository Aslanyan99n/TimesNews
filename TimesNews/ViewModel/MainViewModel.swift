//
//  MainViewModel.swift
//  TimesNews
//
//  Created by Narek on 30.08.23.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    // MARK: - PROPERTIES

    @Published var searchText = ""
    @Published var isGridViewActive: Bool = false
    @Published var gridLayout: [GridItem] = [GridItem(.flexible())]
    @Published var gridColumn: Int = 1
    @Published var isGridLayoutChanged: Bool = false
    @Published var toolBarIcon: String = "square.grid.2x2"
    @Published var isShowingAlert: Bool = false
    @Published var errorDescription: String = ""

    let haptics = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - FUNCTIONS

    func searchedArticles(articles: [Article]) -> [Article] {
        if searchText.isEmpty {
            return articles
        } else {
            return articles.filter { article in
                let title = article.title
                return title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        isGridLayoutChanged.toggle()

        switch gridColumn {
        case 1: toolBarIcon = "square.grid.2x2"
        case 2: toolBarIcon = "square.grid.3x2"
        case 3: toolBarIcon = "rectangle.grid.1x2"
        default: toolBarIcon = "square.grid.2x2"
        }
    }

    func playSound() {
        do {
            try SoundPlayer.shared.playSound(sound: "sound-rise", type: "mp3")
        } catch {
            isShowingAlert = true
            errorDescription = error.localizedDescription
        }
    }
}
