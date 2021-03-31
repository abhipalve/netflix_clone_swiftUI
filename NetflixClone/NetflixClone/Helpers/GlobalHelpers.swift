//
//  GlobalHelpers.swift
//  NetflixClone
//
//  Created by Abhijeet  on 22/01/21.
//

import Foundation
import SwiftUI

let videoURL1 = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")
let videoURL2 = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")
let videoURL3 = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")
let videoURL4 = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4")

let imageURL1 = URL(string: "https://picsum.photos/200/309")
let imageURL2 = URL(string: "https://picsum.photos/200/308")
let imageURL3 = URL(string: "https://picsum.photos/200/312")
let imageURL4 = URL(string: "https://picsum.photos/200/323")

let exampleTrailer1 = Trailer(name: "New Trailer", videoURL: videoURL1!, thumbnailURL: imageURL1!)
let exampleTrailer2 = Trailer(name: "The Hero", videoURL: videoURL1!, thumbnailURL: imageURL2!)
let exampleTrailer3 = Trailer(name: "Mysterious Path", videoURL: videoURL1!, thumbnailURL: imageURL3!)
let exampleTrailer4 = Trailer(name: "Go goa gone", videoURL: videoURL1!, thumbnailURL: imageURL3!)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]


let episode1 = Episode(name: "Larry out", season: 1, thumbnailURLString: "https://picsum.photos/300/101", description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", lenght: 55, videoURL: videoURL1!, episodeNumber: 1)
let episode2 = Episode(name: "Killed by laugh", season: 1, thumbnailURLString: "https://picsum.photos/300/102", description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", lenght: 51, videoURL: videoURL2!, episodeNumber: 2)
let episode3 = Episode(name: "Maze loud", season: 1, thumbnailURLString: "https://picsum.photos/300/103", description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", lenght: 52, videoURL: videoURL3!, episodeNumber: 3)
let episode4 = Episode(name: "Brain mag", season: 2, thumbnailURLString: "https://picsum.photos/300/106", description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", lenght: 52, videoURL: videoURL3!, episodeNumber: 3)
let episode5 = Episode(name: "Vicious loud", season: 2, thumbnailURLString: "https://picsum.photos/300/105", description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", lenght: 52, videoURL: videoURL3!, episodeNumber: 3)
let episode6 = Episode(name: "Maze Trick", season: 2, thumbnailURLString: "https://picsum.photos/300/104", description: "A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family's future.", lenght: 52, videoURL: videoURL3!, episodeNumber: 3)

let episodes = [episode1,episode2,episode3, episode4, episode5, episode6]

let exampleMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 2, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", accentColor: .red, defaultEpisodeInfo: exampleEpisodeInfo, episodes: episodes, moreLikeThisMovies: moreLikeMovies, trailers: exampleTrailers, previewImageName: "arrestedDevPreview", previewVideoURL: videoURL1)
let exampleMovie2 = Movie(id: UUID().uuidString, name: "Misson Impossible", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 2, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", accentColor: .blue, defaultEpisodeInfo: exampleEpisodeInfo, promotionalHeadLine: "Top rated TV show", moreLikeThisMovies: moreLikeMovies, trailers: exampleTrailers, previewImageName: "darkPreview", previewVideoURL: videoURL2)
let exampleMovie3 = Movie(id: UUID().uuidString, name: "High speed", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 3, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", accentColor: .pink, defaultEpisodeInfo: exampleEpisodeInfo, moreLikeThisMovies: moreLikeMovies, trailers: exampleTrailers, previewImageName: "dirtyJohnPreview", previewVideoURL: videoURL3)
let exampleMovie4 = Movie(id: UUID().uuidString, name: "Dragon Warrior", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 4, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", accentColor: .red, defaultEpisodeInfo: exampleEpisodeInfo, episodes: episodes, promotionalHeadLine: "Season 5 coming soon", moreLikeThisMovies: moreLikeMovies, trailers: exampleTrailers, previewImageName: "ozarkPreview", previewVideoURL: videoURL4)
let exampleMovie5 = Movie(id: UUID().uuidString, name: "Kung fu Panda", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 5, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Ralij Likhu", accentColor: .yellow, defaultEpisodeInfo: exampleEpisodeInfo, moreLikeThisMovies: moreLikeMovies, trailers: exampleTrailers, previewImageName: "travelersPreview", previewVideoURL: videoURL1)
let exampleMovie6 = Movie(id: UUID().uuidString, name: "Boss Baby", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 5, cast: "Ragnar Lothbrok, Bjorn, Ivor the boneless", creators: "Michel Donehill, Alex fleming, Ralij Likhu", accentColor: .green, defaultEpisodeInfo: exampleEpisodeInfo, promotionalHeadLine: "Watch Season 6 Now", moreLikeThisMovies: moreLikeMovies, trailers: exampleTrailers, previewImageName: "whiteLinesPreview", previewVideoURL: videoURL2)

var exampleMovies: [Movie] {[exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]}

let exampleEpisodeInfo = CurrentEpisodeInfo(episodeName: "Wild Northman", description: "The stage is set for the first journey west by Ragnar Lothbrok as he gathers a crew willing to risk their lives to travel into the unknown. Earl Haraldson’s paranoia reaches new heights as it becomes apparent that trust is hard to come by in this dark era.", season: 2, episode: 1)

let morelikeMovie1 = Movie(id: UUID().uuidString, name: "DARK", thumbnailURL: URL(string: "https://picsum.photos/200/300")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 1, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", defaultEpisodeInfo: exampleEpisodeInfo, moreLikeThisMovies: [], trailers: [], previewImageName: "arrestedDevPreview", previewVideoURL: videoURL1)
let morelikeMovie2 = Movie(id: UUID().uuidString, name: "Misson Impossible", thumbnailURL: URL(string: "https://picsum.photos/200/300/")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 2, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", defaultEpisodeInfo: exampleEpisodeInfo, promotionalHeadLine: "Top rated TV show", moreLikeThisMovies: [], trailers: [], previewImageName: "darkPreview", previewVideoURL: videoURL2)
let morelikeMovie3 = Movie(id: UUID().uuidString, name: "High speed", thumbnailURL: URL(string: "https://picsum.photos/200/301")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 3, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", defaultEpisodeInfo: exampleEpisodeInfo, moreLikeThisMovies: [], trailers: [], previewImageName: "dirtyJohnPreview", previewVideoURL: videoURL3)
let morelikeMovie4 = Movie(id: UUID().uuidString, name: "Dragon Warrior", thumbnailURL: URL(string: "https://picsum.photos/200/302")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 4, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Pond Matt", defaultEpisodeInfo: exampleEpisodeInfo, promotionalHeadLine: "Season 5 coming soon", moreLikeThisMovies: [], trailers: [], previewImageName: "ozarkPreview", previewVideoURL: videoURL4)
let morelikeMovie5 = Movie(id: UUID().uuidString, name: "Kung fu Panda", thumbnailURL: URL(string: "https://picsum.photos/200/303")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 5, cast: "Ami Lothbrok, Bjorn, Ivor the Tpa", creators: "Michel Donehill, Alex fleming, Ralij Likhu", defaultEpisodeInfo: exampleEpisodeInfo, moreLikeThisMovies: [], trailers: [], previewImageName: "travelersPreview", previewVideoURL: videoURL1)
let morelikeMovie6 = Movie(id: UUID().uuidString, name: "Boss Baby", thumbnailURL: URL(string: "https://picsum.photos/200/304")!, genre: ["Sci-Fi", "Exciting", "Suspensful", "Mind bending"], year: 2020, rating: "UN MA", numberOfSeasons: 5, cast: "Ragnar Lothbrok, Bjorn, Ivor the boneless", creators: "Michel Donehill, Alex fleming, Ralij Likhu", defaultEpisodeInfo: exampleEpisodeInfo, promotionalHeadLine: "Watch Season 6 Now", moreLikeThisMovies: [], trailers: [], previewImageName: "whiteLinesPreview", previewVideoURL: videoURL2)

var moreLikeMovies: [Movie] {[morelikeMovie1, morelikeMovie2, morelikeMovie3, morelikeMovie4, morelikeMovie5, morelikeMovie6]}

extension LinearGradient{
    
    static var blackLinerGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]), startPoint: .top, endPoint: .bottom)
}

extension String{
    
    func widthOfString(using font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font : font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

extension View{
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    /// ```
    /// Text("Label")
    ///     .isHidden(true)
    /// ```
    ///
    /// Example for complete removal:
    /// ```
    /// Text("Label")
    ///     .isHidden(true, remove: true)
    /// ```
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
