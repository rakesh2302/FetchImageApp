//
//  ImageFullScreenView.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/18/22.
//

import SwiftUI

struct ImageFullScreenView: View {
    var image: Image
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.primary.edgesIgnoringSafeArea(.all)
            image
                .resizable()
                .scaleEffect(1, anchor: .center)
                .aspectRatio(1, contentMode: .fill)
                .transition(.scale.animation(.easeIn))
                .animation(.spring(response: 0.5, dampingFraction: 0.4),
                           value: false)
                .onTapGesture {
                    withAnimation(.spring()) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        }
    }
}

struct ImageFullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFullScreenView(image: Image("Travel"))
    }
}
