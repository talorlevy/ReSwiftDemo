//
//  ViewController.swift
//  ReSwiftDemo
//
//  Created by Talor Levy on 4/19/23.
//

import UIKit
import ReSwift
import RxCocoa
import RxSwift

class ViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var weatherTableView: UITableView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        
        // viewController is subscribing to Store:
        appStore.subscribe(self)
        
        // dispatching getLocation Thunk:
        appStore.dispatch(getUserLocationThunk)
    }
    
    // unsubscribing to the Store when the view is not visible anymore.
    override func viewWillDisappear(_ animated: Bool) {
        appStore.unsubscribe(self)
    }
    
    // protocol conformance from 'StoreSubscriber'
    func newState(state: AppState) {
        if let result = state.weatherData {
            switch result {
            case .success(let weather):
                if let weatherArray = weather.list {
                    let data = Observable.of(weatherArray)
                    data.asDriver(onErrorJustReturn: [])
                        .drive(weatherTableView.rx.items(cellIdentifier: "Cell"))
                    { (_, weatherObject, cell) in
                        cell.textLabel?.text = weatherObject.date
                        cell.detailTextLabel?.text = weatherObject.weather?[0].description
                    }
                    .disposed(by: disposeBag)
                }
            case .failure(_):
                print("Received error")
            }
        } else if state.latitude != nil && state.longitude != nil {
            appStore.dispatch(fetchWeatherThunk)
        }
    }

    func setUpUI() {
        self.title = "WeatherApp-Redux"
        weatherTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
