//
//  SpotifyWebAPI.swift
//  mono
//
//  Created by Cameron Zollinger on 3/30/25.
//

struct SpotifyWebAPI {
    var accessToken: String

    init() {
        if var token = Bundle.main.infoDictionary?["SPOTIFY_ACCESS_TOKEN"] as? String {
            accessToken = token
        }
    }

    private func request() {
    }
}
