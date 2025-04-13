//
//  LibraryView.swift
//  mono
//
//  Created by Cameron Zollinger on 3/22/25.
//

import SwiftData
import SwiftUI

struct LibraryView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) private var colorScheme

    @State private var isSelectActive: Bool = false
    @State private var isSearchActive: Bool = false
    @State private var selectedItems = Set<String>()
    @State private var searchText = ""
    @State private var sortBy: SortOption = .title
    @State private var groupBy: GroupOption = .none
    @State private var filterBy: FilterOption = .none

    @Query private var albums: [AlbumModel]

    private let columns = [
        GridItem(.adaptive(minimum: 160), spacing: 16)
    ]

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .font: UIFont(name: "Menlo-Bold", size: 24)!
        ]

        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont(name: "Menlo", size: 14)!
        ]
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(albums) { album in
                        NavigationLink {
                            Text(
                                "Item at \(album.releaseDate, format: Date.FormatStyle(date: .numeric, time: .standard))"
                            )
                        } label: {
                            AlbumGridItem(
                                album: album,
                                isSelected: selectedItems.contains(album.id)
                            )
                            .onTapGesture {
                                if isSelectActive {
                                    if selectedItems.contains(album.id) {
                                        selectedItems.remove(album.id)
                                    } else {
                                        selectedItems.insert(album.id)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .background(Colors(colorScheme: colorScheme).grey100)
            .navigationTitle("Library")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    LibraryActionMenu(
                        isSelectActive: isSelectActive, sortBy: sortBy,
                        groupBy: groupBy, filterBy: filterBy)
                }

                if isSelectActive && !selectedItems.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: deleteSelectedAlbums) {
                            Label("Delete Selected", systemImage: "trash")
                        }
                        .foregroundColor(.red)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search")

    }

    private func addAlbum() {
        withAnimation {
            let newAlbum = AlbumModel(
                id: "1",
                title: "thank u, next",
                artistName: "Ariana Grande",
                genreNames: ["#pop", "#r&b"],
                releaseDate: Date()
            )
            modelContext.insert(newAlbum)
        }
    }

    private func deleteSelectedAlbums() {
        withAnimation {
            for albumID in selectedItems {
                if let album = albums.first(where: { $0.id == albumID }) {
                    modelContext.delete(album)
                }
            }
            selectedItems.removeAll()
            isSelectActive = false
        }
    }

    private func deleteAlbums(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(albums[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: AlbumModel.self)
}
