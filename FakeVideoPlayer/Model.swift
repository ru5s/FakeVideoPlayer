//
//  Model.swift
//  FakeVideoPlayer
//
//  Created by Ruslan Ismailov on 04/01/23.
//

import Foundation

struct SingleVideo {
    let name: String
    let title: String
    let url: String
    let photo: String
    let roundPhoto: String
}

protocol ModelProtocol{
    func addPhoto(index: Int) -> String
    func addRoundPhoto(index: Int) -> String
    func addName(index: Int) -> String
    func addTitle(index: Int) -> String
    func addUrl(index: Int) -> String
    func returnCount() -> Int
}

class Model: ModelProtocol {
    
    
    let allVIdeo: [SingleVideo] = [
        .init(name: "Aladdin",
              title: "Aladdin",
              url: "https://ia802609.us.archive.org/23/items/Aladdin_315/Aladdin_512kb.mp4",
              photo: "v1",
              roundPhoto: "v1"),
        .init(name: "Avez Vous",
              title: "Avez Vous",
              url:"https://ia800604.us.archive.org/19/items/Avez-vousDjVu...LePlusPetitZooDuMonde/104_Le_Plus_Petit_Zoo_du_Monde.mp4",
              photo: "v2",
              roundPhoto: "v2"),
        .init(name: "The Kings Trumpet",
              title: "The Kings Trumpet",
              url: "https://ia800705.us.archive.org/28/items/TheSpiritOf43_56/The_Spirit_of__43_512kb.mp4",
              photo: "v3",
              roundPhoto: "v3"),
        .init(name: "Popeye",
              title: "Popeye the Sailor Meets Aladdin and His Wonderful Lamp",
              url:"https://ia800703.us.archive.org/30/items/Popeye_the_Sailor_Meets_Aladdin_and_His_Wonderful_Lamp/Popeye_-_Aladdin_and_His_Wonderful_Lamp_512kb.mp4",
              photo: "v4",
              roundPhoto: "v4"),
    ]
    
    func addPhoto(index: Int) -> String {
        return allVIdeo[index].photo
    }
    
    func addRoundPhoto(index: Int) -> String {
        return allVIdeo[index].roundPhoto
    }
    
    func addName(index: Int) -> String {
        return allVIdeo[index].name
    }
    
    func addTitle(index: Int) -> String {
        return allVIdeo[index].title
    }
    
    func addUrl(index: Int) -> String {
        return allVIdeo[index].url
    }
    
    func returnCount() -> Int {
        return allVIdeo.count
    }
    
}

