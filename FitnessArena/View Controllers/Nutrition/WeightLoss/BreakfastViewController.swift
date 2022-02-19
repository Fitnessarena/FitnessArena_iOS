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
    
    var isFromCustomsController : Bool = false

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
            self.subCategory = "Breakfast"
            self.imgFoodType.image = UIImage(named: "BF")
            self.name = ["Spinach & Egg Scramble with Raspberries","Berry-Almond Smoothie Bowl","Sriracha, Egg & Avocado Overnight Oats", "Raspberry-Peach-Mango Smoothie Bowl", "Oatmeal Almond Protein Pancakes"]
           
            self.details = ["""
                            This quick egg scramble with hearty bread is one of the best breakfasts for weight loss. It combines weight-loss power foods, eggs and raspberries, with filling whole-grain toast and nutrient-packed spinach. The protein and fiber help fill you up and the whole meal clocks in at just under 300 calories.
                            
                            Ingredients:
                            
                            1 teaspoon canola oil
                            1 ½ cups baby spinach (1 1/2 ounces)
                            2 large eggs, lightly beaten
                            Pinch of kosher salt
                            Pinch of ground pepper
                            1 slice whole-grain bread, toasted
                            ½ cup fresh raspberries
                            
                            Directions:
                            
                            Step 1:
                            Heat oil in a small nonstick skillet over medium-high heat. Add spinach and cook until wilted, stirring often, 1 to 2 minutes. Transfer the spinach to a plate. Wipe the pan clean, place over medium heat and add eggs. Cook, stirring once or twice to ensure even cooking, until just set, 1 to 2 minutes. Stir in the spinach, salt and pepper. Serve the scramble with toast and raspberries.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            2 eggs, 1 slice bread & 1/2 cup raspberries
                            
                            Per Serving:
                            296 calories; protein 17.8g; carbohydrates 20.9g; dietary fiber 7g; sugars 4.8g; fat 15.7g; saturated fat 3.7g; cholesterol 372mg; vitamin a iu 3312.6IU; vitamin c 28.1mg; folate 79.4mcg; calcium 138.8mg; iron 4.2mg; magnesium 76.1mg; potassium 292.6mg; sodium 394.2mg; thiamin 0.1mg.
                            
                            Exchanges:
                            2 medium-fat protein, 1 fat, 1/2 fruit, 1/2 starch, 1/2 vegetable
                            """,
                            
                            """
                            A little frozen banana gives creamy texture to this satisfying smoothie bowl.
                            
                            Ingredients:
                            
                            ⅔ cup frozen raspberries
                            ½ cup frozen sliced banana
                            ½ cup plain unsweetened almond milk
                            5 tablespoons sliced almonds, divided
                            ¼ teaspoon ground cinnamon
                            ⅛ teaspoon ground cardamom
                            ⅛ teaspoon vanilla extract
                            ¼ cup blueberries
                            1 tablespoon unsweetened coconut flakes
                            
                            Directions:
                            
                            Step 1
                            Blend raspberries, banana, almond milk, 3 tablespoons almonds, cinnamon, cardamom and vanilla in a blender until very smooth.

                            Step 2
                            Pour the smoothie into a bowl and top with blueberries, the remaining 2 tablespoons almonds and coconut.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            1 1/3 cups
                            
                            Per Serving:
                            360 calories; protein 9.2g; carbohydrates 45.6g; dietary fiber 14g; sugars 21.4g; fat 19g; saturated fat 3.3g; vitamin a iu 357.7IU; vitamin c 35.6mg; folate 52mcg; calcium 341mg; iron 2.5mg; magnesium 129mg; potassium 736.2mg; sodium 89.4mg.
                            
                            Exchanges:
                            2 1/2 fruit, 3 1/2 fat
                            """,
                            
                            
                            
                            """
If you love avocado toast, give this savory overnight oats recipe a try. The oats soak overnight for easy "cooking." In the morning, just top with a fried egg, avocado and Sriracha for a satisfying healthy breakfast.

Ingredients:

½ cup rolled oats (see Tip)
¾ cup water
1 tablespoon onion
¼ avocado, sliced
2 cherry tomatoes, chopped
1 large egg, fried
1 teaspoon Sriracha

Directions:

Step 1
Combine oats and water in a small bowl or jar. Cover and refrigerate overnight.

Step 2
Stir in onion and microwave in 30-second intervals, stirring occasionally, until heated through. Arrange in a bowl with avocado and tomatoes. Top with the egg and Sriracha.

Nutrition Facts:

Serving Size:
1 jar

Per Serving:
317 calories; protein 12.7g; carbohydrates 34.9g; dietary fiber 7.9g; sugars 3.8g; fat 15.2g; saturated fat 3.2g; cholesterol 186mg; vitamin a iu 626.8IU; vitamin c 10.4mg; folate 90.7mcg; calcium 65.1mg; iron 2.7mg; magnesium 67.1mg; potassium 559.7mg; sodium 141.9mg.

Exchanges:
2 starch, 1 1/2 fat, 1 medium-fat protein, 1/2 vegetable
""",
                            
                            """
This healthy smoothie recipe is a gateway to the smoothie-bowl craze. Use whatever fruit, nuts and seeds you like best to make it your own. Be sure to use frozen fruit in Step 1 to yield a creamy, frosty base for the toppings.

Ingredients:

1 cup frozen mango chunks
¾ cup nonfat plain Greek yogurt
¼ cup reduced-fat milk
1 teaspoon vanilla extract
¼ ripe peach, sliced
⅓ cup raspberries
1 tablespoon sliced almonds, toasted if desired
1 tablespoon unsweetened coconut flakes, toasted if desired
1 teaspoon chia seeds

Directions:

Step 1
Combine mango, yogurt, milk and vanilla in a blender. Puree until smooth.

Step 2
Pour the smoothie into a bowl and top with peach slices, raspberries, almonds, coconut and chia seeds to taste.

Nutrition Facts:

Serving Size:
about 2 cups

Per Serving:
352 calories; protein 23.4g; carbohydrates 46.4g; dietary fiber 8.2g; sugars 36.4g; fat 9.3g; saturated fat 3.7g; cholesterol 13.3mg; vitamin a iu 2045.7IU; vitamin c 73.5mg; folate 100.2mcg; calcium 327.5mg; iron 1.4mg; magnesium 81.9mg; potassium 796.3mg; sodium 93.7mg; thiamin 0.2mg.

Exchanges:
2 fruit, 1 fat-free milk, 1 1/2 fat
""",
                            
                            """
Depending on the type of protein powder you pick, you might need to reduce the amount of liquid in this protein pancake recipe. Whey-protein pancakes need less liquid than those made with soy, hemp or pea protein. Serve with yogurt and a DIY fruit sauce (warmed frozen berries with a pinch of sugar).

Ingredients:

½ cup unflavored protein powder
½ cup almond meal
½ cup oat flour (see Tip)
1 tablespoon sugar
1 teaspoon ground cinnamon
1 teaspoon baking powder
¼ teaspoon baking soda
¼ teaspoon salt
2 large eggs
¾ cup buttermilk
2 tablespoons canola oil
2 teaspoons vanilla extract

Directions:

Step 1
Combine protein powder, almond meal, oat flour, sugar, cinnamon, baking powder, baking soda and salt in a blender; pulse until fully mixed. Add eggs, buttermilk (reduce to 1/2 cup if using whey protein), oil and vanilla; pulse, stopping to scrape down the sides as needed, until combined. Let stand for 15 minutes.

Step 2
Coat a large nonstick skillet or griddle with cooking spray; heat over medium-high heat.

Step 3
Make about 3 pancakes at a time, using 1/4 cup batter per pancake; reduce the heat to medium. Cook until the edges are dry, 1 to 3 minutes. Flip and cook until golden brown on the other side, 1 to 3 minutes more. Repeat with the remaining batter, using more cooking spray and reducing the heat as needed. Serve warm.

Nutrition Facts:

Serving Size:
2 (3-inch) pancakes

Per Serving:
334 calories; protein 19.7g; carbohydrates 22.9g; dietary fiber 3.9g; sugars 6.2g; fat 18.6g; saturated fat 2.3g; cholesterol 94.8mg; vitamin a iu 158.5IU; vitamin c 0.5mg; folate 14.1mcg; calcium 261.1mg; iron 10mg; magnesium 56.1mg; potassium 220.4mg; sodium 595.9mg; thiamin 1.4mg; added sugar 3g.

Exchanges:
1 starch, 1 1/2 lean meat, 1/2 medium-fat meat, 3 fat

"""]
            self.images =
                
            ["Spinach & Egg Scramble with Raspberries","Berry-Almond Smoothie Bowl","Sriracha, Egg & Avocado Overnight Oats", "Raspberry-Peach-Mango Smoothie Bowl", "Oatmeal Almond Protein Pancakes"]
        
            
        case .AMSnack:
            self.lblTitle.text = "A.M. Snack"
            self.subCategory = "AMSnack"
            self.imgFoodType.image = UIImage(named: "amSnack")
            self.name = ["Popcorn","Nuts","Dark Chocolate","Dates","Grapes","Cottage Cheese","Avocado","Fresh Veggies","Hummus","Beans" ]
            self.details = ["Popcorn is a great snack for weight loss because it is low calorie, but also a great source of fiber, which can help you feel fuller longer, says Amber Pankonin, MS, RD, LMNT, registered dietitian and owner of Stirlist. This delicious pick from Angie's leaves out oils and other less-desirable ingredients.",
                            "Pankonin is a fan of nuts like walnuts, peanuts, and almonds because they are full of heart-healthy monosaturated fats and fiber",
                            "Yes, a small serving of dark chocolate can be super satisfying if you're trying to lose weight. Plus, it's loaded with energy-boosting nutrients like magnesium and iron, says Pankonin",
                            "Pankonin is a fan of dates because they are sweet, yet high in fiber as well as antioxidants.",
                            "Grapes are a great source of hydration and fiber, says Pankonin. Plus, they're naturally sweet.",
                            "Cottage cheese is a great source of protein, which can help you feel satiated, says Pankonin",
                            "Avocados are full of healthy plant-based fats and protein, which both help keep you fuller longer.",
                            "The fiber in veggies can help with bowel movements, lowering blood pressure, and your cholesterol, notes Kimberlain.",
                            "Not only does hummus have fiber, but it also has some healthy plant-based fats that will help with satiety and stabilize your blood sugar.",
                            "Beans are a great combination of plant-based protein and fiber that can help you fight cravings."]
            self.images = ["Popcorn","Nuts","Dark Chocolate","Dates","Grapes","Cottage Cheese","Avocado","Fresh Veggies","Hummus","Beans"]
        case .Lunch:
            self.lblTitle.text = "Lunch"
            self.subCategory = "Lunch"
            self.imgFoodType.image = UIImage(named: "honey")
            self.name = ["Italian Panini with Provolone, Peppers, and Arugula","Turkey BLT Salad","Artichoke-Feta Quiche","Fig, Prosciutto, & Goat Cheese Salad","Caprese Sandwich","Chicken Pot Stickers","Asian Chicken Meatballs","Portobello Cheesesteak","3-Cheese Ravioli with Cherry Tomatoes","Chicken Burgers with Sun-dried Tomato Aioli"]
            self.details = ["Keep it simple with this chicken panini recipe: A light, healthy spread like pesto, a low-calorie cheese like fresh mozz, and a layer of lean white meat chicken deliver all the same flavor and a tasty crunch for a fraction of the calories.",
                            "By turning the bread into crunchy croutons and the lettuce into the base of a salad, you minimize the refined carbs and maximize the healthiest part of the equation. Toss in a handful of cubed deli turkey to boost the protein, and suddenly you have a salad with substance and style to tuck into.",
                            "Most quiches suffer the burden of excessive amounts of heavy cream and cheese—and often a trans-fat-laden crust. This quiche dispenses with the heavy dose of dairy fat and instead gets its flavor and substance from antioxidant-dense sun-dried tomatoes, artichoke hearts, and lean chicken sausage. It's one of our easiest healthy lunch recipes you can easily meal prep for the week.",
                            "Why eat a restaurant salad if it's going to cost you the calorie intake of more than a full-sized meal? Enter our healthy fig and prosciutto salad recipe. In this version, there are a quarter of the calories! We pair strips of salty, intense prosciutto with juicy, ripe figs. Add the tang of fresh goat cheese and the subtle, earthy crunch of toasted pine nuts and this makes for one inspired salad."
                            ,"This recipe requires absolutely no effort, save for about 2 minutes of slicing and 2 minutes of toasting. Plus, it morphs easily into other dishes. Not in the mood for a sandwich? Ditch the bread and eat this as a salad for one of the easiest healthy lunch recipes you can throw together",
                            "Chicken potstickers aren't just meant to be eaten as an appetizer! Pair these potstickers with fresh vegetables and a salad, and you can easily add them to your list of healthy lunch ideas",
                            "These chicken meatballs are inspired by street-corner grills in Vietnam and Thailand, where ginger, garlic, and chiles reign supreme. With those bold flavors, plus the char of a hot charcoal grill, you won't need a fat-heavy mix of meat, or even a pile of spaghetti, to make an outstanding dinner (or lunch!) with this chicken meatballs recipe. Serve them with steamed rice, cucumbers, maybe a bit of sauce, and big lettuce leaves for wrapping",
                            "Unlike so many vegetarian dishes out there masquerading as healthier than the meaty creations they replace (yes, we're looking at you, 1,490-calorie mushroom burger from The Cheesecake Factory), you could eat this cheesesteak seven days a week and end up skinnier than when you started. And trust us, you won't even have to be a vegetarian to enjoy it!",
                            "Here, in this ravioli recipe, you get the depth and nuance of creamy ricotta, smoky mozzarella, and salty, sharp Parmesan, plus a sauce that would make anything taste great for just 510 calories",
                            "Yes, burgers are one of the easiest healthy lunch recipes you can make for yourself. It just depends on what you serve with it! We've gone ahead and helped you out by reinventing the chicken burger, using a lean grind of meat and a hugely flavorful—but surprisingly low-calorie—spiked mayo to deliver on the promise of a truly healthy burger you can happily indulge in."]
            self.images = ["Italian Panini with Provolone, Peppers, and Arugula","Turkey BLT Salad","Artichoke-Feta Quiche","Fig, Prosciutto, & Goat Cheese Salad","Caprese Sandwich","Chicken Pot Stickers","Asian Chicken Meatballs","Portobello Cheesesteak","3-Cheese Ravioli with Cherry Tomatoes","Chicken Burgers with Sun-dried Tomato Aioli"]
        case .PMSnack:
            self.lblTitle.text = "P.M. Snack"
            self.subCategory = "PMSnack"
            self.imgFoodType.image = UIImage(named: "pmSnack")
            self.name = ["White Beans And Olive Tapenade","Protein Cookie Dough","Dates And Pistachios","Almond Joy Protein Balls","Edamame with sea salt","Baked Kale Chips","PB-Chocolate Apple 'Nachos'","Chocolate-Covered Banana Pops","Microwave Egg Taco","Roasted Chickpeas"]
            
            self.details = ["It’s a great combo of fiber, fat, protein, and resistant starch that'll keep you full and satisfied.” Tolbert eats it by the spoonful, but you can also scoop it up with a few whole-grain pita chips or cucumber slices.",
                            "Maybe the thought of faux-cookie dough (made with chickpeas, vanilla protein powder, and almond butter) doesn’t appeal to you...but maybe you’ve never actually tried it. I mean, when it comes to healthy cookie dough or nocookie dough, we’ll take the healthy kind, thanksverymuch",
                            "It's the usual fruit and nuts combo, but a little more sophisticated,” says Tolbert. Dates have a honey-like sweetness, which combines with the strong flavor of pistachios into a snack that feels like dessert.",
                            "It’s almost impossible to avoid the candy bowl at the office around 3 p.m. every day—unless you’ve got one or two of these Almond Joy-flavored bites sitting in the fridge calling your name. Indulge without spoiling your appetite for later.",
                            "Plotkin loves sprinkling edamame, in its shell or out, with a bit of sea salt. In addition to plant-based protein, you get fiber and a good dose of potassium.",
                            "If you’ve got a savory tooth, it’s tough to pass up chips or crackers at snack time. Roasting kale chips is a great way to get that salty crunch without all the grease",
                            "You'll get protein and lots of fiber, which will help slow the digestion of the little bit of added sugar from dark chocolate ",
                            "Something about eating food on a stick just makes it more fun—especially when that food is covered in chocolate and tastes like it should have way more calories than it does.",
                            "Get creative with your microwave and make a tasty snack with enough protein to carry you to your next meal. Make it: “Crack one egg into a microwave-safe mug and cook for 90 seconds,” says Plotkin. Immediately stir in 1/2 ounce shredded cheddar, then serve inside a small whole-wheat tortilla. Per serving: 182 calories, 10 g fat (5 g saturated), 11 g carbs, 1 g sugar, 360 mg sodium, 3 g fiber, 11 g protein",
                            "If you're craving something salty and crunchy, roasted beans are a much better option than chips thanks to their combo of protein and fiber."]
            self.images = ["White Beans And Olive Tapenade","Protein Cookie Dough","Dates And Pistachios","Almond Joy Protein Balls","Edamame with sea salt","Baked Kale Chips","PB-Chocolate Apple 'Nachos'","Chocolate-Covered Banana Pops","Microwave Egg Taco","Roasted Chickpeas"]
        case .Dinner:
            self.lblTitle.text = "Dinner"
            self.subCategory = "Dinner"
            self.imgFoodType.image = UIImage(named: "dinner")
            self.name = ["Crispy Cod with Sweet Potato Fries","Sheet-Pan Italian Pork Chops","Butter-Baked Salmon and Asparagus","Seared Ginger-Cumin Swordfish With Blueberry-Avocado Salsa","Zucchini Noodles with Bacon Vinaigrette","Pesto Chicken","Warm Kale-Quinoa Salad","Garam Masala Chicken Skewers","Avocado Soup","One Pot Lemon Herb Chicken and Rice"]
            self.details = ["If you're looking to take an average fish and chips dinner to the next level, this recipe is sure to do the trick. This flaky, delicious white fish is made in the oven instead of deep fried, so it's healthy and quick.",
                            "Not only do you get a well-rounded meal with the meat and veggies in this recipe, but these pork chops can be prepped and in the oven in minutes",
                            "Even though this is the ultimate no-frills recipe, it doesn't look it when it comes out of the oven. All you have to do is trim the asparagus and melt the butter before letting your oven do the rest",
                            "This swordfish is taken to the next-level with this blueberry-avocado salsa. It takes less than 5 minutes to prep and the dynamic flavors give a whole new identity to the swordfish underneath.",
                            "If you're looking for a breakfast-for-dinner type of deal, this zoodles recipe is the one for you. It takes nearly no time to make and brings in the bacon and egg flavors that pasta carbonara has, but with a zucchini noodle twist.",
                            "This one-pan recipe is easy to make and packed with flavor. Chicken is your best friend when it comes to cooking up something light in no time, and can really wear a thousand different (flavor) hats.",
                            "Three superfoods, zesty flavors, and crunch to boot—what else could you possibly want in a salad. The fact that it comes together in under 30 minutes is an added bonus, so you can practice self-care on busy weeknights, too.",
                            "This chicken on a stick recipe was dreamt up as a healthy appetizer, but how easy would be to throw a side of crunchy steamed veggies in the mix, or a nice overn-roasted brussels sprouts, and call it a delicious dinner? Garam masala will become your favorite flavor-carrier, especially after you dip these puppies in the punchy jalapeno-yogurt sauce for contrast.",
                            "Soup for dinner often seems impossible because we have this notion of soups that sit and simmer on the stove for hours. But throw that silly stereotype to the wind a whip up this uber-healthy soup packed with good fat in just under 30 minutes. Don't let the ingredient list scare you, this is a very simple chilled soup. Take the spice suggestions as a starting point and use whatever spices you have in your cabinet.",
                            "Seven ingredients, one large skillet, and 30 minutes are all you'll need to make this delicious protein-filled meal. To amp up the fiber count and boost your dinner's satiety factor, add some chopped broccoli or brussels sprouts to the mix."]
            self.images = ["Crispy Cod with Sweet Potato Fries","Sheet-Pan Italian Pork Chops","Butter-Baked Salmon and Asparagus","Seared Ginger-Cumin Swordfish With Blueberry-Avocado Salsa","Zucchini Noodles with Bacon Vinaigrette","Pesto Chicken","Warm Kale-Quinoa Salad","Garam Masala Chicken Skewers","Avocado Soup","One Pot Lemon Herb Chicken and Rice"]
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
            vc.isFromCustomsController = self.isFromCustomsController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
