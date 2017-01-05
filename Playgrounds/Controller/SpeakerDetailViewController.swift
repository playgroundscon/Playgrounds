//
//  SpeakerDetailViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

fileprivate extension SpeakerDetailViewController {
    enum Section: Int {
        case avatar
        case bio
        case contact
        static let count = 3
    }
}

final class SpeakerDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var speaker: Speaker!
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(DetailTextCell.self)
        tableView.register(DetailAvatarCell.self)
        tableView.register(DetailLinksCell.self)
        }
    }
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Speaker"
        automaticallyAdjustsScrollViewInsets = false
    }
}

extension SpeakerDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = section
        guard let section = Section(rawValue: index) else { return 0 }
        
        switch section {
        case .avatar:
            return 1
        case .bio:
            return 1
        case .contact:
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let index = section
        guard let section = Section(rawValue: index) else { return nil }
        switch section {
        case .avatar, .bio:
            return nil
        case .contact:
            return "Links"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .avatar:
            let cell: DetailAvatarCell = tableView.dequeueReusableCell(for: indexPath)
            cell.headingLabel.text = speaker.name
            cell.subheadingLabel.text = "\(speaker.work), \(speaker.location.rawValue)"
            let resource = speaker.name.replacingOccurrences(of: " ", with: "")
            cell.avatarImageView.image = UIImage(named: resource)
            
            return cell
        case .bio:
            let cell: DetailTextCell = tableView.dequeueReusableCell(for: indexPath)
            cell.descriptionTextLabel.text = speaker.bio
            
            return cell
        case .contact:
            let cell: DetailLinksCell = tableView.dequeueReusableCell(for: indexPath)
            cell.headingLabel.text = "@AndyyHope"
            
            return cell
        }
    }
}

extension SpeakerDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let index = section
        guard let section = Section(rawValue: index) else { return .min }
        
        switch section {
        case .avatar, .bio:
            return .min
        case .contact:
            return 30.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.section) else { return 0 }
        switch section {
        case .avatar:
            return DetailAvatarCell.defaultHeight
        case .bio:
            return UITableViewAutomaticDimension
        case .contact:
            return DetailLinksCell.defaultHeight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let index = section
        guard let section = Section(rawValue: index) else { return .min }
        
        switch section {
        case .avatar:
            return .min
        case .bio, .contact:
            return 10.0
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.section) else { return 0 }
        switch section {
        case .avatar:
            return DetailAvatarCell.defaultHeight
        case .bio:
            return 30.0
        case .contact:
            return DetailLinksCell.defaultHeight
        }
    }
}
