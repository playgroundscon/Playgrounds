//
//  PresentationsViewController.swift
//  Playgrounds
//
//  Created by Andyy Hope on 19/11/16.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit


fileprivate extension Selector {
    static let filterSegmentedControlValueChanged = #selector(PresentationsViewController.filterSegmentedControlValueChanged(_:))
}

extension PresentationsViewController {
    
    typealias ThursdayDataSource = PresentationsThursdayDataSource
    typealias FridayDataSource = PresentationsFridayDataSource
}

final class PresentationsViewController: UIViewController {

    fileprivate var thursdayDataSource = ThursdayDataSource()
    fileprivate var fridayDataSource = FridayDataSource()
    fileprivate var scheduleViewController: ScheduleViewController!
    fileprivate var day: Schedule.Day = .thursday
    
    var tableView: UITableView {
        return scheduleViewController.tableView
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl! { didSet {
        filterSegmentedControl.addTarget(self, action: .filterSegmentedControlValueChanged, for: .valueChanged)
        }
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Talks"
        request()
    }
    
    var shadowImage: UIImage? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = thursdayDataSource
        scheduleViewController.delegate = self
        tableView.register(ScheduleSpeakerCell.self)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Requests
    
    private func request() {
        Requester.requestPresentations {
            switch $0 {
            case .success(let sessions):
                self.thursdayDataSource.day = ScheduleDay(sessions: sessions)
                self.tableView.reloadData()
                
            case .fail:
                break
            }
        }
    }
}

extension PresentationsViewController: ScheduleViewControllerDelegate {
    
    // MARK: Data Source
    
    func switchDataSource(for day: Schedule.Day) {
        self.day = day
        switch day {
        case .thursday:
            print("Thursday")
            tableView.dataSource = thursdayDataSource
        case .friday:
            print("Friday")
            tableView.dataSource = fridayDataSource
        }
    }
    
    func filterDataSource(for filter: Schedule.Filter) {
        switch filter {
        case .none:
            print("No filter")
        case .favorite:
            print("Favorite")
        }
    }
    
    
    // MARK: - Navigation {
    
    func prepareSegue(for indexPath: IndexPath) {
        performSegue(.details, sender: self)
    }
    
    func title(forSection section: Int) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mma"
        
        
        switch day {
        case .thursday:
        let timeInterval = TimeInterval(thursdayDataSource.day.sessions[section].time.rawValue)
        let date = Date(timeIntervalSince1970: timeInterval)
        return dateFormatter.string(from: date)
            
        case .friday: return ""
        }
    }
    
    
    // MARK: - Selectors
    
    @objc fileprivate func filterSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        if let filter = Schedule.Filter(rawValue: sender.selectedSegmentIndex) {
            filterDataSource(for: filter)
        }
        else {
            assertionFailure("Out of bounds segment index")
        }
    }
}

extension PresentationsViewController: SegueHandler {
    
    enum Segue: String {
        case contained, details
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segueIdentifier(for: segue) {
        case .contained:
            guard let viewController = segue.destination as? ScheduleViewController else { return }
            
            scheduleViewController = viewController
            
        case .details:
            guard let viewController = segue.destination as? PresentationDetailViewController else { return }
            
            viewController.session = ScheduleSession(time: .eleven)
        }
    }
}
