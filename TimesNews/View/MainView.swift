//
//  MainView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES

    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @StateObject var request: NetworkRequest
    @StateObject var mainViewModel: MainViewModel

    // MARK: - BODY

    private func syncFuncForFetching() {
        do {
            try
                request.fetchData(RequestModel.self, url: request.urlFromString(endpoint: request.endPoint + "fdsvsd"), completion: { result in
                    switch result {
                    case .success(let requestModel): request.requestModel = requestModel
                    case .failure(let error): mainViewModel.errorDescription = error.localizedDescription
                    }
                })
        } catch {
            mainViewModel.isShowingAlert = true
        }
    }

    private func asyncFuncForFetching() {
        Task {
            do {
                request.requestModel = try await request.fetchData(url: request.urlFromString(endpoint: request.endPoint))
            } catch {
                mainViewModel.isShowingAlert = true
                mainViewModel.errorDescription = error.localizedDescription
            }
        }
    }

    var body: some View {
        NavigationView {
            Group {
                if request.isLoading {
                    ProgressView()
                        .controlSize(.large)
                        .progressViewStyle(CircularProgressViewStyle())
                        .gradientForeground(colors: [.blue, .purple])
                } else {
                    if !mainViewModel.isGridViewActive {
                        List {
                            ForEach(mainViewModel.searchedArticles(articles: request.requestModel.articles)) { article in
                                NavigationLink {
                                    DetailView(article: article)
                                } label: {
                                    ArticleRowView(article: article)
                                } //: LINK
                                .listRowSeparator(.hidden)
                            } //: LOOP
                            CreditsView()
                                .modifier(CenterModifier())
                                .listRowSeparator(.hidden)
                                .gradientForeground(colors: [.blue, .purple])
                        } //: LIST
                        .listStyle(.plain)
                        .navigationTitle("Articles")
                        .navigationBarTitleDisplayMode(.large)
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: mainViewModel.gridLayout, alignment: .center, spacing: 10) {
                                ForEach(request.requestModel.articles) { article in
                                    NavigationLink {
                                        DetailView(article: article)
                                    } label: {
                                        ArticleGridItemView(article: article)
                                    } //: LINK
                                } //: LOOP
                            } //: GRID
                            .padding(12)
                            .animation(.easeInOut(duration: 0.5), value: mainViewModel.isGridLayoutChanged)
                        } //: SCROLL
                    } //: CONDITION
                }
            } //: GROUP
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // DARK MODE
                    Button {
                        print("Dark Mode is activated")
                        isDarkMode.toggle()
                        mainViewModel.haptics.impactOccurred()
                        mainViewModel.playSound()
                    } label: {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.circle")
                            .font(.title2)
                            .gradientForeground(colors: [.blue, .purple])
                    } //: LIST BUTTON
                } //: DARK MODE TOOLBARITEM
                ToolbarItem(placement: .navigationBarTrailing) {
                    // LIST
                    Button {
                        print("List view is activated")
                        mainViewModel.isGridViewActive = false
                        mainViewModel.haptics.impactOccurred()
                        mainViewModel.playSound()
                    } label: {
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .gradientForeground(colors: mainViewModel.isGridViewActive ? [.gray] : [.blue, .purple])
                    } //: LIST BUTTON
                } //: LIST TOOLBARITEM
                ToolbarItem(placement: .navigationBarTrailing) {
                    // GRID
                    Button {
                        print("Grid view is activated")
                        mainViewModel.isGridViewActive = true
                        mainViewModel.haptics.impactOccurred()
                        mainViewModel.gridSwitch()
                        mainViewModel.playSound()
                    } label: {
                        Image(systemName: mainViewModel.toolBarIcon)
                            .font(.title2)
                            .gradientForeground(colors: mainViewModel.isGridViewActive ? [.blue, .purple] : [.gray])
                    } //: GRID BUTTON
                } //: GRID TOOLBARITEM
            } //: TOOLBAR
        } //: NAVIGATION
        .searchable(text: $mainViewModel.searchText)
        .accentColor(.purple)
        .onAppear {
            // USING SYNC FUNCTION WITH COMPLETION HANDLER
//            syncFuncForFetching()

            // USING ASYNC FUNCTION
            asyncFuncForFetching()
        }
        .alert(isPresented: $mainViewModel.isShowingAlert) {
            Alert(title: Text("Error"), message: Text(mainViewModel.errorDescription), dismissButton: .default(Text("Ok")))
        }
    }
}

// MARK: - PREVIEW

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(request: NetworkRequest(), mainViewModel: MainViewModel())
    }
}
