//
//  PresentationDetailViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

fileprivate extension PresentationDetailViewController {
    
    enum Section: Int {
        case presentation, speaker, links
        static let count = 3
    }
}

final class PresentationDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var session: ScheduleSession!

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(DetailPresentationCell.self)
        tableView.register(DetailAvatarCell.self)
        tableView.register(DetailLinksCell.self)
        }
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = session.presentation.title
        automaticallyAdjustsScrollViewInsets = false
    }
}


extension PresentationDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        
        switch section {
        case .presentation, .speaker:
            return 1
        case .links:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .presentation:
            let cell: DetailPresentationCell = tableView.dequeueReusableCell(for: indexPath)
            let presentation = session.presentation
            cell.headingLabel.text = presentation.title
            cell.bodyLabel.text = presentation.blurb
            
            return cell
        case .speaker:
            let cell: DetailAvatarCell = tableView.dequeueReusableCell(for: indexPath)
            let speaker = session.speaker
            cell.headingLabel.text = speaker.name
            cell.subheadingLabel.text = "\(speaker.work), \(speaker.location.rawValue)"
            cell.avatarImageView.image = UIImage(named: speaker.resource)
            
            return cell
        case .links:
            let cell: DetailLinksCell = tableView.dequeueReusableCell(for: indexPath)
            let speaker = session.speaker
            cell.headingLabel.text = {
                switch indexPath.row {
                case 0:
                    return "Read about \(speaker.name)"
                case 1:
                    return "@andyyhope"
                case 2:
                    return "andyyhope.com"
                default:
                    return nil
                }
            }()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = Section(rawValue: section) else { return nil }
        
        switch section {
        case .presentation, .links:
            return nil
        case .speaker:
            return "Presented by"
        }
    }
}

extension PresentationDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else { return .min }
        
        switch section {
        case .presentation, .links:
            return .min
        case .speaker:
            return 30.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let section = Section(rawValue: section) else { return .min }
        
        switch section {
        case .presentation, .links:
            return 20.0
            
        case .speaker:
            return .min
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.section) else { return 0.0 }
        switch section {
        case .presentation:
            return UITableViewAutomaticDimension
        case .links:
            return DetailLinksCell.defaultHeight
        case .speaker:
            return DetailAvatarCell.defaultHeight
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = Section(rawValue: indexPath.section) else { return 0.0 }
        switch section {
        case .presentation:
            return DetailAvatarCell.defaultHeight
        case .speaker:
            return 100.0
        case .links:
            return DetailLinksCell.defaultHeight
        }
    }
}
