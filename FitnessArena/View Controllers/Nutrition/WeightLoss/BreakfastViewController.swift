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
            self.name = ["Tequila Guacamole","Air-Fryer Crispy Chickpeas","Easy Black Bean Dip","Pistachio & Peach Toast","Tomato, Peach & Feta Salad"]
            
            self.details = ["""
Margarita lovers will go crazy for this twist on classic guacamole. Spiking your guacamole with tequila adds an extra layer of flavor and blends deliciously with the fresh lime juice and jalapeño. This guacamole is for grown-ups only, but you can omit the tequila if you're serving to kids.

Ingredients:
 
¼ cup finely chopped white onion
3 tablespoons finely chopped jalapeño, seeds removed
¼ cup chopped tomato, seeds removed
1 tablespoon fresh lime juice
1 tablespoon silver tequila
⅜ teaspoon kosher salt
2 medium avocados
Tortilla chips for serving

Directions:
Step 1
Combine onion, jalapeño, tomato, lime juice, tequila and salt in a medium bowl.

Step 2
Add avocados and mash with a fork or potato masher to the desired consistency. Serve with tortilla chips.

Nutrition Facts:

Serving Size:
1/4 cup

Per Serving:
118 calories; protein 1.5g; carbohydrates 7g; dietary fiber 4.8g; sugars 1.1g; fat 9.9g; saturated fat 1.4g; vitamin a iu 192IU; vitamin c 12.3mg; folate 57.7mcg; calcium 11mg; iron 0.4mg; magnesium 21.5mg; potassium 362.4mg; sodium 125.5mg; thiamin 0.1mg.

Exchanges:
2 fat, 1/2 vegetable
""",
                            
                            """
Air-fried chickpea snacks are intensely flavored and incredibly crunchy. Drying the chickpeas is essential to a good crunch, so don't skip this step. If you have time, leave them out on the counter to dry for an hour or two before frying.

Ingredients:
 
1 (15 ounce) can unsalted chickpeas, rinsed and drained
1 ½ tablespoons toasted sesame oil
¼ teaspoon smoked paprika
¼ teaspoon crushed red pepper
⅛ teaspoon salt
Cooking spray
2 lime wedges

Directions
Step 1
Spread chickpeas on several layers of paper towels. Top with more paper towels and pat until very dry, rolling the chickpeas under the paper towels to dry all sides.

Step 2
Combine the chickpeas and oil in a medium bowl. Sprinkle with paprika, crushed red pepper and salt. Pour into an air fryer basket and coat with cooking spray. Cook at 400 degrees F until very well browned, 12 to 14 minutes, shaking the basket occasionally. Squeeze lime wedges over the chickpeas and serve.

Nutrition Facts:

Serving Size:
1/4 cup

Per Serving:
132 calories; protein 4.7g; carbohydrates 14.1g; dietary fiber 3.4g; fat 5.8g; saturated fat 0.7g; vitamin a iu 117.6IU; vitamin c 0.1mg; folate 0.2mcg; calcium 40.4mg; iron 1mg; magnesium 27mg; potassium 151.9mg; sodium 85.8mg.

Exchanges:
1 fat, 1 starch, 1/2 lean protein
""",
                            
                            """
This creamy bean dip is great for a party or picnic. Smoked paprika and ground chipotles add a robust, earthy flavor, but you can also use regular paprika and cayenne if you don't have the other spices on hand.

Ingredients:
 
1 (15 ounce) can low-sodium black beans, rinsed
¼ cup low-fat plain Greek yogurt
2 teaspoons lime juice (from 1 lime)
½ teaspoon ground cumin
½ teaspoon dried oregano
½ teaspoon garlic powder
¼ teaspoon paprika, preferably smoked
¼ teaspoon salt
¼ teaspoon ground pepper
¼ teaspoon cayenne pepper or ground chipotle chile (Optional)
2 teaspoons olive oil
¼ cup chopped fresh cilantro or scallions
¼ cup chopped onion

Directions:

Step 1
Place beans, yogurt, lime juice, cumin, oregano, garlic powder, paprika, salt and pepper in a food processor or blender. Process until well combined, about 20 seconds. For a spicier dip, add cayenne (or ground chipotle) to taste, up to 1/4 teaspoon. Add oil, cilantro (or scallions) and onion. Pulse until well mixed, about 20 seconds. Transfer to a bowl to serve.

Nutrition Facts:

Serving Size:
1/3 cup

Per Serving:
129 calories; protein 7.4g; carbohydrates 17.1g; dietary fiber 5.4g; sugars 1g; fat 3.4g; saturated fat 0.5g; cholesterol 1.4mg; vitamin a iu 168.3IU; vitamin c 1.9mg; folate 5.2mcg; calcium 75.3mg; iron 1.7mg; magnesium 53.2mg; potassium 281.1mg; sodium 210.4mg.
""",
                            
                            """
This breakfast is great when you have leftover ricotta cheese--plus it comes together in just 5 minutes.

Ingredients:
 
1 tablespoon part-skim ricotta cheese
1 teaspoon honey, divided
⅛ teaspoon cinnamon
1 slice 100% whole-wheat bread, toasted
½ medium peach, sliced
1 tablespoon chopped pistachios

Directions:

Step 1
Combine ricotta, ½ teaspoon honey and cinnamon in a small bowl.

Step 2
Spread the ricotta mixture on toast and top with peach and pistachios. Drizzle with the remaining 1/2 teaspoon honey.

Nutrition Facts:

Serving Size:
1 toast

Per Serving:
193 calories; protein 8.2g; carbohydrates 29g; dietary fiber 3.9g; sugars 13.9g; fat 6g; saturated fat 1.4g; cholesterol 4.8mg; vitamin a iu 326.4IU; vitamin c 5.2mg; folate 22.1mcg; calcium 91.1mg; iron 1.4mg; magnesium 42.5mg; potassium 325.8mg; sodium 157.4mg; added sugar 5.8g.
""",
            """
This juicy salad is the perfect snack in the height of summer when tomatoes and peaches are at their best.

Ingredients:
 
1 tablespoon lime juice
½ teaspoon honey
Pinch of salt
1 large tomato, diced
½ cup diced peach
2 tablespoons chopped unsalted dry-roasted pistachios
1 tablespoon crumbled feta cheese

Directions:

Step 1
Whisk lime juice, honey and salt in a small bowl. Add tomato, peach, pistachios and feta and toss to coat.

Nutrition Facts:

Serving Size:
2 1/2 cups

Per Serving:
189 calories; fat 10g; cholesterol 8mg; sodium 242mg; carbohydrates 23g; dietary fiber 5g; protein 7g; sugars 16g; niacin equivalents 2mg; saturated fat 2g; vitamin a iu 1849IU; potassium 754mg.
"""]
                            
                            
            self.images = ["Tequila Guacamole","Air-Fryer Crispy Chickpeas","Easy Black Bean Dip","Pistachio & Peach Toast","Tomato, Peach & Feta Salad"]
        case .Lunch:
            self.lblTitle.text = "Lunch"
            self.subCategory = "Lunch"
            self.imgFoodType.image = UIImage(named: "honey")
            self.name = ["Salmon-Stuffed Avocados", "Green Goddess Salad with Chickpeas","Grilled Blackened Shrimp Tacos","Avocado Egg Salad Sandwiches","Kale Turkey Wraps"]
            
            
            self.details = ["""
                            Canned salmon is a valuable pantry staple and a practical way to include heart-healthy omega-3-rich fish in your diet. Here, we combine it with avocados in an easy no-cook meal.

Ingredients:

½ cup nonfat plain Greek yogurt
½ cup diced celery
2 tablespoons chopped fresh parsley
1 tablespoon lime juice
2 teaspoons mayonnaise
1 teaspoon Dijon mustard
⅛ teaspoon salt
⅛ teaspoon ground pepper
2 (5 ounce) cans salmon, drained, flaked, skin and bones removed
2 avocados
Chopped chives for garnish

Directions

Step 1
Combine yogurt, celery, parsley, lime juice, mayonnaise, mustard, salt, and pepper in a medium bowl; mix well. Add salmon and mix well.

Step 2
Halve avocados lengthwise and remove pits. Scoop about 1 tablespoon flesh from each avocado half into a small bowl. Mash the scooped-out avocado flesh with a fork and stir into the salmon mixture.

Step 3
Fill each avocado half with about 1/4 cup of the salmon mixture, mounding it on top of the avocado halves. Garnish with chives, if desired.

Nutrition Facts

Serving Size:
1/2 avocado and 1/4 cup salmon salad

Per Serving:
293 calories; protein 22.5g; carbohydrates 10.5g; dietary fiber 7g; sugars 1.8g; fat 19.6g; saturated fat 3g; cholesterol 61.2mg; vitamin a iu 413IU; vitamin c 14.1mg; folate 94.1mcg; calcium 94.2mg; iron 1.1mg; magnesium 52mg; potassium 807.2mg; sodium 399.8mg.
""",
                            
                            """
                            In this cucumber, tomato, Swiss cheese and chickpea salad recipe, a healthy green goddess dressing is made from avocado, buttermilk and herbs. The extra dressing is delicious served with grilled vegetables.
                            
                            Ingredients
                            
                            Dressing
                            1 avocado, peeled and pitted
                            1 ½ cups buttermilk
                            ¼ cup chopped fresh herbs, such as tarragon, sorrel, mint, parsley and/or cilantro
                            2 tablespoons rice vinegar
                            ½ teaspoon salt
                            
                            Salad
                            
                            3 cups chopped romaine lettuce
                            1 cup sliced cucumber
                            1 (15 ounce) can chickpeas, rinsed
                            ¼ cup diced low-fat Swiss cheese
                            6 cherry tomatoes, halved if desired
                            
                            Directions
                            
                            Step 1
                            To prepare dressing: Place avocado, buttermilk, herbs, vinegar and salt in a blender. Puree until smooth.

                            Step 2
                            To prepare salad: Toss lettuce and cucumber in a bowl with 1/4 cup of the dressing. Top with chickpeas, cheese and tomatoes. (Refrigerate the extra dressing for up to 3 days.)
                            
Nutrition Facts

Serving Size:
2 3/4 cups

Per Serving:
304 calories; protein 21.7g; carbohydrates 39.8g; dietary fiber 11.9g; sugars 10.1g; fat 7.5g; saturated fat 1.7g; cholesterol 12mg; vitamin a iu 6774.1IU; vitamin c 14mg; folate 180.9mcg; calcium 420mg; iron 2.5mg; magnesium 71.8mg; potassium 641.4mg; sodium 465mg.

Exchanges:
2 starch, 1 high-fat protein, 1 lean protein, 1 vegetable, 1/2 fat
""",
                            
                            """
            Give juicy shrimp tacos a Cajun flavor spin with spices and a quick sear on a hot grill. An easy avocado mash adds creaminess to cool off the spicy kick.
            
            Ingredients:
            
            1 ripe avocado
            1 tablespoon lime juice
            1 small clove garlic, grated
            ¼ teaspoon salt
            1 pound large raw shrimp (16-20 count), peeled and deveined
            2 tablespoons salt-free Cajun spice blend
            8 corn tortillas, warmed
            2 cups iceberg lettuce, chopped
            ½ cup fresh cilantro leaves
            ½ cup prepared pico de gallo
            
            Directions
            
            Step 1
            Preheat grill to medium-high.

            Step 2
            Mash avocado with a fork in a small bowl. Add lime juice, garlic and salt and stir to combine.

            Step 3
            Pat shrimp dry. Toss the shrimp with Cajun seasoning in a medium bowl. Thread onto four 10- to 12-inch metal skewers. Grill, turning once, until the shrimp are just cooked through, about 4 minutes total.

            Step 4
            Serve the shrimp in tortillas, topped with the guacamole, lettuce, cilantro and pico de gallo.
            
            Nutrition Facts
            
            Serving Size:
            2 tacos
            
            Per Serving:
            286 calories; protein 24g; carbohydrates 30.4g; dietary fiber 6.9g; sugars 3.5g; fat 9.3g; saturated fat 1.4g; cholesterol 158.8mg; vitamin a iu 492.1IU; vitamin c 9.2mg; folate 55.2mcg; calcium 117.8mg; iron 1.6mg; magnesium 87.2mg; potassium 662.1mg; sodium 442.7mg; thiamin 0.1mg.
            
            Exchanges:
            2 lean protein, 1 1/2 fat, 1 1/2 starch, 1 vegetable
            """,
                            
                            
                            """
            Lighten up classic egg salad by swapping in creamy avocado instead of using mayonnaise. Sandwich it between toasted whole-wheat bread and you've got an easy, packable lunch ready for work or school.
            
            Ingredients:
            
            ½ ripe avocado
            1 ½ teaspoons lemon juice
            1 teaspoon avocado oil
            3 hard-boiled eggs, chopped
            ¼ cup finely chopped celery (about 1 stalk)
            1 tablespoon snipped fresh chives
            ¼ teaspoon salt
            ⅛ teaspoon ground pepper
            4 slices whole-wheat sandwich bread, toasted
            2 leaves lettuce
            
            Directions
            
            Step 1
            Scoop the flesh from the avocado half into a medium bowl. Add lemon juice and oil; mash until mostly smooth. Add chopped eggs, celery, chives, salt and pepper and stir to combine. Divide the mixture between 2 slices of toast. Top each with a piece of lettuce and another slice of toast.
            
            Nutrition Facts
            
            Serving Size:
            1 sandwich
            
            Per Serving:
            351 calories; protein 16.6g; carbohydrates 30.2g; dietary fiber 7.3g; sugars 4g; fat 18.8g; saturated fat 3.9g; cholesterol 246.2mg; vitamin a iu 1760.6IU; vitamin c 8.3mg; folate 119.2mcg; calcium 141.3mg; iron 2.7mg; magnesium 67.6mg; potassium 546.8mg; sodium 642.2mg; thiamin 0.3mg; added sugar 3g.
            
            Exchanges:
            2 fat, 1 1/2 medium-fat protein, 1 1/2 starch, 1/2 vegetable
            
            """,
                            
                            
                            """
            Using kale leaves instead of bread to wrap your filling makes this healthy turkey lunch recipe low-calorie. If you can't find lacinato, also known as Tuscan kale, try cabbage for your wrap.
            
            Ingredients:
            
            1 tablespoon cranberry sauce
            1 teaspoon Dijon mustard
            3 medium lacinato kale leaves
            3 slices deli turkey (about 3 ounces)
            6 thin red onion slices
            1 firm ripe pear, cut into 9 slices
            
            Directions
            
            Step 1
            Mix cranberry sauce and mustard in a small bowl. Spread on kale leaves. Top each leaf with a slice of turkey, 2 slices red onion and 3 slices pear. Roll each leaf into a wrap. Cut each wrap in half, if desired.
            
            Nutrition Facts
            
            Serving Size:
            3 wraps
            
            Per Serving:
            293 calories; protein 27.8g; carbohydrates 42.6g; dietary fiber 7.2g; sugars 26.2g; fat 2.1g; saturated fat 0.6g; cholesterol 68mg; vitamin a iu 4435.3IU; vitamin c 46.4mg; folate 31.4mcg; calcium 82mg; iron 1.5mg; magnesium 45.6mg; potassium 511.6mg; sodium 225.2mg; thiamin 0.1mg; added sugar 6g.
            
            Exchanges:
            1 1/2 vegetable, 1 1/2 fruit, 1/2 other carbohydrate, 3 lean meat
            """]
            
            
            self.images = ["Salmon-Stuffed Avocados", "Green Goddess Salad with Chickpeas","Grilled Blackened Shrimp Tacos","Avocado Egg Salad Sandwiches","Kale Turkey Wraps"]
     
        
        case .PMSnack:
            self.lblTitle.text = "P.M. Snack"
            self.subCategory = "PMSnack"
            self.imgFoodType.image = UIImage(named: "pmSnack")
            self.name = ["Cauliflower Hummus","Spicy Tomato & Seaweed Salad","Pizza Pistachios","Black Bean Hummus","Creamy Apple Salad"]
            
            self.details = ["""
                            Is there anything cauliflower can't do? This versatile ingredient subs for chickpeas in a lightened-up version of hummus that's just as flavorful and zingy as the original.
                            
                            Ingredients:
                            
                            6 cups cauliflower florets (about 1 pound)
                            1 tablespoon extra-virgin olive oil, plus more for garnish
                            1 large garlic clove, roughly chopped
                            ¼ cup tahini
                            Zest of 1 lemon
                            2 tablespoons lemon juice
                            ½ teaspoon kosher salt
                            ½ teaspoon ground cumin
                            ½ teaspoon crushed red pepper
                            2 tablespoons water
                            Chopped red bell pepper for garnish
                            
                            Directions:
                            
                            Step 1
                            Preheat oven to 400°F and line a baking sheet with parchment paper or a silicone mat. Toss cauliflower with oil in a large bowl. Spread in a single layer on the prepared baking sheet. Roast until tender and just starting to brown, 20 to 25 minutes. Let cool to room temperature.

                            Step 2
                            Add the cauliflower, garlic, tahini, lemon zest, lemon juice, salt, cumin, crushed red pepper and water to a food processor. Process until combined, scraping down the sides of the bowl as needed. Add more water, if desired, to make a looser dip.

                            Step 3
                            Transfer to a bowl. Drizzle with additional olive oil and sprinkle with chopped pepper, if desired.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            about 1/2 cup
                            
                            Per Serving:
                            152 calories; fat 12g; sodium 280mg; carbohydrates 10g; dietary fiber 3g; protein 5g; sugars 3g; niacin equivalents 2mg; saturated fat 2g; vitamin a iu 106IU; potassium 426mg.
                            """,
                            
                            
                            """
                            Adjust the heat in this spicy tomato salad by using a milder pepper or just using a little less of a hot one. Sesame oil, tamari and seaweed add lots of umami and nutty flavor to a fresh tomato.
                            
                            Ingredients:
                            
                            1 large tomato, diced
                            1 serrano pepper or Thai chile, thinly sliced
                            1 teaspoon 50%-less-sodium tamari
                            ½ teaspoon sesame oil
                            1 sheet nori, torn
                            2 tablespoons crunchy chow mein noodles
                            
                            Directions:
                            
                            Step 1
                            Toss tomato and serrano (or chile) with tamari and sesame oil. Sprinkle with nori and noodles.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            2 cups
                            
                            Per Serving:
                            92 calories; fat 4g; sodium 256mg; carbohydrates 13g; dietary fiber 3g; protein 3g; sugars 5g; niacin equivalents 2mg; saturated fat 1g; vitamin a iu 1709IU; potassium 468mg.
                            """,
                            
                            
                            """
                            Nutritional yeast mimics the flavor of cheese, lending a pizza-like flavor to these playful spiced pistachios.
                            
                            Ingredients:
                            
                            1 large egg white
                            3 tablespoons nutritional yeast
                            1 tablespoon Italian seasoning
                            1 ¾ teaspoons salt
                            3 cups shelled unsalted pistachios
                            
                            Directions:
                            
                            Step 1
                            Preheat oven to 250°F.

                            Step 2
                            Whisk egg white, nutritional yeast, Italian seasoning and salt in a medium bowl. Add pistachios and toss to coat. Spread in an even layer on a large rimmed baking sheet.

                            Step 3
                            Bake, stirring every 15 minutes, until dry, about 45 minutes. Let cool completely before storing, about 30 minutes.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            ¼ cup
                            
                            Per Serving:
                            177 calories; fat 14g; sodium 346mg; carbohydrates 10g; dietary fiber 3g; protein 7g; sugars 2g; saturated fat 2g.
                            """,
                            
                            
                            """
                            For a slightly Southwestern spin on hummus, swap in black beans for the traditional chickpeas. It's just as fiber-rich and filling, but with a taste that pairs well with tortilla chips and crisp bell peppers.
                            
                            Ingredients:
                            
                            1 (15 ounce) can black beans, rinsed
                            1 large garlic clove, roughly chopped
                            2 tablespoons tahini
                            2 tablespoons lime juice, plus lime wedges for garnish
                            ½ teaspoon kosher salt
                            ½ teaspoon ground cumin
                            ½ teaspoon ground coriander
                            2 tablespoons water
                            Sliced scallions for garnish
                            
                            Directions:
                            
                            Step 1
                            Add beans, garlic, tahini, lime juice, salt, cumin, coriander and water to a food processor. Process until combined, scraping down the sides of the bowl as needed. Add more water, if desired, to make a looser dip.

                            Step 2
                            Transfer to a bowl and garnish with scallions and lime wedges, if desired.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            about 1/4 cup
                            
                            Per Serving:
                            96 calories; fat 3g; sodium 259mg; carbohydrates 13g; dietary fiber 5g; protein 5g; niacin equivalents 1mg; vitamin a iu 9IU; potassium 247mg.
                            """,
                            
                            """
                            This creamy apple salad is crunchy, sweet and just a tad bit tart thanks to dried cranberries. Make this easy salad ahead for your next lunch, brunch or picnic.
                            
                            Ingredients:
                            
                            ¼ cup mayonnaise
                            2 tablespoons sour cream
                            1 ½ tablespoons honey
                            1 ½ tablespoons lemon juice
                            2 teaspoons Dijon mustard
                            ½ teaspoon salt
                            2 medium Gala apples, cut into 1/2- to 1-inch pieces
                            1 medium Golden Delicious apple, cut into 1/2- to 1-inch pieces
                            1 cup seedless red grapes, halved
                            1 cup thinly sliced red cabbage
                            1 cup  thinly sliced celery
                            ½ cup dried cranberries
                            ⅓ cup toasted chopped walnuts
                            
                            Directions:
                            
                            Step 1
                            Whisk mayonnaise, sour cream, honey, lemon juice, mustard and salt together in a large bowl. Gently stir in apples, grapes, cabbage, celery, dried cranberries and walnuts. Cover and refrigerate for at least 1 hour. Toss well before serving.
                            
                            Nutrition Facts:
                            
                            Serving Size:
                            1 cup
                            
                            Per Serving:
                            171 calories; fat 9g; cholesterol 5mg; sodium 234mg; carbohydrates 27g; dietary fiber 3g; protein 2g; sugars 22g; saturated fat 1g; vitamin a iu 210IU; potassium 164mg.
                            """]
            self.images = ["Cauliflower Hummus","Spicy Tomato & Seaweed Salad","Pizza Pistachios","Black Bean Hummus","Creamy Apple Salad"]
        case .Dinner:
            self.lblTitle.text = "Dinner"
            self.subCategory = "Dinner"
            self.imgFoodType.image = UIImage(named: "dinner")
            
            self.name = ["Turkey Pumpkin Chili","Stuffed Pepper Soup","Winter Vegetable Mulligatawny Soup","White Bean & Sun-Dried Tomato Gnocchi","Chicken & Mushroom Ragu"]
            
            self.details = [
                """
Canned pumpkin adds mellow background flavor and works to thicken up this turkey pumpkin chili. Smoked paprika adds flavor with a hint of spice. This chili is on the thicker side—if you want it thinner, add a bit more water.

Ingredients:

1 tablespoon extra-virgin olive oil
1 medium yellow onion, chopped
1 small green bell pepper, chopped
3 cloves garlic, minced
1 pound ground turkey
1 (14.5 ounce) can fire-roasted diced tomatoes, undrained
1 (15 ounce) can no-salt-added black beans, rinsed
1 (15 ounce) can unseasoned pumpkin puree
1 ½ cups water
1 tablespoon chili powder
1 ½ teaspoons ground cumin
1 teaspoon smoked paprika
¼ teaspoon ground pepper
⅛ teaspoon salt
2 cups packed chopped curly kale leaves
4 tablespoons sour cream
Chopped fresh cilantro for garnish

Directions

Step 1
Heat oil in a large saucepan over medium-high heat. Add onion, bell pepper and garlic. Cook, stirring often, until the vegetables are just tender, about 5 minutes. Add turkey and cook, stirring often, until browned, about 5 minutes. Stir in tomatoes, beans, pumpkin, water, chili powder, cumin, smoked paprika, pepper and salt. Bring to a boil over medium-high heat, stirring occasionally. Reduce heat to low; cover and simmer, stirring occasionally, until the flavors meld, about 20 minutes, adding kale during the last 5 minutes of cooking. Ladle into 4 bowls; top each with 1 tablespoon sour cream. Garnish with cilantro, if desired.

Nutrition Facts

Serving Size:
1 3/4 cups

Per Serving:
414 calories; fat 17g; cholesterol 91mg; sodium 467mg; carbohydrates 36g; dietary fiber 11g; protein 31g; sugars 9g; niacin equivalents 7mg; saturated fat 4g; vitamin a iu 19260IU; potassium 890mg.
""",
                            
                            """
Inspired by stuffed peppers, this soup is ready faster and with fewer dishes too! Have fun with the toppings—we top it with onion, Cheddar cheese and tortilla chips here, but salsa, sour cream and corn would also make stellar additions.

Ingredients:

1 tablespoon extra-virgin olive oil
3 large bell peppers, chopped
1 poblano pepper, chopped
1 medium onion, chopped, plus more for serving
1 pound lean ground beef
2 cloves garlic, minced
2 teaspoons ground cumin
1 teaspoon ground coriander
½ teaspoon ground pepper
¼ teaspoon salt
4 cups low-sodium chicken broth
1 cup quick-cooking brown rice
¼ cup chopped fresh cilantro, plus more for serving
Shredded Cheddar cheese & crushed tortilla chips for serving

Directions

Step 1
Heat oil in a large pot over medium-high heat. Add bell peppers, poblano and onion and cook, stirring often, until starting to soften, about 10 minutes. Push the vegetables to the edges. Add beef, garlic, cumin, coriander, ground pepper and salt to the middle and cook, crumbling the beef with a wooden spoon, until it's no longer pink, 3 to 5 minutes.

Step 2
Stir in broth and rice and bring to a boil. Reduce heat to maintain a low simmer, cover and cook until the rice is tender, 15 to 20 minutes. Remove from heat and stir in cilantro.

Step 3
Serve the soup topped with cheese, corn chips and more onion and cilantro, if desired.

Nutrition Facts

Serving Size:
2 cups

Per Serving:
570 calories; fat 28g; cholesterol 81mg; sodium 754mg; carbohydrates 51g; dietary fiber 6g; protein 26g; sugars 7g; niacin equivalents 110mg; saturated fat 10g; vitamin a iu 2884IU; potassium 711mg.
""",
                
                            
                            """
Our meatless version of the Indian-inspired British colonial soup includes parsnip and squash to keep it hearty and satisfying.

Ingredients:

3 tablespoons extra-virgin olive oil, divided
1 medium onion, finely chopped
2 medium carrots, finely chopped
1 medium parsnip, peeled and finely chopped
4 cups peeled diced acorn squash or butternut squash
1 medium green apple, peeled and finely chopped
1 tablespoon curry powder
3 cloves garlic, minced, divided
1 teaspoon grated fresh ginger
4 cups low-sodium vegetable broth
1 (14 ounce) can no-salt-added diced tomatoes
½ cup red lentils, picked over and rinsed
2 whole-wheat naan flatbreads, halved
¼ cup chopped fresh cilantro, plus more for garnish

Directions
 
Step 1
Preheat oven to 375°F. Line a baking sheet with foil.

Step 2
Heat 2 tablespoons oil in a large saucepan over medium heat until shimmering. Add onion, carrots and parsnip and cook until the onions are translucent, about 6 minutes. Add squash, apple, curry powder, 2 cloves garlic and ginger and cook, stirring, until fragrant, 1 to 2 minutes. Add broth, tomatoes and lentils and stir to combine. Bring to a boil. Reduce heat to maintain a low simmer, cover and cook until the squash and lentils are tender, about 20 minutes.

Step 3
Meanwhile, brush one side of each naan with the remaining 1 tablespoon oil. Sprinkle with the remaining 1 clove garlic and place on the prepared baking sheet. Bake until warmed, 5 to 6 minutes. Remove from oven and sprinkle with cilantro.

Step 4
Gently mash some of the soup with a potato masher to achieve desired consistency. (Alternatively, transfer half the soup to a blender and puree. Use caution when blending hot liquids.) Garnish the soup with cilantro and serve with the naan.

Nutrition Facts

Serving Size:
about 2 cups soup & 1/2 naan

Per Serving:
487 calories; fat 15g; cholesterol 1mg; sodium 406mg; carbohydrates 76g; dietary fiber 14g; protein 14g; sugars 17g; niacin equivalents 4mg; saturated fat 3g; vitamin a iu 7440IU; vitamin b6 1mg; potassium 983mg.
""",
                            
                            """
Sun-dried tomatoes are the star of this recipe— providing texture and umami. Combined with the spinach, they make this dish a great source of vitamins C and K.

Ingredients:

½ cup sliced oil-packed sun-dried tomatoes plus 2 tablespoons oil from the jar, divided
1 (16 ounce) package shelf-stable gnocchi
1 (15 ounce) can low-sodium cannellini beans, rinsed
1 (5 ounce) package baby spinach
1 large shallot, minced
⅓ cup low-sodium no-chicken broth or chicken broth
⅓ cup heavy cream
1 tablespoon lemon juice
¼ teaspoon salt
¼ teaspoon ground pepper
3 tablespoons fresh basil leaves

Directions

Step 1
Heat 1 tablespoon oil in a large nonstick skillet over medium-high heat. Add gnocchi and cook, stirring often, until plumped and starting to brown, about 5 minutes. Add beans and spinach and cook until the spinach is wilted, about 1 minute. Transfer to a plate.

Step 2
Add the remaining 1 tablespoon oil to the pan and heat over medium heat. Add sun-dried tomatoes and shallot; cook, stirring, for 1 minute. Increase heat to high and add broth. Cook until the liquid has mostly evaporated, about 2 minutes.

Step 3
Reduce heat to medium and stir in cream, lemon juice, salt and pepper. Return the gnocchi mixture to the pan and stir to coat with the sauce. Serve topped with basil.

Nutrition Facts

Serving Size:
1 cup

Per Serving:
437 calories; fat 13g; cholesterol 23mg; sodium 651mg; carbohydrates 69g; dietary fiber 8g; protein 14g; sugars 4g; niacin equivalents 1mg; saturated fat 5g; vitamin a iu 2995IU; potassium 481mg.
""",
                            
                            """
An electric pressure cooker makes quick work of this rich, savory sauce. Deglazing with wine and scraping up the browned bits from the bottom of the pot is the key to building flavor.

Ingredients:

1 28-ounce can no-salt-added whole peeled tomatoes, preferably San Marzano
¼ cup extra-virgin olive oil
1 medium onion, chopped
2 medium carrots, chopped
8 ounces cremini mushrooms, quartered
1 ¾ pounds boneless, skinless chicken thighs, trimmed and cut into 1-inch pieces
2 cloves garlic, grated
¼ cup tomato paste
½ cup dry red wine
½ teaspoon salt
¼ teaspoon crushed red pepper
1 tablespoon chopped fresh rosemary
1 pound whole-wheat linguine or fettuccine
½ cup grated Romano cheese
½ cup chopped fresh parsley

Directions

Step 1
Put a large pot of water on to boil.

Step 2
Pour tomatoes and their juice into a medium bowl. Using your hands, break the tomatoes into chunks.

Step 3
Heat oil in an electric pressure cooker on Sauté mode. Add onion, carrots and mushrooms; cook, stirring, until the mushrooms have released their liquid, about 5 minutes. Add chicken, garlic and tomato paste. Cook, stirring occasionally, until the chicken is coated and the mixture at the bottom of the pan is beginning to brown, about 4 minutes. Add wine, salt, crushed red pepper and the tomatoes. Cook, scraping up the browned bits, until beginning to boil, about 2 minutes. Turn off the heat.

Step 4
Close and lock the lid. Cook at High pressure for 10 minutes. Release the pressure manually. Stir in rosemary.

Step 5
Meanwhile, cook pasta according to package directions. Drain and serve topped with the sauce, cheese and parsley.

Nutrition Facts

Serving Size:
1 cup pasta & 1 cup sauce

Per Serving:
464 calories; fat 17g; cholesterol 61mg; sodium 399mg; carbohydrates 51g; dietary fiber 8g; protein 28g; sugars 6g; niacin equivalents 11mg; saturated fat 4g; vitamin a iu 3577IU; vitamin b6 1mg; potassium 869mg.
"""]
            
            self.images = ["Turkey Pumpkin Chili","Stuffed Pepper Soup","Winter Vegetable Mulligatawny Soup","White Bean & Sun-Dried Tomato Gnocchi","Chicken & Mushroom Ragu"]
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
