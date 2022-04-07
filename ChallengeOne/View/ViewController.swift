import UIKit
public final class ViewController: UITableViewController, ViewModelDelegate{
    
    
    // MARK: - Attributes
    public var delegate: ViewControllerDelegate?
    var catBreeds: [Breed] = []
    var viewModel: ViewModelProtocol
    // MARK: - Data From API
    public func dataReceived(_ catBreeds: [Breed]) {
        self.catBreeds = catBreeds
        tableView.reloadData()
    }
    // MARK: - table setting funcs
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tableRowsNumber: Int = catBreeds.count
        return tableRowsNumber
    }
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let cellText = catBreeds[indexPath.row].name
        cell.textLabel?.text = cellText
        return cell
    }
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = catBreeds[indexPath.row]
        let catView = CatViewController(breed)
        self.navigationController?.pushViewController(catView, animated: true)
        
    }
    // MARK: - Init Methods
    public init(viewModel: ViewModelProtocol) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
            self.viewModel.delegate = self
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - View lifecycle
    public override func viewDidLoad() {
        navigationItem.title = "Breeds"
        self.viewModel.getData()
        super.viewDidLoad()
    }
    //MARK: - Delegate
    public func setDelegate(viewControllerDelgate delegate: ViewControllerDelegate) {
        self.delegate = delegate
    }
}
