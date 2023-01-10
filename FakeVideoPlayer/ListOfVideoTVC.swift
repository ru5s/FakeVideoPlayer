//
//  ListOfVideoTVC.swift
//  FakeVideoPlayer
//
//  Created by Ruslan Ismailov on 04/01/23.
//

import UIKit
import AVKit

class ListOfVideoTVC: UITableViewController {
    let model: ModelProtocol = Model()
    
    var player: AVPlayer!
    let videoPlayer = VideoPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(ListOfVideoCell.self, forCellReuseIdentifier: "reuseIdentifier")

        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        
        tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.returnCount()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ListOfVideoCell
        cell.imageOfVideo.image = UIImage(named: (model.addPhoto(index: indexPath.row)))
        cell.roundImage.image = UIImage(named: model.addRoundPhoto(index: indexPath.row))
        cell.labelTitleWhite.text = model.addTitle(index: indexPath.row)
        cell.labelNameLightGray.text = model.addName(index: indexPath.row)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        videoPlayer.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: nil, action: #selector(backBtn))
        
        videoPlayer.player = AVPlayer(url: URL(string: model.addUrl(index: indexPath.row))!)
        
        let nav = UINavigationController(rootViewController: videoPlayer)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .coverVertical

        present(nav, animated: true)
    }
    
    
    @objc private func backBtn(){
        dismiss(animated: true)
        videoPlayer.player.pause()
        videoPlayer.removeFromParent()
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
