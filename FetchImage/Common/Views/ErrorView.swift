//
//  ErrorView.swift
//  FetchImage
//
//  Created by Rakesh Shetty on 11/16/22.
//

import SwiftUI

// MARK: Struct

/// This struct represent Error view
///
///  It has Error text
struct ErrorView: View {

    // MARK: Public Properties

    var errorMessage: String

    /// A view that displays Error Text
    var body: some View {
        Text(errorMessage)
            .multilineTextAlignment(.center)
            .padding()
    }
}

// MARK: Struct

/// This is to preview Error data without running project
///
///  This will show hardcode school data
struct ErrorView_Previews: PreviewProvider {

    // MARK: Static Properties

    static var previews: some View {
        ErrorView(errorMessage: "Error Found")
    }
}
