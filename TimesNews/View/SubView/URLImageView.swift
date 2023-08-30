//
//  URLImageView.swift
//  TimesNews
//
//  Created by Narek on 29.08.23.
//

import SwiftUI

struct URLImageView: View {
    // MARK: - PROPERTIES

    let urlString: String
    @State var data: Data?

    // MARK: - BODY

    var body: some View {
        if let data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .background(Color.gray)
        } else {
            Image(systemName: "photo")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(.gray)
                .onAppear {
                    fetchData()
                }
        }
    }

    private func fetchData() {
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}

// MARK: - PREVIEW

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(urlString: "")
    }
}
