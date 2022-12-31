//
//  ProgressSpinnerView.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/14/22.
//

import SwiftUI

struct ProgressSpinnerView: View {
    var title: String

    var body: some View {
        ZStack {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
            ProgressView(title)
                .foregroundColor(Color.black)
                .tint(Color.orange)
                .background(Color.clear)
                .font(.headline)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct ProgressSpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSpinnerView(title: "Welcome")
    }
}
