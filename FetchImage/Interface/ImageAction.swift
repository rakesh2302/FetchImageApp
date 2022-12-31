//
//  ImageAction.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/16/22.
//

import Combine

protocol ImageAction {

    // MARK: Interface

    func getImages() -> AnyPublisher<[ImageInfo], Error>
}
