//
//  AlbumModel.swift
//  mono
//
//  Created by Cameron Zollinger on 1/18/25.
//

import Foundation
import SwiftData

@Model
final class AlbumModel {
    var id: String
    var title: String
    var artistName: String
    var artistURL: URL?
    var artwork: URL?
    var genreNames: [String]
    var releaseDate: Date
    var lastPlayedDate: Date?
    
    init(id: String, title: String, artistName: String, artistURL: URL? = nil, artwork: URL? = nil, genreNames: [String], releaseDate: Date, lastPlayedDate: Date? = nil) {
        self.id = id
        self.title = title
        self.artistName = artistName
        self.artistURL = artistURL
        self.artwork = artwork
        self.genreNames = genreNames
        self.releaseDate = releaseDate
        self.lastPlayedDate = lastPlayedDate
    }
}
