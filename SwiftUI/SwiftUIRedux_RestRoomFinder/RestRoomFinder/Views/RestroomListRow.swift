//
//  RestroomListRow.swift
//  RestRoomFinder
//
//  Created by Yilong Chen on 09/06/2024.
//

import SwiftUI

struct RestroomListRow: View {
    let restroom: Restroom
    // Should have been injected, infact, should be in the viewModel?
    let logger = ConsoleLogger(category: "URL")
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(restroom.name ?? "Name not available")
                    .font(.headline)
                Spacer()
                Text(String(format: "%.2f miles", restroom.distance))
            }
            .padding(.top, 10)
            Text(restroom.addess)
                .font(.subheadline)
                .opacity(0.5)
            Button("Directions") {
                guard let targetURL = URL(string: "https://maps.apple.com/?address=\(restroom.addess.encodeURL() ?? "")") else {
                    logger.debug("https://maps.apple.com/?address=\(restroom.addess.encodeURL() ?? "")")
                    return
                }
                logger.debug(targetURL.absoluteString)
                if UIApplication.shared.canOpenURL(targetURL) {
                    UIApplication.shared.open(targetURL)
                } else {
                    logger.error("Could not open URL")
                }
            }
            .font(.caption)
            .foregroundColor(.white)
            .padding(6)
            .background(Color(#colorLiteral(red: 0.184266597, green: 0.8003296256, blue: 0.4435204864, alpha: 1)))
            .cornerRadius(6)
            
            Text(restroom.comment ?? "")
                           .font(.footnote)
            
            HStack {
                Text(restroom.accessible ? "♿️" : "")
            }
        }
    }
}

struct RestroomListRow_Previews: PreviewProvider {
    static var previews: some View {
        RestroomListRow(
            restroom: .example
        )
    }
}
