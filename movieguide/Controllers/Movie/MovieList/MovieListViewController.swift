//
//  MovieListViewController.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import UIKit
import PKHUD

class MovieListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    private let viewModel = MovieViewModel()
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
        return tap
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.assignController(self)
        self.viewModel.requestUpcoming()
        self.tblView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Upcoming"
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = " "
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let movieDetailVC = segue.destinationViewController as? MovieDetailViewController
        movieDetailVC?.assignViewModel(self.viewModel)
    }
    
    // MARK: - Auxiliar Functions
    
    @IBAction internal func dismissKeyboard(sender: AnyObject) {
        self.searchBar.resignFirstResponder()
    }

}

extension MovieListViewController: MovieProtocol {
    
    func hideLoading() {
        HUD.hide()
        self.tblView.reloadData()
    }
    
}

extension MovieListViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.filteredMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(MovieTableViewCell.cellIdentifier(), forIndexPath: indexPath) as? MovieTableViewCell
        cell?.configureCell(self.viewModel.filteredMovies[indexPath.row])
        return cell!
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.viewModel.selectMovie(indexPath.row)
    }
}

extension MovieListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.viewModel.filter(searchBar.text!)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.viewModel.filter("")
        searchBar.resignFirstResponder()
    }
    
}
