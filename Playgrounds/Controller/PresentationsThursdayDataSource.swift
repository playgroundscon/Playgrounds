//
//  ThursdayScheduleViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

final class PresentationsThursdayDataSource: NSObject {

    var day: ScheduleDay = ScheduleDay(sessions: [])
}

extension PresentationsThursdayDataSource: UITableViewDataSource {
    
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
        cell.headingLabel.text = session.presentation.title
        cell.subheadingLabel.text = speaker.name
        cell.avatarImageView.image = UIImage(named: speaker.resource)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mma"
        let date = Date(timeIntervalSince1970: TimeInterval(day.sessions[section].time.rawValue))
        return dateFormatter.string(from: date)
    }
}

