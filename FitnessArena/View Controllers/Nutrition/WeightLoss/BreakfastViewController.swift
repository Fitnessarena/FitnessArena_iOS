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
            self.name = ["Organic Protein Powder","Wild Salmon","Eggs", "Almond Butter", "Ground Turkey","All Nature Peanut Butter","Black Beans","Chicken Breast","Nitrate-Free Canadian Bacon","Avocados"]
           
            self.details = ["Protein, 2 scoops: 34–48 g The American Society of Nutrition states that having a breakfast that is high in protein will not only benefit muscle health and support weight loss, but will also leave you feeling satiated and help with glucose regulation. Protein powder is the most versatile and nutrient-dense source of the musclebuilder nutrient, earning it a top spot on our list. Use it to make a high-protein smoothie, add it to oatmeal to amp up the protein count, use it to make a homemade nutrition bar, mix it into pancake mix—the options are truly endless. Want to grab a tub? Luckily, we tested 10 protein powders and found the best one!",
                            "Protein, per 3 oz: 17 g The healthy dose of protein and omega-3 healthy fats found in salmon will keep you satisfied and energized all morning long. I love smoked salmon and smashed avocado on wholegrain toast, or reheating leftovers of grilled salmon and vegetables for a quick, superfoods-packed start to the day. Just make sure you avoid the farmed variety if weight loss is your goal. For more weight loss tips, don't miss these best-ever ways to boost your metabolism.",
                            "Eggs are an excellent source of protein and other healthy nutrients including fat-burning choline. Choline, also found in lean meats, seafood, and collard greens attack the gene mechanism that triggers your body to store fat around your liver.",
                            "Protein, per 2 tablespoons: 7–8 g Almond butter is high in protein, fiber, antioxidants, and monounsaturated fats. Studies have also shown that people who eat nuts are less likely to become overweight than those who avoid them, likely because it helps you feel fuller, longer. To reap the benefits at breakfast, McKittrick suggests spreading some nut butter on wholegrain toast or adding a tablespoon to oatmeal or smoothies.", "Protein, per 4 oz: 22 g If you want to amp up your morning dose of protein, consider adding ground turkey (along with some onions, bell peppers, and mushrooms) to your eggs. The combination is quite tasty and somewhat unexpected, making it a perfect choice for fatigued taste buds. Bonus: The meat is a prime source of DHA omega 3 fatty acids, which have been shown to improve brain function and mood and prevent fat cells from growing, according to a study published by Frontiers in Aging Neuroscience.",
                            "Protein, per 2 tablespoons: 7–8 g While processed peanut butter is filled with sugar and waist-widening oils, the real stuff is made with just two ingredients: peanuts and salt. This legume is filled with heart-healthy monounsaturated fats and genistein, a compound that downregulates fat genes. Nutritionist and personal trainer Kristin Reisinger, MS, RD, CSSD,  suggests using the healthy fat in an a.m. smoothie. Take 1 cup of unsweetened almond milk and blend it with 1 scoop of your favorite protein powder, 1/2 banana, and 1 tablespoon of peanut butter. This drink is a simple way to start the day with a perfect balance of healthy fats, protein, and carbohydrates to replenish glycogen stores and promote muscle growth, without an overabundance of calories for those seeking weight loss.",
                            "Protein, per ½ cup: 7 g Packed with soluble fiber—a powerful belly fat fighter—beans will not only fill you up for hours but also help slim you down. Wake Forest Baptist Medical Center researchers found that for every 10-gram increase in soluble fiber consumed daily, study participants' belly fat reduced by 3.7 percent over five years. To eat the magical fruit for breakfast, make a Southwestern-inspired omelet filled with black beans, salsa, and non-dairy cheese.",
                            "Protein, per 4 oz: 19 g Chicken may not be your average breakfast food, but maybe it should be. Some mornings, yogurt or eggs just won't cut it. To spice up my breakfast, I'll pull out some leftover dinner, which often contains plenty of fiber-rich veggies and hunger-slashing lean protein. This perfect combination of nutrients keeps me full and energized for hours. And for a list of the purest proteins, don't miss these best proteins for weight loss!",
                            "Protein, 3 strips: 18 g Many brands of bacon contain sodium nitrate and nitrite to keep the meat free from harmful bacteria. Under certain conditions, sodium nitrite and nitrate react with amino acids to form cancer-causing chemicals called nitrosamines. And sodium nitrate has been shown to interfere with the body's natural ability to process sugar. According to the Mayo Clinic, sodium nitrate has been proven to increase the risk of heart disease as well. However, if you stick with the right variety, bacon can be a healthy, slimming part of your morning meal. Go with Canadian.",
                            "Sugar, per 1⁄4 fruit: 0.33 g Fiber, per 1⁄4 fruit: 3.5 g Avocados—one of the best weight-loss foods on the planet—contain nearly 20 vitamins and minerals in every serving, says McKittrick, including oleic fatty acids, which have been shown to reduce abdominal fat. Avocados are also a good source of fiber and fat. Use the green fruit to make avocado toast or bake an egg in half of an avocado."]
            self.images =
                
                ["Organic Protein Powder","Wild Salmon","Eggs", "Almond Butter", "Ground Turkey","All Nature Peanut Butter","Black Beans","Chicken Breast","Nitrate-Free Canadian Bacon","Avocados"]
        
            
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
