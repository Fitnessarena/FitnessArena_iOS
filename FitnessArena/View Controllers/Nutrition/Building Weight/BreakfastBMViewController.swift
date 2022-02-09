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
    var arrImages: [String] = []
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
            self.arrName = ["Wholegrain Avocado Toast with Sunny-Side Up","Cheese Omlette with Kale and Mushroom Filling","Creamy Oatmeal Porridge with Banana and Peanut Butter","Mixed Veg Whole Wheat Paratha","Homemade Sweet potato Hash Brown","Tasty Greek Yoghurt Museli Parfait","Spicy Tofu Scramble","Easy Peanut Butter and Jelly Sandwich"]
            self.arrDetails = ["If you are fond of eggs and avocado, we have a delicious treat that combines two of your favorite items. The wholewheat avocado toast is super quick to make and keeps you satisfied for a long time. Avocados are calorie-dense foods and rich in healthy fats. Adding a fried egg makes matters more interesting, along with pumping in additional calories.",
                               "Nothing can beat an Omelette when it comes to starting the day on a perfect note. To amp up the nutrition factor and taste a regular omelette, you can add some cheese, kale, and mushroom. The result is a gooey, fluffy omelette that takes less than 10 minutes to prepare. Along with helping you gain weight, the high-protein dish also improves muscle mass.",
                               "Start your day on a ‘sweet’ note with this creamy oats porridge. Not only is it quick to make, but also tastes incredibly delicious. With a generous portion of bananas and peanut butter, the porridge fills you with energy and even scores high in the nutrition aspect. The porridge packs around 370 calories per serving, making it one of the best morning breakfast ideas for weight gain",
                               "Parantha lovers, rejoice! Your favorite vegetable Paratha, is one of the best Indian breakfast options for weight gain. So, with little preparation and some practice, you can enjoy wholesome paranthas for lunch at home. Replace white flour with whole wheat and include some ghee for that extra love and nutrition. Try to add a healthy blend of vegetables like carrots, onions, cauliflower etc., to get your daily dose of nutrients.",
                               "Sweet potatoes add a healthy twist to traditional English Potato hashbrowns. These delicious treats make your weight gain breakfast chart more interesting and nutritious too. The crispy exterior complements the soft interiors make you want to binge on them every day. The best part? This high-carb breakfast recipe is super easy to make and pack a lot of nutrition!",
                               "If you are tired of cooking elaborate meals for breakfast, then here is an easy and healthy breakfast idea that can help you gain weight. The Greek Yoghurt Muesli parfait has all the necessary ingredients to jump start your day. This is a probiotic-rich breakfast that is also high in dietary fiber, vitamins and minerals.",
                               "If you are looking for a protein-rich, vegan breakfast option for weight gain, then try making this tofu scramble. The recipe includes generous amounts of spices and green chilli to suit the Indian palate. You can have this dish along with bread, chapati, parantha or even on its own. Tofu scramble is also an excellent post-workout meal to pump up those muscles.",
                               "Peanut butter and jelly sandwich is an easy weight gain breakfast idea for skinny and underweight individuals. It needs to elaborate cooking methods or preparation. The high-calorie breakfast delivers a good amount of nutrition from peanut butter and fruit compote or low-sugar jam."]
            self.arrImages = ["Wholegrain Avocado Toast with Sunny-Side Up","Cheese Omlette with Kale and Mushroom Filling","Creamy Oatmeal Porridge with Banana and Peanut Butter","Mixed Veg Whole Wheat Paratha","Homemade Sweet potato Hash Brown","Tasty Greek Yoghurt Museli Parfait","Spicy Tofu Scramble","Easy Peanut Butter and Jelly Sandwich"]
            
        case .AMSnack:
            self.lblTitle.text = "A.M. Snack"
            self.subCategory = "AMSnack"
            self.imgFoodType.image = UIImage(named: "amSnack")
            self.arrName = ["Jerky","Fillet smoked pork tenderloin","Canned tuna","Protein bars","Hard-boiled eggs","Greek yogurt","Cottage cheese","Weight gain smoothies","Dark chocolate","Tortilla chips"]
            self.arrDetails = ["""
                               Jerky is the high-protein snack with the most calories in our ranking, mainly because it has plenty of fats as well. However, be careful that jerky has a lot of sodium, so you don’t want to eat 100 g of it a day, even if that amount has a good share of iron as well.
                               •    Calories: 410 calories / 100 g
                               •    Macronutrients: 33 g of proteins, 11 g of carbs, and 26 g of fats
                               •    Micronutrients (% daily value): 92% sodium, 30% iron
                               •    How to add more calories to this snack? As jerky is a high-calorie snack that’s rich in proteins and fats, you want to complete your snack with more carbs, so have a slice of whole wheat bread or an English muffin alongside your meat.
""",
                               """
A few slices of smoked pork tenderloin come in handy when you need to prepare a high-protein snack that also has plenty of calories.
                               •    Calories: 134 calories / 100 g
                               •    Macronutrients: 25 g of proteins and 26 g of fats
                               •    How to add more calories to this snack? Combine your fillet pork tenderloin with butter and whole wheat bread to prepare a high-calorie sandwich that makes for a protein-filled snack.
""",
                               """
            Canned tuna doesn’t have over 100 calories but it is a protein-packed snack that helps you build muscle, so it’s definitely a useful and healthy food to add to your diet.
            •    Calories: 85 calories / 100 g
            •    Macronutrients: 19 g of protein and 1 g of fats.
            •    Micronutrients (% daily value): 16% sodium, 7% potassium, 5.4% iron
            •    How to add more calories to this snack? Make a tuna and avocado salad to bring some healthy fats to your snack. Add some whole wheat bread, crackers, or pretzels into the mix to maximize your calorie intake.
            Tuna is also good if you have an upset stomach, as it counts among the 50 most easily digestible foods you can include in your diet.
            """,
                               """
            Snacking on protein bars is one of the easiest ways to fill up with energy before or after workouts. Besides, this high-protein snack has plenty of calcium, iron, and a bit of vitamin D.
            •    Calories: 82 calories / 1 bar (53 g)
            •    Macronutrients: 20 g of protein, 21 g of carbs, and 5.2 g of fat
            •    Micronutrients (% daily value): 24% calcium, 23% iron, 8% vitamin D
            •    How to add more calories to this snack? For a greater protein and calorie intake, having Greek yogurt or some cottage cheese alongside your bar is a very nutritious idea.
            """,
                               """
            Eggs are one of the most nutritious foods, and thus they make for a healthy snack packed with proteins and fats.
            Besides, eggs can be cooked in various ways. For example, hard-boiled eggs have a decent amount of vitamin A, iron, potassium, and sodium.
            •    Calories: 155 calories / 2 large eggs (100 g)
            •    Macronutrients: 13 g of protein, 1 g of carbs, and 11 g of fat
            •    Micronutrients (% daily value): 10.4% vitamin A, 6.6% iron, 5% sodium, and 4% potassium
            •    How to add more calories to this snack? Hard-boiled eggs go well with a few slices of whole wheat bread or an English muffin. Alternatively, you can add boiled eggs to a salad along with some vegetables, croutons, and olive oil for a calorie boost.
""",
     """
            Greek yogurt is a handy source of protein and calcium that will help you fill up your daily calorie needs.
            •    Calories: 97 calories / 100 g of full fat Greek yogurt
            •    Macronutrients: 9 g of protein, 4 g of carbs, and 5 g of fats
            •    Micronutrients (% daily value): 8% calcium, 4% potassium
            •    How to add more calories to this snack? It’s a good idea to combine Greek yogurt with high-carb bulking snacks, such as a slice of whole-grain bread, dried fruits, or a touch of honey.
            Important tip: make sure to pay attention to the amount of fat that different Greek yogurts have. In stores, you will usually find zero fat, low fat, and full-fat variants. Choose according to your caloric needs and diet plan.
            For example, if you want to gain weight and you generally struggle to eat enough fats during the day, you should go for the full-fat yogurt option. On the other hand, if you wish to lose weight, you will find that the zero fat or low-fat variant will make it easier for you to stay in a caloric deficit.
""",
                               """
                               Even though cottage cheese doesn’t offer as much energy as other healthy high-calorie snacks on this list, it is a useful snack for bulking up because of its high protein content and affordable price.
                               •    Calories: 82 calories / 100 g
                               •    Macronutrients: 11 g of protein, 4 g of carbs, and 2 g of fats
                               •    Micronutrients (% daily value): 6.4% calcium, 15% sodium
                               •    How to add more calories to this snack? Cottage cheese tastes delicious with some grapes, apples, or canned fruits on the side. Also, try mixing cottage cheese with one or two tablespoons of honey to get a calorie surplus on this snack.
            """,
                               """
            If you consider smoothies as being slurpable snacks, then weight gain smoothies clearly earned their title of the highest calorie snack. You can find smoothie recipes for weight gain ranging from 400 calories to almost 1300 on our list of high-calorie smoothies.
            •    Calories: 1254 calories / 1 Green Seed Mix smoothie
            •    Macronutrients: 35 g of protein, 147 g of carbs, and 73 g of fat
            •    How to add more calories to this snack? It is unlikely that you will want to add more calories to a slurpable snack consisting of almost 1300 calories, but if you do, you can dip a protein bar in the smoothie for an increased protein intake.
            Tip: since smoothies are oftentimes made with vegetables, make sure to use high-calorie vegetables when preparing one to obtain a slurpable snack with as many as possible calories
""",
                               """
            Dark chocolate is hands down one of the most energizing carbs in our list of healthy high-calorie snacks. Chocolate with 70-85% cacao has plenty of carbs but also a lot of fats while featuring a decent amount of protein as well.
            •    Calories: 598 calories / 100 g
            •    Macronutrients: 8 g of protein, 46 g of carbs, and 43 g of fat
            •    Micronutrients (% daily value): 46% iron, 12% potassium
            •    How to add more calories to this snack? Dark chocolate goes well with other bulking snacks such as dried apricots, nuts, or cheese.
""",
                               """
            Tortilla chips are a high-calorie snack that’s rich in carbs and fats, so you don’t want to eat too many of them.
            Also, as tortilla chips are usually salted, they may put you in danger of exceeding the daily limit for sodium. Eat responsibly is the keyword phrase here.
            •    Calories: 497 calories / 100 g
            •    Macronutrients: 7 g of protein, 67 g of carbs, and 22 g of fats
            •    Micronutrients (% daily value): 8% iron, 8% calcium, 14% sodium, 5% potassium
            •    How to add more calories to this snack? A great idea for a bulking snack with even more calories is to dip tortilla chips in some avocado spread. As an alternative, you can dip the chips in peanut butter or Greek yogurt.
"""]
            self.arrImages = []
            
        case .Lunch:
            self.lblTitle.text = "Lunch"
            self.subCategory = "Lunch"
            self.imgFoodType.image = UIImage(named: "honey")
            self.arrName = ["Pork meatballs","Whole wheat bread ","Ketchup"]
            self.arrDetails = ["""
            260 calories
            o    Amount: 5 meatballs (150 g)
            o    Protein: 22 g
            o    Carbs: 5 g
            o    Fats: 17 g
""",
            """
            142 calories
            o    Amount: 2 slices (56 g)
            o    Protein: 7 g
            o    Carbs: 24 g
            o    Fats: 2 g
""",
            """
22 calories
            o    Amount: 20 g
            o    Carbs: 5 g
"""]
            self.arrImages = ["Pork meatballs","Whole wheat bread ","Ketchup"]
            
        case .PMSnack:
            self.lblTitle.text = "P.M. Snack"
            self.subCategory = "PMSnack"
            self.imgFoodType.image = UIImage(named: "pmSnack")
            self.arrName = ["Bananas","Fruit juice","Butter","Cheddar cheese","String cheese","Ice cream","Whole milk","Macadamia nuts","Pecans","Pine nuts"]
            self.arrDetails = ["""
"Bananas make for a healthy high-calorie snack that is great for anyone looking to bulk up on a budget. Actually, bananas are some of the most nutritious fruits as they contain vitamin C, potassium, and plenty of energy due to their high-carb content.
                               •    Calories: 105 calories / medium banana (118 g)
                               •    Macronutrients: 1 g of protein and 27 g of carbs
                               •    Micronutrients (% daily value):  17% vitamin C, 12% potassium
                               •    How to add more calories to this snack? To obtain a bulking snack with even more calories, you can mix bananas with some high-fat snacks, like whole milk, walnuts, or ice cream, or you can mix them with a protein bar or some low-fat Greek yogurt for some additional muscle-building benefits.
""",
                               """
Fruit juice doesn’t have as many calories per 100 g as other bulking snacks but it makes up for it by being very easy to consume and affordable at the same time.
                               Therefore, fruit juice makes for a handy high-calorie drink to include as a standalone liquid snack or in combination with other foods. For example, half a liter of 100% apple juice will load you up with 230 calories and fill up your necessary daily vitamin C intake.
                               •    Calories: 46 calories / 100 g of apple juice
                               •    Macronutrients: 11 g of carbs
                               •    Micronutrients (% daily value):  64% vitamin C
                               •    How to add more calories to this snack? Whether you prefer apple, orange, or grape juice, consider combining them with other healthy high-calorie snacks, preferably with the ones rich in protein or fats, to maximize your energy intake.
""",
                               """
If you're looking for a snack to help you easily meet your daily fat intake, you can't go wrong with butter. Almost 80% of this dairy product's composition is fat.
                               •    Calories: 717 calories / 100 g
                               •    Macronutrients: 81 g of fats
                               •    Micronutrients (% daily value):  50.8% vitamin A,
                               •    How to add more calories to this snack? It's a great idea to spread butter on a slice of whole-wheat bread and add some slices of smoked pork tenderloin to make a nutritious high-calorie snack.
""",
                               """
"Besides the fact it has plenty of fats, Cheddar cheese is also a source of protein, calcium, and vitamin A. The downside is that this type of cheese has pretty much sodium as well, so consume it responsibly.
                               •    Calories: 409 calories / 100 g
                               •    Macronutrients: 23 g of protein, 2 g of carbs, and 34 g of fats
                               •    Micronutrients (% daily value):  54% calcium, 28% sodium, 25% vitamin A
                               •    How to add more calories to this snack? Cheddar cheese goes well with dried or fresh fruits, whole wheat bread or crackers, honey, and jams.
""",
                               """
            "String cheese is a very handy high-calorie snack because it can be consumed one stick at a time. Moreover, string cheese is rich in both fats and proteins while having solid amounts of calcium, sodium, and vitamin A.
                               •    Calories: 340 calories / 4 sticks (112 g)
                               •    Macronutrients: 25 g of protein, 3 g of carbs, and 25 g of fats
                               •    Micronutrients (% daily value):  44% calcium, 30% sodium, 15.2% vitamin A
                               •    How to add more calories to this snack? String cheese tastes great alongside crackers or in a salad. You can also have the strings with some tortilla chips on the side
""",
                               """
Ice cream doesn't have to be your enemy. This sweet high-calorie snack has plenty of fats and carbs that will energize you while delighting your taste buds.
                               •    Calories: 207 calories / 100 g
                               •    Macronutrients: 4 g of protein, 23.5 g of carbs, and 11.4 g of fats
                               •    Micronutrients (% daily value):  10% calcium, 8% vitamin A, 6% potassium
                               •    How to add more calories to this snack? Try eating ice cream along bananas or whole-wheat pretzels to get a higher calorie boost. Alternatively, you can sprinkle some nuts or dried fruits over the top of your ice cream.
""",
                               """
                               When you're not in the mood to fill up your stomach with solid bulking snacks, pour yourself a large glass of whole milk and boost your calorie intake.
                               •    Calories: 61 calories / 100 g
                               •    Macronutrients: 3 g of protein, 5 g of carbs, and 3 g of fats
                               •    Micronutrients (% daily value):  9% calcium
                               •    How to add more calories to this snack? You can successfully combine whole milk with whole-grain snacks, or you can make yourself a healthy high-calorie milkshake by adding a banana and some peanut butter.
""",
                               """
                               Macadamia nuts are as nutritious as fancy their name sounds. Featuring plenty of fats and iron, roasted macadamias make for a calorie-filled snack that is going to be extremely handy during the days you're far away from your necessary daily calorie intake.
                               •    Calories: 716 calories / 100 g
                               •    Macronutrients: 8 g of protein, 13 g of carbs, and 76 g of fats
                               •    Micronutrients (% daily value):  21% iron, 11% potassium, and 7% calcium
                               •    How to add more calories to this snack? Sprinkle some macadamia nuts over your ice cream and treat your taste buds with a delightful high-calorie snack.
""",
                               """
Roasted pecans are loaded with fats while featuring some protein and carbs as well. Besides, they contain healthy minerals like iron, potassium, and calcium.
                               •    Calories: 710 calories / 100 g
                               •    Macronutrients: 10 g of protein, 14 g of carbs, and 74 g of fats
                               •    Micronutrients (% daily value):  14% iron, 12% potassium, and 5% calcium
                               •    How to add more calories to this snack? Try having pecans with a glass of whole milk, butter, or a few dried apricots.
""",
                               """
            Pine nuts are a treasure of calories, offering good amounts of protein besides their almost 70 g of fats.
                               •    Calories: 673 calories / 100 g
                               •    Macronutrients: 14 g of protein, 13 g of carbs, and 68 g of fats
                               •    Micronutrients (% daily value):  31% iron, 17% potassium
                               •    How to add more calories to this snack? You can pair pine nuts with raisins to obtain a more nutritious bulking snack. Another good idea is to try having some kind of cheese along pine nuts.
"""]
            self.arrImages = []
            
        case .Dinner:
            self.lblTitle.text = "Dinner"
            self.subCategory = "Dinner"
            self.imgFoodType.image = UIImage(named: "dinner")
            self.arrName = ["Roasted turkey breast","Cooked brown rice","Cucumber salad"]
            self.arrDetails = ["""
            202 calories
            o    Amount: 150 g
            o    Protein: 45 g
            o    Fats: 1 g
""",
            """
            222 calories
            o    Amount: 200 g
            o    Protein: 5 g
            o    Carbs: 47 g
            o    Fats: 2 g
            """,
            """
            43 calories
            o    Amount: 150 g
            o    Protein: 1 g
            o    Carbs: 10 g
            """,]
            self.arrImages = []
            
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
            self.arrDetails = ["""
164 calories

o    Amount: 200 g
o    Protein: 22 g
o    Carbs: 8 g
o    Fats: 4 g
""",
            """
91 calories
o    Amount: 30 g
o    Carbs: 25 g
""",
            """
105 calories
o    Amount: 118 g (medium banana)
o    Protein: 1 g
o    Carbs: 27 g
""",
            """
142 calories
o    Amount: 2 slices (56 g)
o    Protein: 7 g
o    Carbs: 24 g
o    Fats: 2 g
"""]
            self.arrImages = ["Cottage cheese","Honey","Banana","Whole Wheat Bread"]
            
        case .PostWorkout:
            self.lblTitle.text = "Post - Workout"
            self.subCategory = "Post-workout"
            self.imgFoodType.image = UIImage(named: "muffin")
            self.arrName = ["Hard Boiled Eggs","English Muffin","Whole Milk"]
            self.arrDetails = ["""
233 calories
o    Amount: 3 large eggs (150 g)
o    Protein: 20 g
o    Carbs: 2 g
o    Fats: 17 g
""",
            """
203 calories
o    Amount: 100 g
o    Protein: 9 g
o    Carbs: 40 g
o    Fats: 2 g
""",
            """
183 calories
o    Amount: 300 ml
o    Protein: 9 g
o    Carbs: 15 g
o    Fats: 9 g
"""]
            self.arrImages = ["Hard Boiled Eggs","English Muffin","Whole Milk"]
            
        case .PreBedSnack:
            self.lblTitle.text = "Pre - Bed"
            self.subCategory = "Pre-bed"
            self.imgFoodType.image = UIImage(named: "juice")
            self.arrName = ["Full-Fat Greek Yogurt","Apple Juice"]
            self.arrDetails = ["""
194 calories
o    Amount: 200 g
o    Protein: 18 g
o    Carbs: 8 g
o    Fats: 10 g
""",
            """
138 calories
o    Amount: 300 ml
o    Carbs: 33 g
"""]
            self.arrImages = ["Full-Fat Greek Yogurt","Apple Juice"]
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
                vc.details = self.arrDetails[indexPath.row]
                vc.images = self.arrImages[indexPath.row]
                vc.category = self.category
                vc.subCategory = self.subCategory
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
