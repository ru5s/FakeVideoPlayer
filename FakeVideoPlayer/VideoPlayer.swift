//
//  VideoPlayer.swift
//  FakeVideoPlayer
//
//  Created by Ruslan Ismailov on 08/01/23.
//

import UIKit
import AVKit
import Foundation

class VideoPlayer: UIViewController {
    var url: URL?
    
    var player: AVPlayer!
    
    let spinner: UIActivityIndicatorView = {
        let sp = UIActivityIndicatorView()
        sp.translatesAutoresizingMaskIntoConstraints = false
        sp.style = .large
        sp.color = .white
        
        return sp
    }()
    
    let videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.5)

        return view
    }()
    
    let playAction: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Pause".uppercased(), for: .normal)
        btn.layer.cornerRadius = 35
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        return btn
    }()
    
    let slider = UISlider()
    
    let thred = DispatchQueue.global(qos: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(playAction)
        
        view.addSubview(videoView)
        
        videoView.addSubview(spinner)
        
        view.addSubview(slider)
        slider.showsMenuAsPrimaryAction = true
        slider.thumbTintColor = .red
        
        playAction.addTarget(self, action: #selector(playAction(sender:)), for: .touchUpInside)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        thred.async {
            guard let url = self.url else {return}
            self.player = AVPlayer(url: url)
            
            DispatchQueue.main.async {
                self.player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: nil) { time in
                    self.slider.value = Float(time.seconds)
                }
                self.slider.maximumValue = Float(self.player.currentItem?.asset.duration.seconds ?? 0)
                self.slider.addTarget(self, action: #selector(self.slide(sender:)), for: .valueChanged)
            }
            
        }
        
        
        
        
        
        playAction.widthAnchor.constraint(equalToConstant: 100).isActive = true
        playAction.heightAnchor.constraint(equalToConstant: 70).isActive = true
        playAction.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playAction.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        
        videoView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        videoView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        videoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        videoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        
        spinner.centerXAnchor.constraint(equalTo: videoView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: videoView.centerYAnchor).isActive = true
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: videoView.bottomAnchor, constant: 10).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        slider.centerXAnchor.constraint(equalTo: videoView.centerXAnchor).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
            addvideoToBottom()
    }
    
    @objc private func slide(sender: Any){
        player.seek(to: CMTime(seconds: Double(slider.value), preferredTimescale: 1000))
    }

    @objc private func playAction(sender: Any) {
        if player.timeControlStatus == .playing {
            player.pause()
            DispatchQueue.main.async {
                self.playAction.setTitle("Play".uppercased(), for: .normal)
            }
            
        }else{
            player.play()
            DispatchQueue.main.async {
                self.playAction.setTitle("Pause".uppercased(), for: .normal)
            }
            
        }
    }

    func addvideoToBottom() {
        videoView.backgroundColor = .black
        self.view.addSubview(videoView)
        videoView.layoutIfNeeded()
        let layer = AVPlayerLayer(player: player)
        layer.videoGravity = .resizeAspectFill
        layer.frame = videoView.bounds
        videoView.layer.addSublayer(layer)
        player.play()
    }
}

