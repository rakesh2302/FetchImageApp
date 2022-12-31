//
//  FetchImageViewModel.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/14/22.
//

import Foundation
import Combine
import UIKit

final class FetchImageViewModel: ObservableObject {

    @Published var imageInfos = [ImageInfo]()
    var cancellable = Set<AnyCancellable>()
    @Published var state: ImageState = .idle
    private var imageAction: ImageAction
    
    init(imageAction: ImageAction) {
        self.imageAction = imageAction
    }

    func getImages() {
        state = .loading
        imageAction.getImages()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                guard case let .failure(error) = completion else {
                    return
                }
                print(error)
                self.state = .failed(error)
            } receiveValue: { [unowned self] in
                self.imageInfos = $0
                self.state = .loaded(self.imageInfos)
            }
            .store(in: &cancellable)
    }
    
    func setLoadedState() {
        self.state = .loaded([ImageInfo(urls: Urls(regular: ""))])
    }
    
}


enum ImageState {
    case idle
    case loading
    case failed(Error)
    case loaded([ImageInfo])
}


enum TestImageState {
    case idle
    case loading
    case failed(Error)
    case loaded(UIImage)
}
