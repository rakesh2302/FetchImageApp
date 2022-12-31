//
//  ImageActionImplementation.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/16/22.
//

import Combine

class ImageActionImplementation: ImageAction {

    // MARK: Functions

    func getImages() -> AnyPublisher<[ImageInfo], Error> {
        return BaseAPI.getImages()
            .eraseToAnyPublisher()
    }
}
