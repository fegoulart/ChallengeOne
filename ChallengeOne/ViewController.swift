import UIKit

public final class ViewController: UITableViewController, ViewModelDelegate {
    
    var catBreeds: [String]?
    
    public func dataReceived(_ catBreeds: [String]) {
        print(catBreeds)
        self.catBreeds = catBreeds
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tableRowsNumber: Int = catBreeds?.count
        {
            return tableRowsNumber

        }
        else
        {
            return 0
        }
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        if let cellText = catBreeds?[indexPath.row]
        {
            cell.textLabel?.text = cellText
        }
        
        return cell
    }
    
    var viewModel: ViewModelProtocol
    
    public init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
    public override func viewDidLoad() {
        self.viewModel.getData()
        super.viewDidLoad()
    }
    
}
