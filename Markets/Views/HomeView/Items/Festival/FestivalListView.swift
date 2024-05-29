//
//  FestivalListView.swift
//  Markets
//
//  Created by Andy on 5/20/24.
//

import SwiftUI

struct FestivalListView: View {
    @ObservedObject var festivalData = FestivalInfo()
    var titleOfFestivalType: String

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 10) {
                ScrollView {
                    ForEach(Array(festivalData.festivalName.enumerated()), id: \.offset) { index, festivalName in
                        if festivalData.festivalType[index] == titleOfFestivalType {
                            NavigationLink(destination: FestivalDetailView(festivalName: festivalData.festivalName[index],
                                                                           festivalHow: festivalData.festivalHow[index],
                                                                           festivalWhen: festivalData.festivalWhen[index],
                                                                           festivalWhere: festivalData.festivalWhere[index],
                                                                           festivalType: festivalData.festivalType[index],
                                                                           festivalPhoneNumber: festivalData.festivalPhoneNumber[index])) {
                                FestivalItemView(festivalName: festivalData.festivalName[index],
                                                 festivalWhen: festivalData.festivalWhen[index])
                                .padding()
                                .hoverEffect()
                            }
                        }
                    }
                }
            }
            .navigationTitle(titleOfFestivalType)
        }
    }
}

#Preview {
    FestivalListView(titleOfFestivalType: "문화예술")
}
