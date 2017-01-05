//
//  SecondViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class SpeakerViewController: UIViewController {

    // MARK: - Properties
    
    var speakers: [Speaker] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView! { didSet {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SpeakerCell.self)
        }
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Speakers"
        
        automaticallyAdjustsScrollViewInsets = false
        speakers = SpeakerStore.speakers
        tableView.reloadData()
    }
}


extension SpeakerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return speakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SpeakerCell = tableView.dequeueReusableCell(for: indexPath)
        let speaker = speakers[indexPath.row]
        cell.headingLabel.text = speaker.name
        cell.subheadingLabel.text = speaker.work
        cell.avatarImageView.cornerRadius = 48/2
        let resource = speaker.name.replacingOccurrences(of: " ", with: "")
        cell.avatarImageView.image = UIImage(named: resource)
        return cell
    }
}

extension SpeakerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SpeakerCell.defaultHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(.speaker, sender: self)
    }
}

extension SpeakerViewController: SegueHandler {
    enum Segue: String {
        case speaker
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let indexPath = tableView.indexPathForSelectedRow,
            case .speaker = segueIdentifier(for: segue),
            let viewController = segue.destination as? SpeakerDetailViewController
            else { return }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        viewController.speaker = speakers[indexPath.row]
    }
}
