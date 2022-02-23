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
            
            self.arrName = ["Avocado-Egg Toast","White Bean & Avocado Toast","Pecan Butter & Pear Toast","Ricotta-Berry Crepes","Cashew Butter & Clementine Toast"]
            
            self.arrDetails = ["""
            Try it once and we think you'll agree: Topping avocado toast with an egg is a near-perfect breakfast.
            
            Ingredients:
            
            ¼ avocado
            ¼ teaspoon ground pepper
            ⅛ teaspoon garlic powder
            1 slice whole-wheat bread, toasted
            1 large egg, fried
            1 teaspoon Sriracha (Optional)
            1 tablespoon scallion, sliced (Optional)
            
            Directions
            
            Step 1
            Combine avocado, pepper and garlic powder in a small bowl and gently mash.

            Step 2
            Top toast with the avocado mixture and fried egg. Garnish with Sriracha and scallion, if desired.
            
            Nutrition Facts
            
            Serving Size:
            1 toast
            
            Per Serving:
            271 calories; protein 11.5g; carbohydrates 18.1g; dietary fiber 5.4g; sugars 2g; fat 17.7g; saturated fat 3.5g; cholesterol 186mg; vitamin a iu 347.5IU; vitamin c 5mg; folate 77.5mcg; calcium 69.4mg; iron 2mg; magnesium 46.6mg; potassium 406.5mg; sodium 216.2mg.
            """,
                               
                               """
            Mashed avocado and white beans make for a fiber-rich and creamy topping, the perfect partner for a crispy slice of toast. Try it for a quick breakfast or snack.
            
            Ingredients:
            
            1 slice whole-wheat bread, toasted
            ¼ avocado, mashed
            ½ cup canned white beans, rinsed and drained
            Kosher salt to taste
            Ground pepper to taste
            1 pinch Crushed red pepper
            
            Directions
            
            Step 1
            Top toast with mashed avocado and white beans. Season with a pinch each of salt, pepper and crushed red pepper.
            
            Nutrition Facts
            
            Serving Size:
            1 slice
            
            Per Serving:
            230 calories; protein 11.5g; carbohydrates 34.7g; dietary fiber 11.3g; sugars 3g; fat 8.8g; saturated fat 1.3g; vitamin a iu 74.2IU; vitamin c 5.1mg; folate 158.2mcg; calcium 93.4mg; iron 2.3mg; magnesium 35.1mg; potassium 655.4mg; sodium 458.6mg; thiamin 0.1mg; added sugar 2g.
            
            Exchanges:
            2 starch, 1 1/2 fat, 1 lean protein
            """,
                               
                               """
                               For a quick breakfast or snack, try this three-ingredient toast. Pecan butter adds a nutty flavor, which gets balanced by the natural sweetness of the pear.
                               
                               Ingredients
                               Ingredient Checklist
                               1 tablespoon pecan butter
                               1 slice whole-grain bread, toasted
                               ½ small pear, thinly sliced
                               
                               Directions
                               
                               Step 1
                               Spread pecan butter on toast and top with pear slices.
                               
                               Nutrition Facts
                               
                               Serving Size:
                               1 toast
                               
                               Per Serving:
                               209 calories; fat 11g; sodium 100mg; carbohydrates 25g; dietary fiber 6g; protein 5g; niacin equivalents 1mg; saturated fat 1g; vitamin a iu 19IU; potassium 146mg.
                               """,
                               
                               """
            Make a big batch of these easy 3-ingredient crepes to stash in your freezer so you always have a healthy breakfast on hand. A dollop of ricotta adds protein to a store-bought crepe, while the berries give a burst of sweetness and a little fiber.
            
            Ingredients:
            
            1 whole-wheat crepe
            2 tablespoons low-fat ricotta cheese
            ¼ cup berries
            1 tablespoon Honey
            
            Directions
            
            Step 1
            Spread crepe with ricotta. Top with berries. Fold up, wrap in foil and freeze for up to 1 month.

            Step 2
            To heat and eat: Unwrap and microwave in 1-minute intervals until warmed through. Drizzle with honey, if desired.
            
            Nutrition Facts
            
            Serving Size:
            1 crepe
            
            Per Serving:
            187 calories; protein 10g; carbohydrates 22g; dietary fiber 2g; sugars 4g; fat 7g; saturated fat 3g; cholesterol 104mg; vitamin a iu 294.1IU; vitamin c 4.5mg; folate 47.1mcg; calcium 130.4mg; iron 2.5mg; magnesium 12.2mg; potassium 152mg; sodium 172mg.
            """,
                               
                               """
            This three-ingredient toast uses a fresh clementine and cashew butter for a twist on the classic PB & J. Enjoy this toast for a quick breakfast or snack.
            
            Ingredients:
            
            1 tablespoon cashew butter
            1 slice whole-grain bread, toasted
            1 clementine, peeled and segmented
            
            Directions
            
            Step 1
            Spread cashew butter on toast and top with clementine segments.
            
            Nutrition Facts
            
            Serving Size:
            1 toast
            
            Per Serving:
            201 calories; fat 10g; sodium 147mg; carbohydrates 25g; dietary fiber 4g; protein 6g; sugars 10g; niacin equivalents 2mg; saturated fat 2g; potassium 262mg.
            """]
            
            self.arrImages = ["Avocado-Egg Toast","White Bean & Avocado Toast","Pecan Butter & Pear Toast","Ricotta-Berry Crepes","Cashew Butter & Clementine Toast"]
            
        case .AMSnack:
            self.lblTitle.text = "A.M. Snack"
            self.subCategory = "AMSnack"
            self.imgFoodType.image = UIImage(named: "amSnack")
            
            self.arrName = ["Sweet and Salty Roasted Nuts","Ricotta & Yogurt Parfait","Tuna Salad Crackers","Waffle with Nut Butter, Banana & Chocolate Chips","Coconut Blueberry Smoothie"]
            
            self.arrDetails = ["""
                               Spicy seasonings add a bit of zing to roasted nuts for an appetizer that's perfect for any occasion.

Ingredients:

1 egg white
1 tablespoon water
4 cups raw whole cashews, whole almonds, walnut halves, and/or pecan halves
3 tablespoons packed brown sugar or brown sugar substitute equivalent to 3 tablespoons brown sugar (see Tip)
1 tablespoon ground cumin
2 teaspoons chili powder
1 teaspoon garlic salt
⅛ teaspoon cayenne pepper

Directions

Step 1
Preheat oven to 300 degrees F. In a medium bowl, combine egg white and water; beat with a fork until frothy. Add nuts; toss to coat. Let stand for 5 minutes.

Step 2
Meanwhile, in a large plastic bag, combine brown sugar, cumin, chili powder, garlic salt, and cayenne pepper. Add nuts; shake well to coat. Spread nuts evenly in a 15x10x1-inch baking pan.

Step 3
Bake for 35 to 40 minutes or until nuts are toasted and coating is dry, stirring twice. Transfer to a large sheet of foil. Cool completely. Store in an airtight container at room temperature for up to 5 days, or freeze for up to 3 months.

Nutrition Facts

Serving Size:
1/4 cup

Per Serving:
206 calories; protein 7g; carbohydrates 13g; sugars 4g; fat 16g; saturated fat 3g; sodium 72mg.
""",
                               """
Reminiscent of a lemon cheesecake, this healthy breakfast recipe is easy to throw together in the morning. Or stir together the filling in a jar the night before and top with the fruit, nuts and seeds when you get to work.

Ingredients:

¾ cup nonfat vanilla Greek yogurt
¼ cup part-skim ricotta
½ teaspoon lemon zest
¼ cup raspberries
1 tablespoon slivered almonds
1 teaspoon chia seeds

Directions

Step 1
Combine yogurt, ricotta and lemon zest in a bowl. Top with raspberries, almonds and chia seeds.

Nutrition Facts

Serving Size:
about 1 1/4 cups

Per Serving:
272 calories; protein 21.7g; carbohydrates 25.1g; dietary fiber 5.1g; sugars 14.2g; fat 9.6g; saturated fat 3.4g; cholesterol 23.9mg; vitamin a iu 250.8IU; vitamin c 9.4mg; folate 19.3mcg; calcium 384.7mg; iron 1mg; magnesium 46.2mg; potassium 397.7mg; sodium 119.1mg; thiamin 0.1mg; added sugar 6g.

Exchanges:
1/2 fruit, 1 fat-free milk, 1 medium-fat meat, 1 fat
""",
                               """
            A fun twist on a tuna salad sandwich. This Tuna Salad & Crackers recipe uses wheat crackers instead of bread!
            
            Ingredients:
            
            6 wheat crackers
            1 2.6-ounce pouch low-sodium light tuna
            1 tablespoon reduced-fat olive oil mayonnaise
            ½ cup red pepper strips
            ½ cup cucumber slices
            1 single-serve sun-dried-tomato hummus dip
            
            Directions
            
            Step 1
            Mix tuna and mayonnaise. Spread on crackers. Serve with peppers, cucumbers, and hummus.
            
            Nutrition Facts
            
            Serving Size:
            6 crackers, prepared tuna pouch, 1/2 cup peppers, 1/2 cup cucumber, 1 single-serve hummus dip
            
            Per Serving:
            297 calories; protein 27g; carbohydrates 26g; dietary fiber 4g; sugars 5g; fat 9g; cholesterol 35mg; sodium 467mg.
            """,
                               """
            Top a whole-grain freezer waffle with nut butter, banana slices and chocolate chips for a decadent-tasting and healthy breakfast or snack you can whip up when you're short on time. This high-protein, high-fiber breakfast may be ready before your coffee is finished brewing.
            
            Ingredients:
            
            1 frozen whole-grain cinnamon waffle, such as Kashi
            1 tablespoon almond butter or other nut butter
            ¼ banana, sliced
            1 teaspoon mini chocolate chips
            
            Directions
            
            Step 1
            Toast waffle according to package directions. Spread with nut butter and top with sliced banana and chocolate chips. Serve warm.
            
            Nutrition Facts
            
            Serving Size:
            1 waffle
            
            Per Serving:
            222 calories; protein 5.3g; carbohydrates 25g; dietary fiber 4.1g; sugars 8.6g; fat 12.6g; saturated fat 1.7g; vitamin a iu 19IU; vitamin c 2.6mg; folate 14.9mcg; calcium 110.2mg; iron 1.3mg; magnesium 56.8mg; potassium 238.4mg; sodium 37mg; added sugar 4g.
            
            Exchanges:
            2 1/2 fat, 1 starch, 1/2 fruit
            """,
                               """
            Give your blueberry smoothie a tropical update with the rich flavors of coconut milk and coconut cream. Freshly squeezed orange juice lends bright flavor to this healthy smoothie recipe, but if you're short on time, bottled will work just fine.

Ingredients:

¼ cup light coconut milk
¼ cup orange juice
2 tablespoons coconut cream
1 cup frozen blueberries
1 tablespoon maple syrup (Optional)

Directions

Step 1
Add coconut milk, orange juice, coconut cream, blueberries and maple syrup (if using) to a blender. Blend until smooth.

Nutrition Facts

Serving Size:
1 1/2 cups

Per Serving:
283 calories; protein 1.5g; carbohydrates 46.5g; dietary fiber 4.4g; sugars 37.9g; fat 11.3g; saturated fat 9.5g; vitamin a iu 195.3IU; vitamin c 34.9mg; folate 34.8mcg; calcium 20.7mg; iron 0.4mg; magnesium 21mg; potassium 246.1mg; sodium 25.9mg.
"""]
            
            self.arrImages = ["Sweet and Salty Roasted Nuts","Ricotta & Yogurt Parfait","Tuna Salad Crackers","Waffle with Nut Butter, Banana & Chocolate Chips","Coconut Blueberry Smoothie"]
            
        case .Lunch:
            self.lblTitle.text = "Lunch"
            self.subCategory = "Lunch"
            self.imgFoodType.image = UIImage(named: "honey")
            self.arrName = ["Kale & Quinoa Salad with Lemon Dressing","Eat-the-Rainbow Chopped Salad with Basil & Mozzarella","Green Salad with Edamame & Beets","Sweet Potato, Kale & Chicken Salad with Peanut Dressing","Green Papaya Salad"]
            self.arrDetails = ["""
            This kale-quinoa salad pops with different flavors and textures. Massaging the kale helps break down its fibrous nature, while add-ins like toasted almonds, feta and cucumber add crunch and saltiness.

Ingredients:

1 bunch lacinato kale, stemmed and chopped
6 tablespoons extra-virgin olive oil
3 tablespoons lemon juice
2 tablespoons chopped shallot
1 teaspoon honey
½ teaspoon salt
¼ teaspoon ground pepper
2 cups grape or cherry tomatoes, halved
2 cups cooked quinoa
1 English cucumber, thinly sliced
1 medium red bell pepper, sliced
1 medium yellow bell pepper, sliced
1 (15 ounce) can unsalted chickpeas, rinsed
¾ cup feta cheese, crumbled
½ cup sliced almonds, toasted

Directions

Step 1
Place kale in a large serving bowl. Whisk together oil, lemon juice, shallot, honey, salt and pepper in a small bowl. Pour 2 to 3 tablespoons of the dressing over the kale; lightly massage until slightly wilted, 1 to 2 minutes.

Step 2
Top the kale with tomatoes, quinoa, cucumber, peppers, chickpeas, feta and almonds. Drizzle with the remaining dressing and toss before serving.

Nutrition Facts

Serving Size:
1 3/4 cups

Per Serving:
400 calories; fat 23g; cholesterol 5mg; sodium 406mg; carbohydrates 37g; dietary fiber 8g; protein 14g; sugars 6g; niacin equivalents 1mg; saturated fat 4g; vitamin a iu 3984IU; potassium 594mg.
""",
            """
          This fresh and colorful salad has all of the delicious flavors you love from the classic caprese salad, plus even more healthy veggies. Double this and top each portion with 3 ounces grilled or roasted chicken to take it from a simple side to a quick main dish.

Ingredients:

¼ cup white balsamic vinegar
¼ cup extra-virgin olive oil
½ teaspoon salt
¼ teaspoon ground pepper
2 large carrots, diced
1 large yellow bell pepper, diced
2 cups chopped kale
1 ¼ cups chopped red cabbage
1 cup quartered grape tomatoes
1 cup mozzarella pearls
½ cup thinly sliced fresh basil
2 scallions, sliced

Directions

Step 1
Whisk vinegar, oil, salt and pepper in a large bowl. Add carrots, bell pepper, kale, cabbage, tomatoes, mozzarella, basil and scallions. Toss to coat.

Nutrition Facts

Serving Size:
1 cup

Per Serving:
140 calories; protein 5g; carbohydrates 7.8g; dietary fiber 1.5g; sugars 4g; fat 10.2g; saturated fat 2.8g; cholesterol 10.6mg; vitamin a iu 4044.7IU; vitamin c 58.5mg; folate 28.5mcg; calcium 146.3mg; iron 0.6mg; magnesium 18.6mg; potassium 256.5mg; sodium 276.2mg.

Exchanges:
1 1/2 fat, 1 vegetable, 1/2 medium-fat protein
""",
            """
This big salad is a feast for the eyes and an everyday way to incorporate nutrient-rich beets and plant-based protein from edamame (green soybeans). If you're not a fan of cilantro, mix in freshly chopped basil or dill instead.

Ingredients:

2 cups mixed salad greens
1 cup shelled edamame, thawed
½ medium raw beet, peeled and shredded (about 1/2 cup)
1 tablespoon plus 1 1/2 teaspoons red-wine vinegar
1 tablespoon chopped fresh cilantro
2 teaspoons extra-virgin olive oil
Freshly ground pepper to taste

Directions

Step 1
Arrange greens, edamame and beet on a large plate. Whisk vinegar, cilantro, oil, salt and pepper in a small bowl. Drizzle over the salad and enjoy.

Nutrition Facts

Serving Size:
about 4 cups salad

Per Serving:
325 calories; protein 18.5g; carbohydrates 25.5g; dietary fiber 11.6g; sugars 5.6g; fat 15.7g; saturated fat 1.4g; vitamin a iu 3973.5IU; vitamin c 30.9mg; folate 172.5mcg; calcium 170.1mg; iron 5.2mg; magnesium 37.5mg; potassium 499.5mg; sodium 682.2mg; thiamin 0.1mg.

Exchanges:
2 1/2 lean protein, 2 fat, 1 1/2 vegetable, 1 carbohydrate
""",
            """
            These hearty kale salads hold up well for 4 days, making them perfect for meal-prep lunches. To keep the ingredients from getting soggy, dress this salad and top it with peanuts just before serving. For a delicious vegan option, swap in roasted tofu for the chicken breast (see Associated Recipes).
            
            Ingredients:
            
            1 pound sweet potatoes (about 2 medium), scrubbed and cut into 1-inch cubes
            1 ½ teaspoons extra-virgin olive oil
            ¼ teaspoon kosher salt
            ⅛ teaspoon ground pepper
            1/2 cup Peanut Dressing (see Associated Recipes)
            6 cups chopped curly kale
            2 cups shredded cooked chicken breast (see Tip)
            ¼ cup chopped unsalted peanuts
            
            Directions
            
            Step 1
            Preheat oven to 425 degrees F. Line a rimmed baking sheet with foil; lightly coat with cooking spray. Set aside. Toss sweet potatoes with oil, salt and pepper in a large bowl.

            Step 2
            Arrange the sweet potatoes in a single layer on the prepared baking sheet. Roast, turning once, until tender and lightly browned and crispy on the outside, about 20 minutes. Set aside to cool before assembling bowls.

            Step 3
            Transfer 2 tablespoons peanut dressing into each of 4 small lidded containers; refrigerate for up to 4 days.

            Step 4
            Divide kale among 4 single-serving containers (about 1 1/2 cups each). Top each with one-fourth of the roasted sweet potatoes and 1/2 cup chicken. Seal the containers and refrigerate for up to 4 days.

            Step 5
            Just before serving, drizzle each salad with 1 portion of peanut dressing and toss well to coat. Top with 1 tablespoon chopped peanuts.
            
            Nutrition Facts
            
            Serving Size:
            1 container
            
            Per Serving:
            393 calories; protein 30.4g; carbohydrates 31.9g; dietary fiber 5.9g; sugars 8g; fat 15.4g; saturated fat 2.7g; cholesterol 59.5mg; vitamin a iu 18503.5IU; vitamin c 33.3mg; folate 58.6mcg; calcium 87.2mg; iron 2.3mg; magnesium 76.8mg; potassium 746.2mg; sodium 566.2mg; thiamin 0.2mg; added sugar 2g.
            
            Exchanges:
            3 lean protein, 2 1/2 fat, 1 1/2 starch, 1/2 vegetable
            """,
            """
            This Thai-inspired salad makes use of the papayas that grow throughout Hawaii. This version is tossed with tender, sweet pea shoots. Make an extra batch of the vinaigrette to keep on hand in the refrigerator--use it as a marinade for vegetables, a flavorful dressing for fresh melon or as a sauce to splash over grilled fish or chicken.
            
            Ingredients:
            
            ¼ teaspoon freshly grated lime zest
            ¼ cup lime juice
            2 tablespoons finely chopped palm sugar, or packed brown sugar (see Tip)
            2 tablespoons fish sauce
            Hawaiian chiles, or any fresh hot chiles, minced, to taste
            3 cups matchstick-cut or julienned green papaya, (see Tip)
            ½ cup very thinly sliced Maui or other sweet onion
            ½ cup pea shoots, cut into 3-inch pieces, or bean sprouts
            Freshly ground pepper, to taste
            
            Directions
            
            Step 1
            Whisk lime zest, lime juice, sugar, fish sauce and chiles in a large bowl.

            Step 2
            Add papaya, onion and pea shoots (or sprouts) to the vinaigrette; toss to combine. Sprinkle with pepper just before serving.
            
            Nutrition Facts
            
            Serving Size:
            2/3 cup
            
            Per Serving:
            55 calories; protein 1.4g; carbohydrates 13.3g; dietary fiber 1.3g; sugars 9.5g; fat 0.2g; saturated fat 0.1g; vitamin a iu 470.5IU; vitamin c 36.1mg; folate 26.6mcg; calcium 19.5mg; iron 0.3mg; magnesium 14.6mg; potassium 141.3mg; sodium 403mg; added sugar 4g.
            
            Exchanges:
            1 fruit
            """]
            self.arrImages = ["Kale & Quinoa Salad with Lemon Dressing","Eat-the-Rainbow Chopped Salad with Basil & Mozzarella","Green Salad with Edamame & Beets","Sweet Potato, Kale & Chicken Salad with Peanut Dressing","Green Papaya Salad"]
            
        case .PMSnack:
            self.lblTitle.text = "P.M. Snack"
            self.subCategory = "PMSnack"
            self.imgFoodType.image = UIImage(named: "pmSnack")
            
            self.arrName = ["Waffle with Cream Cheese, Plums & Granola","Really Green Smoothie","Cherry Smoothie","Chocolate-Banana Protein Smoothie","Cantaloupe Smoothie Bowl"]
            
            self.arrDetails = ["""
Top a toasted frozen waffle with cream cheese, plums and granola for a healthy breakfast in a pinch. Loaded with protein, fiber and whole grains, this recipe will keep you full and satisfied all morning.

Ingredients:

1 frozen whole-grain blueberry waffle, such as Kashi
1 tablespoon cream cheese
1 plum, sliced
1 tablespoon granola

Directions

Step 1
Toast waffle according to package directions. Transfer to a plate. Spread with cream cheese; top with plums and granola. Serve immediately.

Nutrition Facts

Serving Size:
1 waffle

Per Serving:
188 calories; protein 4.4g; carbohydrates 24.9g; dietary fiber 4.8g; sugars 10.3g; fat 9.6g; saturated fat 3.5g; cholesterol 14.6mg; vitamin a iu 392IU; vitamin c 6.7mg; folate 11mcg; calcium 42.2mg; iron 1.1mg; magnesium 32.1mg; potassium 225.4mg; sodium 218.9mg; thiamin 0.1mg; added sugar 3g.

Exchanges:
1 1/2 starch, 1 fat, 1/2 fruit
""",
                               """
The combination of kale and avocado makes this healthy smoothie recipe extra green. Chia seeds lend this creamy smoothie a heart-healthy punch of fiber and omega-3 fatty acids.

Ingredients:

1 large ripe banana
1 cup packed baby kale or coarsely chopped mature kale
1 cup unsweetened vanilla almond milk
¼ ripe avocado
1 tablespoon chia seeds
2 teaspoons honey
1 cup ice cubes

Directions

Step 1
Combine banana, kale, almond milk, avocado, chia seeds and honey in a blender. Blend on high until creamy and smooth. Add ice and blend until smooth.

Nutrition Facts

Serving Size:
2 1/3 cup

Per Serving:
343 calories; protein 5.9g; carbohydrates 54.7g; dietary fiber 12.1g; sugars 28.8g; fat 14.2g; saturated fat 1.6g; vitamin a iu 2264.5IU; vitamin c 36.3mg; folate 95.9mcg; calcium 309.6mg; iron 2.1mg; magnesium 112.2mg; potassium 1051.1mg; sodium 198.9mg.

Exchanges:
3 fat, 2 fruit, 1/2 other carbohydrate, 1/2 vegetable
""",
                               """
The combination of oat milk, vanilla extract and sweet cherries makes this recipe taste like a cherry pie smoothie. Adding a bit of brown sugar boosts that nostalgia even more.

Ingredients:

½ cup oat milk
1 tablespoon almond butter
1 teaspoon cocoa powder
½ teaspoon vanilla extract
1 cup frozen dark sweet cherries
1 tablespoon brown sugar (Optional)

Directions

Step 1
Add oat milk, almond butter, cocoa, vanilla, cherries and sugar (if using) to a blender. Blend until smooth.

Nutrition Facts

Serving Size:
1 1/2 cups

Per Serving:
232 calories; protein 5.7g; carbohydrates 31.5g; dietary fiber 5.8g; sugars 21g; fat 9.1g; saturated fat 1.2g; vitamin a iu 100.2IU; vitamin c 9mg; folate 9.1mcg; calcium 307.8mg; iron 1.5mg; magnesium 53.6mg; potassium 242mg; sodium 86.7mg; added sugar 2g.
""",
                               """
Red lentils give this smoothie a plant-based protein boost. To make this smoothie vegan, try using unsweetened coconut beverage or almond milk in place of the dairy milk.

Ingredients:

1 banana, frozen
½ cup cooked red lentils
½ cup nonfat milk
2 teaspoons unsweetened cocoa powder
1 teaspoon pure maple syrup

Directions:

Step 1
Combine banana, lentils, milk, cocoa and syrup in a blender. Puree until smooth.

Nutrition Facts

Serving Size:
1 smoothie

Per Serving:
310 calories; protein 15.3g; carbohydrates 63.8g; dietary fiber 8.5g; sugars 24.6g; fat 1.8g; saturated fat 0.6g; cholesterol 2.5mg; vitamin a iu 347.7IU; vitamin c 10.9mg; folate 109.2mcg; calcium 185.2mg; iron 3.7mg; magnesium 87.3mg; potassium 938.8mg; sodium 56.9mg; added sugar 4g.

Exchanges:
2 fruit, 1 starch, 1/2 other carb,1/2 NF milk, 1 lean protein
""",
                               """
            Water-packed frozen cantaloupe acts like ice cubes in your blender; the smaller the dice, the easier it will be on the blades. Make this a traditional, pourable smoothie by adding a touch more carrot juice or water before whizzing everything together.

Ingredients:

4 cups frozen cubed cantaloupe (1/2-inch pieces)
¾ cup carrot juice
Pinch of salt
Melon balls, berries, nuts and/or fresh basil for garnish

Directions

Step 1
Combine cantaloupe, juice and salt in a food processor or high-speed blender. Alternate between pulsing and blending, stopping to stir and scrape down the sides as needed, until thick and smooth, 1 to 2 minutes. Serve the smoothie topped with more melon, berries, nuts and/or basil, if desired.

Nutrition Facts

Serving Size:
generous 1 cup

Per Serving:
135 calories; protein 3.4g; carbohydrates 31.7g; dietary fiber 3.1g; sugars 28.3g; fat 0.6g; saturated fat 0.2g; vitamin a iu 22634.9IU; vitamin c 117.9mg; folate 3.1mcg; calcium 43.8mg; iron 0.8mg; magnesium 47.4mg; potassium 1053.2mg; sodium 180.1mg; added sugar 9g.

Exchanges:
1 1/2 fruit, 1 vegetable
"""]
            self.arrImages = ["Waffle with Cream Cheese, Plums & Granola","Really Green Smoothie","Cherry Smoothie","Chocolate-Banana Protein Smoothie","Cantaloupe Smoothie Bowl"]
            
        case .Dinner:
            self.lblTitle.text = "Dinner"
            self.subCategory = "Dinner"
            self.imgFoodType.image = UIImage(named: "dinner")
            self.arrName = ["Chicken, Peppers & Pasta Casserole","Brussels Sprouts & Pepperoni Pizza","Jason Mraz's Guacamole","Red Cabbage Salad with Blue Cheese & Maple-Glazed Walnuts","West Coast Avocado Toast"]
            self.arrDetails = ["""
            You can assemble this healthy chicken casserole before you leave for a party and pop it in the oven at the host's house. Or bake it at home and bring it along--it's delicious at room temperature too.

Ingredients:

12 ounces whole-wheat fusilli
16 mini sweet peppers
1 ½ pounds boneless, skinless chicken breast, cut into 3/4-inch pieces
3 tablespoons extra-virgin olive oil, divided
1 teaspoon salt, divided
½ teaspoon ground pepper
2 medium fennel bulbs, chopped, plus 1/4 cup chopped fronds
⅓ cup finely chopped shallot
3 tablespoons all-purpose flour
1 ½ cups low-sodium chicken broth
½ cup dry white wine
½ cup crème fraîche
½ cup chopped fresh chives, divided
2 tablespoons lemon juice
½ cup Kalamata olives, chopped
½ cup panko breadcrumbs, preferably whole-wheat

Directions

Step 1
Bring a large pot of water to a boil. Cook pasta according to package directions. Drain and transfer to a large bowl. Set aside.

Step 2
Meanwhile, position a rack in upper third of oven; preheat broiler to high. Line a rimmed baking sheet with foil. Coat the foil with cooking spray.

Step 3
Place peppers on one side of the prepared baking sheet. Toss chicken, 1 tablespoon oil, 1/2 teaspoon salt and pepper in a medium bowl. Place the chicken in an even layer on the other half of the baking sheet. Broil, turning once, until the peppers start to char on both sides and the chicken is no longer pink in the middle, 4 to 8 minutes. Set aside to cool slightly.

Step 4
Preheat oven to 400 degrees F.

Step 5
Meanwhile, heat 1 tablespoon oil in a large skillet over medium heat. Add fennel and shallot and cook, stirring frequently, until softened and starting to brown, about 5 minutes. Add flour and stir to coat. Add broth and wine and bring to a simmer. Cook, stirring occasionally, until slightly thickened, about 2 minutes. Remove from heat. Stir in crème fraîche, 1/4 cup chives, lemon juice, the fennel fronds and the remaining 1/2 teaspoon salt. Transfer to the bowl with the pasta.

Step 6
Trim and quarter the peppers. Add the peppers, chicken and olives to the pasta; stir to combine. Transfer the mixture to a 9-by-13-inch pan (or similar-size 3-quart baking dish). Combine panko with the remaining 1 tablespoon oil in a small bowl. Sprinkle over the casserole.

Step 7
Bake the casserole until hot, about 30 minutes. Serve topped with the remaining 1/4 cup chives.

Nutrition Facts

Serving Size:
1 1/2 cups

Per Serving:
443 calories; protein 25.6g; carbohydrates 47.6g; dietary fiber 7.3g; sugars 5.4g; fat 15.5g; saturated fat 4.9g; cholesterol 59.5mg; vitamin a iu 2339.3IU; vitamin c 74.1mg; folate 55.6mcg; calcium 80.3mg; iron 1.9mg; magnesium 37.3mg; potassium 576.3mg; sodium 530.8mg.

Exchanges:
2 1/2 starch, 1 1/2 vegetable, 2 1/2 lean meat, 2 1/2 fat
""",
            """
            If you want to spark some joy in your house, give this pizza combo a try. Brussels sprouts, pepperoni, lemon zest and fontina cheese make this healthy pizza recipe anything but boring. Preshredded Brussels will speed up your prep time, but try to get pepperoni sliced fresh from the deli--it has better flavor and texture than the shelf-stable kind.
            
            Ingredients:
            
            4 tablespoons extra-virgin olive oil, divided
            4 cups thinly sliced Brussels sprouts
            ¾ cup sliced shallots
            ¼ teaspoon salt
            ¼ teaspoon ground pepper
            1 pound pizza dough, preferably whole-wheat
            1 tablespoon minced garlic
            1 ½ cups shredded fontina cheese
            ⅓ cup pepperoni slices (1 ounce)
            2 teaspoons lemon zest
            
            Directions
            
            Step 1
            Preheat oven to 450 degrees F. Coat a large rimmed baking sheet with cooking spray.

            Step 2
            Heat 2 tablespoons oil in a large skillet over medium heat. Add Brussels sprouts, shallots, salt and pepper and cook, stirring, until softened, 5 to 8 minutes. Remove from heat.

            Step 3
            Roll out dough to the size of the baking sheet, then transfer to the baking sheet. Combine the remaining 2 tablespoons oil and garlic and brush over the dough. Top with the vegetables, cheese and pepperoni.

            Step 4
            Bake the pizza until golden, 18 to 20 minutes. Sprinkle with lemon zest.
            
            Nutrition Facts
            
            Serving Size:
            1/6 pizza each
            
            Per Serving:
            406 calories; protein 15.1g; carbohydrates 37g; dietary fiber 2.8g; sugars 3.3g; fat 24g; saturated fat 7.3g; cholesterol 36.3mg; vitamin a iu 855.2IU; vitamin c 32.5mg; folate 37.4mcg; calcium 178.1mg; iron 1mg; magnesium 19mg; potassium 255.4mg; sodium 607.8mg; added sugar 1g.
            
            Exchanges:
            2 starch, 1 1/2 vegetable, 1 high fat meat, 2 fat
            """,
            """
            In this easy guacamole recipe, musician Mraz prefers California Hass or Reed avocados because they are the creamiest. Adjust the heat, tang or other flavorings to suit your tastes.
            
            Ingredients:
            
            4 ripe avocados
            ½ cup chopped fresh cilantro
            ⅓ cup finely chopped red onion
            ¼ cup lime or lemon juice
            1 tablespoon extra-virgin olive oil
            ½ teaspoon fine sea salt
            Ground pepper to taste
            Hot sauce, finely diced fresh jalapeños, cayenne pepper and/or chipotle powder to taste
            
            Directions
            
            Step 1
            Mash avocados in a medium bowl. Add cilantro, onion, lime (or lemon) juice, oil, salt and pepper and stir to combine. Season with hot sauce, jalapenos, cayenne and/or chipotle, if desired.
            
            Nutrition Facts
            
            Serving Size:
            1/4 cup
            
            Per Serving:
            121 calories; protein 1.4g; carbohydrates 6.6g; dietary fiber 4.6g; sugars 0.7g; fat 11g; saturated fat 1.6g; vitamin a iu 145.6IU; vitamin c 8.7mg; folate 56mcg; calcium 10.3mg; iron 0.4mg; magnesium 20.5mg; potassium 341.1mg; sodium 52mg; thiamin 0.1mg.
            
            Exchanges:
            2 fat
            """,
            """
            Serve this hearty salad recipe--combining red cabbage, blue cheese and glazed walnuts--as an accompaniment to roast pork or chicken. To slice the cabbage quickly, cut the head into wedges and slice in your food processor. A mandoline is also a great tool for the job.
            
            Ingredients:
            
            1 tablespoon crumbled blue cheese
            ¼ cup extra-virgin olive oil
            3 tablespoons red-wine vinegar
            1 tablespoon Dijon mustard
            ¼ teaspoon salt
            ¼ teaspoon freshly ground pepper
            1 tablespoon extra-virgin olive oil
            1 teaspoon butter
            1 cup walnuts
            ¼ teaspoon salt
            ¼ teaspoon freshly ground pepper
            3 tablespoons pure maple syrup
            8 cups very thinly sliced red cabbage
            2 scallions, thinly sliced
            ⅓ cup crumbled blue cheese
            
            Directions
            
            Step 1
            To prepare vinaigrette: Combine 1 tablespoon blue cheese, 1/4 cup oil, vinegar, mustard, salt and pepper in a mini food processor or blender; process until creamy.

            Step 2
            To prepare salad: Place a piece of parchment or wax paper near your stove. Heat 1 tablespoon oil and butter in a medium skillet over medium heat. Add walnuts and cook, stirring, for 2 minutes. Add salt and pepper and drizzle in maple syrup. Cook, stirring, until the nuts are well coated and have begun to caramelize, 3 to 5 minutes. Transfer to the paper, spooning any remaining syrup over them. Separate the nuts while they're still warm. Let stand until cool, about 5 minutes.

            Step 3
            Place cabbage and scallions in a large bowl. Toss with the vinaigrette. Serve topped with blue cheese and the walnuts.
            
            Nutrition Facts
            
            Serving Size:
            about 1 cup
            
            Per Serving:
            232 calories; protein 4.4g; carbohydrates 12.4g; dietary fiber 2.4g; sugars 7.7g; fat 19.4g; saturated fat 3.6g; cholesterol 6.3mg; vitamin a iu 884.8IU; vitamin c 40.8mg; folate 29.7mcg; calcium 90.5mg; iron 1mg; magnesium 35.3mg; potassium 272.8mg; sodium 267.4mg; thiamin 0.1mg; added sugar 5g.
            
            Exchanges:
            1/2 other carbohydrate, 1 vegetable, 3 1/2 fat
            """,
            """
            Hummus, sprouts and avocado top sprouted whole-wheat bread in this healthy vegan lunch idea. Look for sprouted bread in the freezer section of your grocery store.
            
            Ingredients:
            
            1 cup mixed salad greens
            1 teaspoon red-wine vinegar
            1 teaspoon extra-virgin olive oil
            Pinch of salt
            Pinch of pepper
            2 slices sprouted whole-wheat bread, toasted
            ¼ cup plain hummus
            ¼ cup alfalfa sprouts
            ¼ avocado, sliced
            2 teaspoons unsalted sunflower seeds
            
            Directions
            
            Step 1
            Toss greens with vinegar, oil, salt and pepper in a medium bowl. Spread each slice of toast with 2 tablespoons hummus. Top with sprouts, avocado and the greens and sprinkle with sunflower seeds.
            
            Nutrition Facts
            
            Serving Size:
            2 toasts each
            
            Per Serving:
            429 calories; protein 16.2g; carbohydrates 46.4g; dietary fiber 15.1g; sugars 0.9g; fat 21.9g; saturated fat 2.9g; vitamin a iu 1601.6IU; niacin equivalents 1.7mg; vitamin b6 0.3mg; vitamin c 14.7mg; folate 171.8mcg; calcium 67.3mg; iron 4.3mg; magnesium 81.7mg; potassium 616.2mg; sodium 550.7mg; thiamin 0.2mg; calories from fat 197kcal.
            
            Exchanges:
            2 1/2 starch, 3 fat, 1 medium-fat protein
            """
            ]
            self.arrImages = ["Chicken, Peppers & Pasta Casserole","Brussels Sprouts & Pepperoni Pizza","Jason Mraz's Guacamole","Red Cabbage Salad with Blue Cheese & Maple-Glazed Walnuts","West Coast Avocado Toast"]
            
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
