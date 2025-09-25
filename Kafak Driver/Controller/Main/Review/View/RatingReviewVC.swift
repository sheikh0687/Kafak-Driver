//
//  RatingReviewVC.swift
//  Kafak Driver
//
//  Created by Techimmense Software Solutions on 14/08/24.
//

import UIKit
import Cosmos

class RatingReviewVC: UIViewController {

    @IBOutlet weak var rating_TableVw: UITableView!
    
    @IBOutlet weak var lbl_RatingCount: UILabel!
    @IBOutlet weak var cosmosRating: CosmosView!
    @IBOutlet weak var lbl_PersonCount: UILabel!
    
    let viewModel = ReviewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rating_TableVw.register(UINib(nibName: "RatingReviewCell", bundle: nil), forCellReuseIdentifier: "RatingReviewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        setNavigationBarItem(LeftTitle: "", LeftImage: "black_back", CenterTitle: R.string.localizable.myReview(), CenterImage: "", RightTitle: "", RightImage: "", BackgroundColor: "#001845", BackgroundImage: "", TextColor: "#ffffff", TintColor: "#ffffff", Menu: "")
        fetchRatings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    public func fetchRatings()
    {
        viewModel.requestToFetchReview(vC: self)
        viewModel.cloReviewSuccess = { [weak self] in
            DispatchQueue.main.async {
                let obj = self?.viewModel.arrayReviewList
                self?.lbl_RatingCount.text = "\(obj?[0].avg_rating ?? 0)"
                self?.lbl_PersonCount.text = "\(obj?.count ?? 0) \(R.string.localizable.personRateIt())"
                self?.rating_TableVw.reloadData()
            }
        }
    }
}

extension RatingReviewVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayReviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingReviewCell", for: indexPath) as! RatingReviewCell
        let obj = viewModel.arrayReviewList[indexPath.row]
        
        cell.lbl_Name.text = obj.user_name ?? ""
        cell.lbl_DateTime.text = obj.date_time ?? ""
        cell.cosmosVw.rating = Double(obj.avg_rating ?? 0)
        cell.lbl_Raing.text = "\(obj.avg_rating ?? 0)"
        cell.lbl_Message.text = obj.review ?? ""
        
        if Router.BASE_IMAGE_URL != obj.image {
            Utility.setImageWithSDWebImage(obj.image ?? "", cell.profileImg)
        } else {
            cell.profileImg.image = R.image.profile_ic()
        }
        
        return cell
    }
}
