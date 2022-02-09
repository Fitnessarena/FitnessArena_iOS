//
//  BreakfastBMViewController.swift
//  FitnessArena
//
//  Created by akshay on 2022-01-18.
//

import UIKit

class BreakfastBMViewController: UIViewController {

    var foodType = BMFoodType.Breakfast
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var imgFoodType: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var backBtn: UIButton!
    
    var category = ""
    var subCategory = ""
    
    var arrName : [String] = []
    var arrDetails : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBtn.setTitle("", for: .normal)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false

        switch foodType {
        case .Breakfast:
            self.lblTitle.text = "Breakfast"
            self.subCategory = "Breakfast"
            self.imgFoodType.image = UIImage(named: "BF")
            self.arrName = ["Wholegrain Avocado Toast with Sunny-Side Up","Cheese Omlette with Kale and Mushroom Filling","Creamy Oatmeal Porridge with Banana and Peanut Butter","Mixed Veg Whole Wheat Paratha","Homemade Sweet potato Hash Brown","Tangy Paneer Tikka Sandwich","Tasty Greek Yoghurt Museli Parfait","Spicy Tofu Scramble","Easy Peanut Butter and Jelly Sandwich"]
            
        case .AMSnack:
            self.lblTitle.text = "A.M. Snack"
            self.subCategory = "AMSnack"
            self.imgFoodType.image = UIImage(named: "amSnack")
            self.arrName = ["Jerky","Fillet smoked pork tenderloin","Canned tuna","Protein bars","Hard-boiled eggs","Greek yogurt","Cottage cheese","Weight gain smoothies","Dark chocolate","Tortilla chips","Granola bars","Whole wheat crackers","Popcorn","Brown rice cakes","Whole grain cereals","Whole wheat pretzels","Gingerbread","Muesli","Whole wheat bread","English muffin","Pancakes","Honey","Jam","Raisins","Medjool dates","Dried figs","Dried apricots","Prunes","Dried peaches"]
            
        case .Lunch:
            self.lblTitle.text = "Lunch"
            self.subCategory = "Lunch"
            self.imgFoodType.image = UIImage(named: "honey")
            self.arrName = ["Pork meatballs","Whole wheat bread ","Ketchup"]
            
        case .PMSnack:
            self.lblTitle.text = "P.M. Snack"
            self.subCategory = "PMSnack"
            self.imgFoodType.image = UIImage(named: "pmSnack")
            self.arrName = ["Bananas","Fruit juice","Butter","Cheddar cheese","String cheese","Ice cream","Whole milk","Macadamia nuts","Pecans","Pine nuts","Brazil nuts","Walnuts","Hazelnuts","Peanuts","Almonds","Cashew nuts","Pistachios","Peanut butter","Trail mix","Sunflower seeds","Pumpkin seeds","Sesame seeds","Ground flax seeds","Poppy seeds","Chia seeds","Coconut meat","Avocados"]
            
        case .Dinner:
            self.lblTitle.text = "Dinner"
            self.subCategory = "Dinner"
            self.imgFoodType.image = UIImage(named: "dinner")
            self.arrName = ["Roasted turkey breast","Cooked brown rice","Cucumber salad"]
            
        case .Protein:
            self.lblTitle.text = "Protein"
            self.subCategory = "Protein"
            self.imgFoodType.image = UIImage(named: "protein-1")
            self.arrName = ["Protein","Carbohydrates","Vitamins","Fats", "Minerals", "Water"]
            self.arrDetails = ["""
                       • Lean meats – beef, lamb, veal, pork, kangaroo
                       
                       • Poultry – chicken, turkey, duck, emu, goose, bush birds
                       
                       • Fish and seafood – fish, prawns, crab, lobster, mussels, oysters, scallops, clams
                       
                       • Eggs
                       
                       • Dairy products – milk, yoghurt (especially Greek yoghurt), cheese (especially cottage cheese)
                       
                       • Nuts (including nut pastes) and seeds – almonds, pine nuts, walnuts, macadamias, hazelnuts, cashews, pumpkin seeds, sesame seeds, sunflower seeds
                       
                       • Legumes and beans – all beans, lentils, chickpeas, split peas, tofu.
                       """,
                       
                       
                        """
                        • Beans and legumes, such as black beans, chickpeas, lentils and kidney beans.
                        
                        • Fruits, such as apples, berries and melons.
                        
                        • Whole-grain products, such as brown rice, oatmeal and whole-wheat bread and pasta.
                        
                        • Vegetables, such as corn, lima beans, peas and potatoes.
                        """,
                       """
                       • Vitamin A — carrots, sweet potatoes, spinach, kale
                       
                       • Vitamin B12 — meat, poultry,
                       
                       • Vitamin E — nuts, seeds, vegetable oils
                       
                       • Vitamin C — Oranges, strawberries, tomatoes, kiwi, broccoli, and red and green bell peppers.
                       """,
                       
                       """
                       
                       • Nuts
                       
                       • Dried fruit
                       
                       • Chia seeds
                       
                       • Fresh berries
                       
                       • Homemade granola
                       """,
                       
                       
                       """
• Nuts and seeds

• Shellfish

• Cruciferous vegetables

• Organ meats

• Eggs

• Beans

• Cocoa

• Avocados
""",
                       
                       """
• Men: 3.7 liters/day

• Women: 2.7 liters/day
"""]
    
        case .PreWorkout:
            self.lblTitle.text = "Pre - Workout"
            self.subCategory = "Pre-workout"
            self.imgFoodType.image = UIImage(named: "honey")
            self.arrName = ["Cottage cheese","Honey","Banana","Whole Wheat Bread"]
            
        case .PostWorkout:
            self.lblTitle.text = "Post - Workout"
            self.subCategory = "Post-workout"
            self.imgFoodType.image = UIImage(named: "muffin")
            self.arrName = ["Hard Boiled Eggs","English Muffin","Whole Milk"]
            
        case .PreBedSnack:
            self.lblTitle.text = "Pre - Bed"
            self.subCategory = "Pre-bed"
            self.imgFoodType.image = UIImage(named: "juice")
            self.arrName = ["Full-Fat Greek Yogurt","Apple Juice"]
        }
    }
    
    class func identifier() -> BreakfastBMViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreakfastBMViewController") as! BreakfastBMViewController
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.popVC()
    }
}
extension BreakfastBMViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NutritionTableViewCell
        cell.lblTxt.text = self.arrName[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.foodType == .Protein {
            let vc = NutritionDetailViewController.identifier()
            vc.arrName = self.arrName
            vc.arrDetails = self.arrDetails
            vc.index = indexPath.row
            self.push(vc: vc)
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "ArmsDetailViewController") as? ArmsDetailViewController{
                vc.name = self.arrName[indexPath.row]
//                vc.details = self.details[indexPath.row]
//                vc.images = self.images[indexPath.row]
                vc.category = self.category
                vc.subCategory = self.subCategory
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
