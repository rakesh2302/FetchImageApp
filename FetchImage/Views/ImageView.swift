//
//  ImageView.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/14/22.
//

import SwiftUI
import CoreData

import Combine

struct ImageView: View {
    @ObservedObject var viewModel: FetchImageViewModel
    
    @State var scaleImage: Bool = false
    @State var isHorizontalList: Bool = false
    var cancellable: AnyCancellable?
    @State var selectedImage: Image?
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressSpinnerView(title: "Welcome")
                .onAppear {
                    viewModel.getImages()
                }
        case .loading:
            ProgressSpinnerView(title: "Loading Images")
        case let .loaded(imageInfos):
            NavigationView {
                ZStack {
                    Color("PrimaryColor").edgesIgnoringSafeArea([.all])
                    ScrollView(isHorizontalList ? .horizontal : .vertical, showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
//                        StackContentView(state: isHorizontalList) {
                            ForEach(imageInfos) { imageInfo in
                                AsyncImage(url: URL(string: imageInfo.urls.regular)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressSpinnerView(title: "Loading Images")
                                    case .success(let image):
                                        if scaleImage {
                                            let _ = print("")
                                        } else {
                                            let _ = print("")
                                        }
                                        image
                                            .resizable()
                                            .scaleEffect(1, anchor: .center)
                                            .aspectRatio(1, contentMode: .fill)
                                    case .failure:
                                        Image(systemName: "photo")
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
//                                .frame(minWidth: 150, maxWidth: .infinity, minHeight: 150, maxHeight: .infinity)
                                .frame(width: 300, height: 500)
                                .cornerRadius(20)
                            }
                            .padding()
                            .navigationTitle("Unsplash Images")
                        }
                    }
                    .toolbar {
                        Button("Layout") {
                            isHorizontalList.toggle()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("PrimaryColor"))
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        case let .failed(error):
            ErrorView(errorMessage: error.localizedDescription)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FetchImageViewModel(imageAction: ImageActionImplementation())
        viewModel.state = .loaded([
            ImageInfo(urls: Urls(regular: "https://images.unsplash.com/photo-1668570000683-aa421ea758a2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA2ODl8MHwxfGFsbHwyOHx8fHx8fHx8MTY2ODY1NDk1MQ&ixlib=rb-4.0.3&q=80&w=1080")),
            ImageInfo(urls: Urls(regular: "https://images.unsplash.com/photo-1668556102531-2521a0de30e4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODA2ODl8MHwxfGFsbHwyOXx8fHx8fHx8MTY2ODY1NDk1MQ&ixlib=rb-4.0.3&q=80&w=1080"))])
        return ImageView(viewModel: viewModel)
    }
}
