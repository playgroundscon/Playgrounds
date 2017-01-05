//
//  FridayScheduleViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class PresentationsFridayDataSource: NSObject {
    
    let day = ScheduleDay(sessions: [])
}

extension PresentationsFridayDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return day.sessions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ScheduleSpeakerCell = tableView.dequeueReusableCell(for: indexPath)
        let session = day.sessions[indexPath.section]
        let speaker = session.speaker
        cell.headingLabel.text = "\(session.presentation.title)\n\(speaker.name)"
        cell.avatarImageView.backgroundColor = (indexPath.section % 2 == 0) ? .gray : .lightGray
        
        return cell
    }
}
