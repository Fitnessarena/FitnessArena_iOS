//
//  BreakfastViewController.swift
//  FitnessArena
//
//  Created by akshay on 2022-01-18.
//

import UIKit

class BreakfastViewController: UIViewController {
    
    var category = ""
    var subCategory = ""
    
    var foodType = WLFoodType.Breakfast
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgFoodType: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var name : [String] = []
    var details: [String] = []
    var images: [String] = []
    

    @IBOutlet weak var backBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBtn.setTitle("", for: .normal)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
        switch foodType {
        case .Breakfast:
            self.lblTitle.text = "Breakfast"
            self.category = "Breakfast"
            self.imgFoodType.image = UIImage(named: "BF")
            self.name = ["Organic Protein Powder","Wild Salmon","Eggs", "Almond Butter", "Ground Turkey","All Nature Peanut Butter","Black Beans","Chicken Breast","Nitrate-Free Canadian Bacon","Avocados","Spinach","Watermelon","Broccoli","Sweet Potatoes","Plain Oatmeal","Sprouted Grain Toast","Quinoa","Crispy Brown Rice","Flaxseeds","Smoothies"]
           
            self.details = ["Organic Protein Powder","Wild Salmon","Eggs", "Almond Butter", "Ground Turkey","All Nature Peanut Butter","Black Beans","Chicken Breast","Nitrate-Free Canadian Bacon","Avocados","Spinach","Watermelon","Broccoli","Sweet Potatoes","Plain Oatmeal","Sprouted Grain Toast","Quinoa","Crispy Brown Rice","Flaxseeds","Smoothies"]
            self.images =
                
                ["Decline dumbbell bench press","Dumbbell bench press","Dumbbell flye","Dumbbell incline bench press","Dumbbell pull-over","Dumbbell pushup","Incline dumbbell fly","Single-arm external rotation","Swiss-ball press","Swiss-ball pullover","Weighted pushup"]
        
            
        case .AMSnack:
            self.lblTitle.text = "A.M. Snack"
            self.category = "A.M. Snack"
            self.imgFoodType.image = UIImage(named: "amSnack")
            self.name = ["Popcorn","Nuts","Dark Chocolate","Dates","Grapes","Cottage Cheese","Avocado","Fresh Veggies","Hummus","Beans","Whole-Grain Crackers","Greek Yogurt","Nut Butters","Oatmeal","Kale Smoothie","Spinach Smoothie","Chia Seeds","Raspberries","Watermelon","Pears","Trail Mix","Crunchy Chickpeas","Cauliflower","Bananas","Carrots","Double Chocolate Banana Bread Bars","Air Fryer Tostones","Healthy Carrot Cake Oatmeal Cookies","Sliced Tomato With A Sprinkle Of Feta And Olive Oil","No-Bake Superfood Energy Bars","Shrimp And Cocktail Sauce","Chunky Healthy Granola","Baby Carrots With Everything Hummus","Vegetarian Black Bean Taco Cups","Banana Split","Green Goddess Hummus","Egg On Toast","Crispy sweet potato fries","Chocolate Milk","Peach And Honey Popsicles" ]
            
            self.details = ["Popcorn","Nuts","Dark Chocolate","Dates","Grapes","Cottage Cheese","Avocado","Fresh Veggies","Hummus","Beans","Whole-Grain Crackers","Greek Yogurt","Nut Butters","Oatmeal","Kale Smoothie","Spinach Smoothie","Chia Seeds","Raspberries","Watermelon","Pears","Trail Mix","Crunchy Chickpeas","Cauliflower","Bananas","Carrots","Double Chocolate Banana Bread Bars","Air Fryer Tostones","Healthy Carrot Cake Oatmeal Cookies","Sliced Tomato With A Sprinkle Of Feta And Olive Oil","No-Bake Superfood Energy Bars","Shrimp And Cocktail Sauce","Chunky Healthy Granola","Baby Carrots With Everything Hummus","Vegetarian Black Bean Taco Cups","Banana Split","Green Goddess Hummus","Egg On Toast","Crispy sweet potato fries","Chocolate Milk","Peach And Honey Popsicles"]
            self.images =
                
                ["Popcorn","Nuts","Dark Chocolate","Dates","Grapes","Cottage Cheese","Avocado","Fresh Veggies","Hummus","Beans","Whole-Grain Crackers","Greek Yogurt","Nut Butters","Oatmeal","Kale Smoothie","Spinach Smoothie","Chia Seeds","Raspberries","Watermelon","Pears","Trail Mix","Crunchy Chickpeas","Cauliflower","Bananas","Carrots","Double Chocolate Banana Bread Bars","Air Fryer Tostones","Healthy Carrot Cake Oatmeal Cookies","Sliced Tomato With A Sprinkle Of Feta And Olive Oil","No-Bake Superfood Energy Bars","Shrimp And Cocktail Sauce","Chunky Healthy Granola","Baby Carrots With Everything Hummus","Vegetarian Black Bean Taco Cups","Banana Split","Green Goddess Hummus","Egg On Toast","Crispy sweet potato fries","Chocolate Milk","Peach And Honey Popsicles"]
            
        case .Lunch:
            self.lblTitle.text = "Lunch"
            self.category = "Lunch"
            self.imgFoodType.image = UIImage(named: "honey")
            self.name = ["Italian Panini with Provolone, Peppers, and Arugula","Turkey BLT Salad","Artichoke-Feta Quiche","Fig, Prosciutto, & Goat Cheese Salad","Caprese Sandwich","Chicken Pot Stickers","Asian Chicken Meatballs","Portobello Cheesesteak","3-Cheese Ravioli with Cherry Tomatoes","Chicken Burgers with Sun-dried Tomato Aioli","Chicken Fingers with Chipotle-Honey","Grilled Chicken Salad with Cranberries, Avocado and Goat Cheese","Grilled Cheese and Tomato Soup","Clam Chowder","Red Pepper Alfredo","Cheesesteak Sandwich","Italian Tuna Melt","Gnocchi with Peas and Prosciutto","Meatball Soup","Minestrone with Pesto"]
            
            self.details = ["Italian Panini with Provolone, Peppers, and Arugula","Turkey BLT Salad","Artichoke-Feta Quiche","Fig, Prosciutto, & Goat Cheese Salad","Caprese Sandwich","Chicken Pot Stickers","Asian Chicken Meatballs","Portobello Cheesesteak","3-Cheese Ravioli with Cherry Tomatoes","Chicken Burgers with Sun-dried Tomato Aioli","Chicken Fingers with Chipotle-Honey","Grilled Chicken Salad with Cranberries, Avocado and Goat Cheese","Grilled Cheese and Tomato Soup","Clam Chowder","Red Pepper Alfredo","Cheesesteak Sandwich","Italian Tuna Melt","Gnocchi with Peas and Prosciutto","Meatball Soup","Minestrone with Pesto"]
            self.images =
                
                ["Italian Panini with Provolone, Peppers, and Arugula","Turkey BLT Salad","Artichoke-Feta Quiche","Fig, Prosciutto, & Goat Cheese Salad","Caprese Sandwich","Chicken Pot Stickers","Asian Chicken Meatballs","Portobello Cheesesteak","3-Cheese Ravioli with Cherry Tomatoes","Chicken Burgers with Sun-dried Tomato Aioli","Chicken Fingers with Chipotle-Honey","Grilled Chicken Salad with Cranberries, Avocado and Goat Cheese","Grilled Cheese and Tomato Soup","Clam Chowder","Red Pepper Alfredo","Cheesesteak Sandwich","Italian Tuna Melt","Gnocchi with Peas and Prosciutto","Meatball Soup","Minestrone with Pesto"]
        case .PMSnack:
            self.lblTitle.text = "P.M. Snack"
            self.category = "P.M. Snack"
            self.imgFoodType.image = UIImage(named: "pmSnack")
            self.name = ["White Beans And Olive Tapenade","Protein Cookie Dough","Dates And Pistachios","Almond Joy Protein Balls","Edamame with sea salt","Baked Kale Chips","PB-Chocolate Apple 'Nachos'","Chocolate-Covered Banana Pops","Microwave Egg Taco","Vitamin C Tropical Green Smoothie","Roasted Chickpeas","Avocado Chocolate Mousse","Almond Butter Crackers","Fruit Salad With Citrus Mint Dressing ","Homemade Popcorn","Banana Mocha Smoothie","DIY Ranch Dip With Veggies","Garlic Dill Sunflower Dip","Cottage Cheese With Almonds And Honey","Golden Milk Snack Bites","Jicama Sticks And Guacamole","Creamy Dragon Fruit Smoothie Bowl","Beef Or Turkey Jerky With Raisins","Sugar-Free Coconut Carob Bars","Pear And String Cheese","Watermelon Sashimi","Blueberry And Peach Green Tea Popsicles","Cajun-Spiced Savory Trail Mix","Homemade Chocolate Chip Granola Bars","5-Minute Healthy Strawberry Frozen Yogurt","Banana Ice Cream","Pumpkin Pie Dip","Coconut Lime Raspberry Chia Pudding","Cranberry Pistachio Dark Chocolate Bark","Simple Vegan Broccoli Soup","Protein-Packed Avocado Toast","Apple Dippers","Savory Snack Plate","Pumpkin Protein Cookies","Peanut Butter Energy Bites"]
            
            self.details = ["White Beans And Olive Tapenade","Protein Cookie Dough","Dates And Pistachios","Almond Joy Protein Balls","Edamame with sea salt","Baked Kale Chips","PB-Chocolate Apple 'Nachos'","Chocolate-Covered Banana Pops","Microwave Egg Taco","Vitamin C Tropical Green Smoothie","Roasted Chickpeas","Avocado Chocolate Mousse","Almond Butter Crackers","Fruit Salad With Citrus Mint Dressing ","Homemade Popcorn","Banana Mocha Smoothie","DIY Ranch Dip With Veggies","Garlic Dill Sunflower Dip","Cottage Cheese With Almonds And Honey","Golden Milk Snack Bites","Jicama Sticks And Guacamole","Creamy Dragon Fruit Smoothie Bowl","Beef Or Turkey Jerky With Raisins","Sugar-Free Coconut Carob Bars","Pear And String Cheese","Watermelon Sashimi","Blueberry And Peach Green Tea Popsicles","Cajun-Spiced Savory Trail Mix","Homemade Chocolate Chip Granola Bars","5-Minute Healthy Strawberry Frozen Yogurt","Banana Ice Cream","Pumpkin Pie Dip","Coconut Lime Raspberry Chia Pudding","Cranberry Pistachio Dark Chocolate Bark","Simple Vegan Broccoli Soup","Protein-Packed Avocado Toast","Apple Dippers","Savory Snack Plate","Pumpkin Protein Cookies","Peanut Butter Energy Bites"]
            self.images =
                
                ["White Beans And Olive Tapenade","Protein Cookie Dough","Dates And Pistachios","Almond Joy Protein Balls","Edamame with sea salt","Baked Kale Chips","PB-Chocolate Apple 'Nachos'","Chocolate-Covered Banana Pops","Microwave Egg Taco","Vitamin C Tropical Green Smoothie","Roasted Chickpeas","Avocado Chocolate Mousse","Almond Butter Crackers","Fruit Salad With Citrus Mint Dressing ","Homemade Popcorn","Banana Mocha Smoothie","DIY Ranch Dip With Veggies","Garlic Dill Sunflower Dip","Cottage Cheese With Almonds And Honey","Golden Milk Snack Bites","Jicama Sticks And Guacamole","Creamy Dragon Fruit Smoothie Bowl","Beef Or Turkey Jerky With Raisins","Sugar-Free Coconut Carob Bars","Pear And String Cheese","Watermelon Sashimi","Blueberry And Peach Green Tea Popsicles","Cajun-Spiced Savory Trail Mix","Homemade Chocolate Chip Granola Bars","5-Minute Healthy Strawberry Frozen Yogurt","Banana Ice Cream","Pumpkin Pie Dip","Coconut Lime Raspberry Chia Pudding","Cranberry Pistachio Dark Chocolate Bark","Simple Vegan Broccoli Soup","Protein-Packed Avocado Toast","Apple Dippers","Savory Snack Plate","Pumpkin Protein Cookies","Peanut Butter Energy Bites"]
        case .Dinner:
            self.lblTitle.text = "Dinner"
            self.category = "Dinner"
            self.imgFoodType.image = UIImage(named: "dinner")
            self.name = ["Crispy Cod with Sweet Potato Fries","Sheet-Pan Italian Pork Chops","Butter-Baked Salmon and Asparagus","Seared Ginger-Cumin Swordfish With Blueberry-Avocado Salsa","Zucchini Noodles with Bacon Vinaigrette","Pesto Chicken","Warm Kale-Quinoa Salad","Garam Masala Chicken Skewers","Avocado Soup","One Pot Lemon Herb Chicken and Rice","Easy Pork Chops with Sweet and Sour Glaze","Creamy Chicken Quinoa Broccoli Casserole","Mexican Tortilla Casserole","Simple Sesame Chicken","Harissa and Citrus Baked Salmon","5-Ingredient Butternut Squash, Arugula, and Goat Cheese Pasta","3-Ingredient Salmon","One Skillet Lemon Chicken and Red Potatoes","5-Ingredient Easy White Chicken Chili","12-Minute Peanut Noodles","Crockpot Quinoa Chicken Primavera","One Pot Pasta","ttuccine Carbonara with Green Beans","One Pot Lemon Orzo Shrimp","Skillet Chipotle Chicken Enchilada Bake","Single Serving Tomato Sourdough Soup","Maple-Soy Glazed Salmon","Gnocchi Skillet with Chicken Sausage and Tomatoes","5-Ingredient Chili","Savory Steel Cut Oatmeal"]
            
            self.details = ["Crispy Cod with Sweet Potato Fries","Sheet-Pan Italian Pork Chops","Butter-Baked Salmon and Asparagus","Seared Ginger-Cumin Swordfish With Blueberry-Avocado Salsa","Zucchini Noodles with Bacon Vinaigrette","Pesto Chicken","Warm Kale-Quinoa Salad","Garam Masala Chicken Skewers","Avocado Soup","One Pot Lemon Herb Chicken and Rice","Easy Pork Chops with Sweet and Sour Glaze","Creamy Chicken Quinoa Broccoli Casserole","Mexican Tortilla Casserole","Simple Sesame Chicken","Harissa and Citrus Baked Salmon","5-Ingredient Butternut Squash, Arugula, and Goat Cheese Pasta","3-Ingredient Salmon","One Skillet Lemon Chicken and Red Potatoes","5-Ingredient Easy White Chicken Chili","12-Minute Peanut Noodles","Crockpot Quinoa Chicken Primavera","One Pot Pasta","ttuccine Carbonara with Green Beans","One Pot Lemon Orzo Shrimp","Skillet Chipotle Chicken Enchilada Bake","Single Serving Tomato Sourdough Soup","Maple-Soy Glazed Salmon","Gnocchi Skillet with Chicken Sausage and Tomatoes","5-Ingredient Chili","Savory Steel Cut Oatmeal"]
            self.images =
                
                ["Crispy Cod with Sweet Potato Fries","Sheet-Pan Italian Pork Chops","Butter-Baked Salmon and Asparagus","Seared Ginger-Cumin Swordfish With Blueberry-Avocado Salsa","Zucchini Noodles with Bacon Vinaigrette","Pesto Chicken","Warm Kale-Quinoa Salad","Garam Masala Chicken Skewers","Avocado Soup","One Pot Lemon Herb Chicken and Rice","Easy Pork Chops with Sweet and Sour Glaze","Creamy Chicken Quinoa Broccoli Casserole","Mexican Tortilla Casserole","Simple Sesame Chicken","Harissa and Citrus Baked Salmon","5-Ingredient Butternut Squash, Arugula, and Goat Cheese Pasta","3-Ingredient Salmon","One Skillet Lemon Chicken and Red Potatoes","5-Ingredient Easy White Chicken Chili","12-Minute Peanut Noodles","Crockpot Quinoa Chicken Primavera","One Pot Pasta","ttuccine Carbonara with Green Beans","One Pot Lemon Orzo Shrimp","Skillet Chipotle Chicken Enchilada Bake","Single Serving Tomato Sourdough Soup","Maple-Soy Glazed Salmon","Gnocchi Skillet with Chicken Sausage and Tomatoes","5-Ingredient Chili","Savory Steel Cut Oatmeal"]
        }
        
        self.tableView.reloadData()
        
    }
    
    class func identifier() -> BreakfastViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreakfastViewController") as! BreakfastViewController
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        self.popVC()
    }
    
}

extension BreakfastViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NutritionTableViewCell
        cell.lblTxt.text = self.name[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ArmsDetailViewController") as? ArmsDetailViewController{
            vc.name = self.name[indexPath.row]
            vc.details = self.details[indexPath.row]
            vc.images = self.images[indexPath.row]
            vc.category = self.category
            vc.subCategory = self.subCategory
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
