//
//  EventsListViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/26/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol EventsListViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onEventDetails: ((_ event: EventsList.Event) -> Void)? { get set }
}

class EventsListViewController: UIViewController, EventsListViewControllerProtocol {
    
    // MARK: - EventsListViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onEventDetails: ((EventsList.Event) -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: (EventsListViewModelProtocol & BaseViewModel)?
    
    // MARK: - Outelts
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.bindUI()
    }
    
    // MARK: - Private methods
    
    private func bindUI() {
        self.viewModel?.isLoaderHidden.bindAndFire({ [weak self] in
            self?.shouldHideLoader(isHidden: $0)
        })
        self.viewModel!.events.bindAppendListener { [unowned self] in
            self.tableView.insertRows(at: self.indexPathsForReloading(numberOfNewRows: $0), with: .right)
        }
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "EventTableViewCell", bundle: nil), forCellReuseIdentifier: "EventTableViewCell")
    }
    
    private func indexPathsForReloading(numberOfNewRows: Int) -> [IndexPath] {
        let numberOfRows = self.viewModel!.numberOfRows()
        var indexPathForAnimation = [IndexPath]()
        for index in ((numberOfRows - numberOfNewRows)...(numberOfRows - 1)) {
            indexPathForAnimation.append(IndexPath(row: index, section: 0))
        }
        return indexPathForAnimation
    }
    
    // MARK: - Actions
    
    @IBAction private func actionBack() {
        self.onBack?()
    }
    
}

// MARK: - Extensions
// MARK: - UITableViewDataSource

extension EventsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel!.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        cell.populate(event: self.viewModel!.eventAtIndexPath(indexPath: indexPath))
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension EventsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 283
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let event = self.viewModel!.eventAtIndexPath(indexPath: indexPath)
        self.onEventDetails?(event)
        
    }
    
}

// MARK: - UIScrollViewDelegate

extension EventsListViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            self.shouldGoToNextPage()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.tableView == scrollView {
            self.shouldGoToNextPage()
        }
    }
    
    private func shouldGoToNextPage() {
        let bottomEdge = self.tableView.contentOffset.y + self.tableView.frame.size.height + 200
        if bottomEdge >= self.tableView.contentSize.height {
            self.viewModel!.getEvents()
        }
    }
    
}
