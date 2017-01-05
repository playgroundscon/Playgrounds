//
//  FirstViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 18/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

fileprivate extension Selector {
    static let daySegmentedControlValueChanged = #selector(ScheduleViewController.daySegmentedControlValueChanged(_:))
}

protocol ScheduleViewControllerDelegate: class {
    func switchDataSource(for day: Schedule.Day)
    func filterDataSource(for filter: Schedule.Filter)
    func prepareSegue(for indexPath: IndexPath)
    func title(forSection section: Int) -> String
}

final class ScheduleViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: ScheduleViewControllerDelegate?
    
    // MARK: - IBOUtlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var daySegmentedControl: SegmentedControl! { didSet {
        daySegmentedControl.style()
        daySegmentedControl.addTarget(self, action: .daySegmentedControlValueChanged, for: .valueChanged)
        }
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.backgroundColor = .interface(.background)
        tableView.separatorStyle = .none
    }

    
    // MARK: - Selector
    
    @objc fileprivate func daySegmentedControlValueChanged(_ sender: UISegmentedControl) {
        guard let day = Schedule.Day(rawValue: sender.selectedSegmentIndex) else {
            assertionFailure("Out of bounds segment index")
            return
        }
        
        delegate?.switchDataSource(for: day)
    }
}

extension ScheduleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScheduleSpeakerCell.defaultHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.prepareSegue(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 28)
        let label = SectionLabel(frame: frame)
        label.text = delegate?.title(forSection: section)
        return label
    }
}
