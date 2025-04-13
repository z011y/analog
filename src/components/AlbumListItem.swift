//
//  AlbumListItem.swift
//  mono
//
//  Created by Cameron Zollinger on 3/24/25.
//

import SwiftUI

struct AlbumGridItem: View {
    let album: AlbumModel
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                // Album cover placeholder
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .aspectRatio(1, contentMode: .fit)
                    .cornerRadius(8)
                    .overlay(
                        Text(album.title.prefix(1))
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                    )
                
                // Selection indicator
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.blue)
                        .background(Circle().fill(Color.white))
                        .padding(8)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(album.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(album.artistName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                Text(album.releaseDate, format: .dateTime.year())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
        )
    }
}
