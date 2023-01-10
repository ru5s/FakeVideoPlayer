//
//  ListOfVideoCell.swift
//  FakeVideoPlayer
//
//  Created by Ruslan Ismailov on 04/01/23.
//

import UIKit

class ListOfVideoCell: UITableViewCell {
    
    let imageOfVideo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black
        
        return image
    }()
    
    let roundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemGray4
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        
        return image
    }()
    
    let labelTitleWhite: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        
        return label
    }()
    
    let labelNameLightGray: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.heightAnchor.constraint(equalToConstant: 290).isActive = true
        
        contentView.backgroundColor = .black
        contentView.addSubview(imageOfVideo)
        imageOfVideo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        imageOfVideo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        imageOfVideo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        imageOfVideo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70).isActive = true

        
        contentView.addSubview(roundImage)
        roundImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        roundImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        roundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        roundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        
        contentView.addSubview(labelTitleWhite)
        labelTitleWhite.leftAnchor.constraint(equalTo: roundImage.rightAnchor, constant: 20).isActive = true
        labelTitleWhite.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        labelTitleWhite.topAnchor.constraint(equalTo: roundImage.topAnchor, constant: 5).isActive = true
        
        contentView.addSubview(labelNameLightGray)
        labelNameLightGray.leftAnchor.constraint(equalTo: roundImage.rightAnchor, constant: 20).isActive = true
        labelNameLightGray.bottomAnchor.constraint(equalTo: roundImage.bottomAnchor, constant: -5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
