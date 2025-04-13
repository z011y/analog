//
//  LibraryActionMenu.swift
//  mono
//
//  Created by Cameron Zollinger on 3/29/25.
//

import SwiftUI

enum SortOption: Hashable {
    case title
    case artist
}

enum GroupOption: Hashable {
    case none
    case artist
    case genre
}

enum FilterOption: Hashable {
    case none
    case genre
}

struct LibraryActionMenu: View {
    @State var isSelectActive: Bool = false
    @State var sortBy: SortOption = .title
    @State var groupBy: GroupOption = .none
    @State var filterBy: FilterOption = .none

    var body: some View {
        Menu {
            Button("Select", action: { isSelectActive = true })
            Menu("Sort by") {
                Button(
                    "Title", action: { sortBy = .title })
                Button(
                    "Artist", action: { sortBy = .artist }
                )
            }
            Menu("Group by") {
                Button(
                    "None", action: { groupBy = .none })
                Button(
                    "Artist",
                    action: { groupBy = .artist })
                Button(
                    "Genre", action: { groupBy = .genre }
                )
            }
            Menu("Filter by") {
                Button(
                    "None", action: { filterBy = .none }
                )
                Button(
                    "Genre",
                    action: { filterBy = .genre })
            }
        } label: {
            Label("Actions", systemImage: "ellipsis")
                .labelStyle(.iconOnly)
                .padding(.all, 4)
        }
        .menuStyle(.button)
        .buttonStyle(.bordered)
        .buttonBorderShape(.circle)
    }
}
