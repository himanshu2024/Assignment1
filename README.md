# IOS Assignment 1
Licious assignment.
Things to learn :
### MVVM
ReviewRatingViewModel

### Parse json to swift object
```
 func getJsonDataFromFile(completion : (Result<ReviewResponse, MyError>) -> Void) {
        if let path = Bundle.main.path(forResource: "Payload", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                let model = try decoder.decode(ReviewResponse.self, from: data)
                completion(.success(model))
              } catch {
                completion(.failure(.canNotProcessData))
              }
        }
    }
```

### reload only single tableViewCell (*)
```
  extension ViewController : RatingProtocol{
    func updateTableCell(for cell : UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
        }
    }
}
```
### Cosmos View
FeedbackTableViewCell
