//
//  BackViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-14.
//

import UIKit

class BackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var category = ""
    var subCategory = ""
    var isFromCustomsController : Bool = false
    
    var data = [
        
        ["Dumbbell bent-over row","Dumbbell deadlift","Dumbbell row kickback","Dumbbell upright row","Incline y raise","One-arm row","Seated bent over row","Seated reverse fly","Swiss-ball close row","Swiss-ball pullover","Weighted chop"],
        
            ["Barbell bent-over row","Barbell side bend","Deadlift","Inverted row","T-bar bent-over row","Zercher squat"],
        
            ["Assisted pull-up","Back raise","Cable close grip pulldown","Cable face pull","Cable seated close row","Cable seated high row","Cable seated low row","Cable standing close row","Cable straight arm pull-down","Chinup","Lat pulldown","Machine lateral pull-down","Neutral-grip pullup"],
        
        
            ["Kettlebell clean","Kettlebell high pull","Kettlebells bent-over-row"],
        
            ["Swiss-ball close row","Swiss-ball oblique back extension","Swiss-ball pullover"],
        
            ["Resistance band close row"],
        
            ["Bent over row (no weights)"]
        ]
    
    var details = [
        // First section
        [//Dumbbell bent-over row
         """
Step A

Grab a dumbbell with your weaker hand and hold it at arm's length in front of your legs, palm facing in. Place your nonworking arm behind your back.

Step B

Tighten your core and push your hips back until your torso is at a 45-degree angle to the floor. Bend your knees slightly, but make sure your neck and head align with your back.

Step C

Pull the dumbbell up to the side of your abdomen, then lower it back to arm's length.
""",
         //Dumbbell deadlift
         """
Step A

This particular compound exercise works a wide range of muscles including your legs, glutes, abs and back. Its complexity though means that it is not intended for beginners. Stand straight with your feet hip-width apart and with a pair of heavy dumbbells on the floor in front of your toes. Bend your knees and grab the dumbbells with an overhand grip - palms facing your feet.

Step B

With your head up and back straight, slowly stand up until your legs are straight, keeping the weights close to your legs as you go.

Step C

Pause, then reverse the motion and return the weights slowly to the floor.
""",
         //Dumbbell row kickback
         """
Step A

Stand with your feet shoulder-width apart and with your knees slightly bent. Hold a light dumbbell in each hand and bend forward at the waist until your torso is almost parallel to the floor. Hang your arms straight down with your palms facing in, as illustrated.

Step B

Row the weights straight up until they reach the sides of your chest and your arms are bent at right angles. Ideally, your upper arms should be parallel to the floor.

Step C

Immediately perform a kickback manoeuvre by extending your arms straight behind you.

Step D

Squeeze your triceps, then bend your elbows to lower the weights back down so that they are along your sides once again.

Step E

Finally, lower the weights back down until your arms are hanging straight down below your shoulders.
""",
         //Dumbbell upright row
         """
Step A

With an overhand grip, grab a pair of dumbbells and stand so that your feet are shoulder-width apart with your knees slightly bent. The dumbbells should hang at full arm's length by the side of your thighs and with your thumbs pointed toward one another.

Step B

Lift your upper arms straight out to the sides by bending your elbows. Once the motion is complete, your upper arms should be parallel to the floor, with dumbbells just below chest level.

Step C

Pause, then return to the starting position.
""",
         //Incline y raise
         """
Step A

Lie on a low incline bench with your chest against the pad. Let your arms hang straight down from your shoulders, as illustrated. Turn your arms so that your palms are facing each other.

Step B

Raise your arms at a 30-degree angle to your body until they are in line with your body. You should be forming the letter "Y".

Step C

Pause, then slowly lower back to the starting position.
""",
         //One-arm row
         """
Step A

Use your non-dominant hand to hold a dumbbell. while placing your dominant hand and knee on a bench, as illustrated.

Step B

Keep your back flat as you let the dumbbell hang down to your side so your arm lines up just in front of your shoulder.

Step C

Pull the dumbbell upward and back toward your hip while keeping your elbow close to your body. Focus on using your upper-back muscles in doing this motion. Pause, then slowly return to the starting position.
""",
         //Seated bent over row
         """
Step A

Sit on the end of a bench with your knees bent feet flat on the floor and place a pair of dumbbells on the floor at your sides. Bend forward at the waist as far as you can until your back is almost parallel to the floor - your chest should touch your legs. Reach down, grab a weight in each hand, and let your arms hang straight down.

Step B

Turn the weights so that your palms face in.

Step C

Without moving anything but your arms, slowly pull the dumbbells up close to your body to the sides of your chest.

Step D

Hold for a second, then lower the weights back down.
""",
         //Seated reverse fly
         """
Step A

Sit on the front edge of a bench while holding a pair of fairly light dumbbells. Lean forward at the hips to get your chest as close to your thighs as you can without rounding your back.

Step B

As you hold the dumbbells with a neutral grip., let your arms hang down from your sides in line with your cables.

Step C

Raise the dumbbells up to either side of your body by making a wide, arcing motion with your arms until they are parallel to the floor and your elbows are just below shoulder level. Your wrists should be in the same plane as your ears before you return to your original position.

Variations: Changing your grip from neutral to under-hand-grip directs the workout toward your external rotators while switching to an overhand grip shifts more work to your rear delts.
""",
         //Swiss-ball close row
         """
Step A

Grab a pair of dumbbells and lie face downward on a swiss-ball with your arms straight out and your palms facing inward.

Step B

Lift the dumbbells upward toward your chest, allowing your elbows to bend but keep them parallel and beside your side.

Step C

At the peak point, squeeze your shoulder blades together to get the maximum effect. Then lower your arms back to the starting position.
""",
         //Swiss-ball pullover
         """
Step A

Lie on a swiss-ball with your knees bent and feet flat on the floor. The only things touching the ball should be your head, shoulders and neck - your lower back should be off of the ball. Push your hips up so that your torso and thighs form a straight line - parallel to the floor - with your legs bent at right angles.

Step B

Grab a dumbbell and wrap your thumbs and forefingers around the end of the weight, then press it up above your chest with both hands. Your palms should be flat against the inside plate of the dumbbell.

Step C

With your elbows slightly bent, slowly sweep the weight back behind your head as far as is comfortable - your upper arms should end up alongside your ears.

Step D

Reverse the motion by sweeping your arms forward - keeping them fixed as you go - until the weight is back over your chest
""",
         //Weighted chop
        """
Step A

Stand straight with our feet shoulder-width apart and hold a light dumbbell with both hands around the handle as illustrated. Twisting to the right, turn to your right and raise your arms overhead so that the weight is directly over your right shoulder your left heel should rise off the floor as you pivot.

Step B

Starting from this position, squat down and rotate your torso to your left as you simultaneously "chop" the dumbbell across and down to your left.

Step C

When the weight reaches the outside of your left ankle, reverse the motion and return to the starting position where the weight is above your right shoulder. After the set is finished, switch positions so that you are twisting to your right • starting with the dumbbell over your left shoulder and twist down to the right.
"""],
        
        //Second section
        
            [//Barbell bent-over row
              """
Step A

With your feet shoulder-width apart and your knees bent roughly 15 to 30 degrees, keep your torso straight with a slight arch in your back as you lean forward at the hips. Your torso should be, at this point, roughly parallel to the floor. Grab the barbell off the floor using a false overhand grip (thumbs should be in line with the rest of your fingers) that's slightly wider than shoulder width Let this bar hang at arm's length in front of you.

Step B

Slowly retract your shoulder blades as to have the bar pull up to the lower part of your sternum. Try not to use your arm muscles, and focus on getting the most activity out of your middle-back muscles.

Step C

Pause at the top where your chest should be sticking out toward the bar. Then, slowly return to the starting position while keeping your torso in the same position throughout the movement. Remember that your bent knees should provide all of the suspension your torso requires to be steady.
""",
              //Barbell side bend
              """
Step A

Stand upright with your feet slightly wider than shoulder-width and hold a barbell behind your neck. Place the barbell so that it rests on your shoulders and trapezius muscles, as illustrated.

Step B

While holding on, bend to one side while keeping your legs and hips motionless. You should feel your abdominal obliques and lower back doing the work.

Step C

Return to starting position and bend the other way, then return to upright starting position once more.
""",
              //Deadlift
              """
This is a full-body exercise that works all the major muscles in the body, and especially the ones in the legs and back. It is a very difficult exercise to do, but is an excellent strength-developer when it is performed well.

Step A

Stand with your feet hip-distance apart and bend down in sitting motion until your thighs are parallel to the floor. Keep your back straight and make sure that your spine is as close to the neutral position as possible. Take an overhand grip on the bar with your hands slightly wider than a shoulder-width apart.

Step B

Exhale, draw your abdominal muscles in, and lift the bar by pushing up through your legs.

Step C

As the bar reaches your knees during the lift phase, push your hips forward to raise your torso so that you are standing tall with your arms by your sides and the bar resting on your thighs.

Step D

Hold the position for two seconds, inhale and return the weight to the floor.
""",
              //Inverted row
              """
Step A

Lay under a fixed horizontal bar by grasping it with a wide overhand grip.

Step B

Keep your body straight as you pull your body and chest up toward the bar. Pause, then return to the starting position with arms extended straight. Repeat.
""",
              //T-bar bent-over row
              """
Step A

Straddle a T-bar - row machine and grab the handles with an overhand grip. Make sure you are standing with your feet shoulder-width apart and your knees slightly bent, as shown.

Step B

Keep your back flat and bend your waist until your upper body is about 45 degrees from the vertical the bar hanging at arm's length directly below your shoulders.

Step C

Then, squeezing your shoulder blades together lift the bar as close as you can to your lower chest. Pause, then slowly lower the bar back to the starting position.
""",
              //Zercher squat
        """
Step A

Setup a bar on a rack so that it is just below your chest level. Approach the bar and place it in between your arms as illustrated and step back. Use cushioning as needed to reduce the irritation of the bar on skin.

Step B

Set your feet shoulder-width apart, and keep your knees slightly bent but your back straight as you slowly lower your body until your thighs are parallel to the floor.

Step C

Pause, then straighten back up into the starting position.
"""],
        // Third Section
            [//Assisted pull-up
             """
This is an excellent exercise for the whole back that can be performed by people of any ability. It also works the biceps muscles and forearm muscles very effectively, so it can be used as part of an arm workout.

Step A

Choose a suitable weight, then kneel or stand on the platform and grip the handles. Keep you abdominals and lower back muscles strong and slowly extend your arms until they are fully stretched. Make sure that you keep your shoulders down and retracted slightly back - this will help to keep the tension on your back muscles.

Step B

Keeping the movement under control and your elbows pulled down and back, pull yourself back up to the start position. Repeat for the desired number of reps.
""",
             //Back raise
             """
Step A

Position yourself into a back-extension station by placing your feet under the leg brace/anchor so that it is hooked there.

Step B

With your upper thighs resting on the bad, lock your hands behind your head and bend forward at the hips until your upper body is just short of being 90 degrees to the floor.

Step C

Slowly raise your torso until it's in line with your lower body, then lower it. Alternatively, you can hold onto a weight by bracing it with your arms across your chest and do the same motions.
""",
             //Cable close grip pulldown
             """
Step A

Grab a handle using a close grip with your arms extended straight overhead.

Step B

Pull the handle down to the top of your chest.

Step C

Return the handle back to the starting position by straightening your arms completely Keep your back upright and straight throughout the movement.
""",
             //Cable face pull
             """
Step A

Attach a rope handle to the high pulley cable and grab the ends with an overhand grip. Stand back so your arms are straight and the cable is taut.

Step B

Pull the rope toward your chin as you rotate your forearms toward your ears. Reverse the motion to return to the starting positon without a pause in between.
""",
             //Cable seated close row
             """
Step A

Sit slightly forward on the platform and grasp the cable attachment. Slide hips back, positioning your knees with a slight bend.

Step B

Pull the handle straight into your chest, bending at the elbows and squeezing your shoulder blades together. Remain upright throughout and do not sway during the movement.
""",
             //Cable seated high row
             """
This simple but extremely effective exercise works the back muscles that also help with posture. It is vital both that correct posture is maintained and that the weights used are not too heavy.

Step A

Sit facing the cable machine, either on the seat provided or on a stability ball, and adjust the weight stack as necessary. The cable pulley should be at around the height of your head when you are  seated. Take an overhand grip on the cables and begin to pull back, keeping your elbows high and in line with your shoulders and hands. Maintain your "tall" posture and keep your abdominal muscles tight.

Step B

Pull back until either your shoulderblades are touching or you have gone as far as your range of movement allows.

Step C

Retract and hold for a second before easing back to the start position, ensuring that your wrist, elbows, and shoulders are traveling in the same line. Repeat for the desired number of reps.
""",
             //Cable seated low row
             """
This is a very good back exercise that also isolates the upper back effectively when you retract the shoulderblades during the movement. The eccentric part of the movement also stretches the back muscles out.

Step A

Place your feet on the platform, keeping a slight bend in your knees and making your posture "tall" Grasp the handles and extend your back forward while keeping your shoulders slightly retracted and then pull your elbows in and back toward the sides of your torso - the handles should come all the way in until it reaches your navel.

Step B

Hold the position for a second before returning back out, keeping the movement under control: your arms returning to the extended position; your back going slightly forward; and with your knees slightly bent.

Step C

Repeat for the desired number of reps.
""",
             //Cable standing close row
             """
Step A

Standing upright, grasp the handle with your arms straight out in front. Get into squat position by bending your knees slightly while keeping your back flat - almost like you are about to sit back on a chair.

Step B

Pull the handle straight inward toward your chest

Step C

Release and extend your arms to return to the starting position. Remain upright throughout the motion and do not sway back and forth.
""",
             //Cable straight arm pull-down
             """
This exercise works the back well and the triceps muscles assist with the movement. The exercise should not be performed using heavy weights as doing so will compromise its effectiveness.

Step A

Stand facing the cable machine, either with your feet slightly wider than a shoulder-width or with one leg forward. Adjust the weight stack to a suitable working weight, then take an overhand grip on the straight bar with your hands about a shoulder-width apart. The starting position of the bar should be slightly higher than shoulder level.

Step B

Keeping your elbows slightly bent, brace your upper body and pull the bar down until it reaches your upper thighs - keep your arms rigid throughout.

Step C

Slowly raise the bar back to shoulder height keeping the tension on your back muscles constant and maintaining your posture.
""",
             //Chinup
             """
Step A

Start by hanging from the bar with your arms fully extended overhead. Your legs can be bent, straight or crossed behind you.

Step B

Pull yourself up until your chin is over the bar. Hold, the lower yourself to starting position. You can add weight to make it more difficult by wearing a weight belt or by holding a dumbbell between your feet.
""",
             //Lat pulldown
        """
This exercise works both the back and biceps effectively.

Step A

Sitting on a bench, grab a bar with a false overhand - thumb on the same side as your fingers - shoulder-width grip.

Step B

As you pull your shoulder blades together and down, while sticking your chest out, pull the bar to your chest. Then, pause with the bar an inch or so from your chest, and slowly let it rise to where it began. Throughout, keep your chest out.
""",
             //Machine lateral pull-down
             """
             Like the Assisted Pull-Up, this exercise not only works the back muscles but also the biceps muscles and the muscles of the forearms, improving the strength of your grip. It is a good exercise for beginners because it allows them to build up strength before progressing to body. weight pull-ups and chin-ups.
             
             Step A
             
             Adjust the kneepads to comfortably support your legs and to help stabilize weight then stand up and grip the bar with your hands a shoulder-width apart before pulling the bar back down and taking your place under the knee support.
             
             Step B
             
             Stay seated and extend your arms up and above your position, then pull the bar down until it reaches your upper chest.
             
             Step C
             
             Make sure that your shoulders are down and your elbows pulled back and hold for a second before returning to the start position.
             
             Step D
             
             Slowly extend your arms back up, stretching fully and keeping your "tall" posture. Repeat for the desired number of reps.
             """,
             //Neutral-grip pullup
             """
             Step A
             
             Hang from the parallel chinup bars using an overhand grip, with your palms facing each other. Cross your ankles behind you. Then, pull yourself up until your chest is as close to your hands as possible.
             
             Step B
             
             Pause, then slowly lower yourself to the starting position.
             """ ],
        
        
            [//Kettlebell clean
             """
Step A

Squat down and hold a kettlebell in each hand so that that it falls between your feet with your arms extended straight.

Step B

Thrust your hips forward pulling the kettlebells straight upward, catching them at shoulder height. Your elbows should be bent at the end, and the kettlebells should be held close throughout the movement. Your hips and knees should slightly dip as you absorb the weight of the rising kettlebells.
""",
             //Kettlebell high pull
             """
Step A

Squat holding a kettlebell in both hands between your feet with your arms straight.

Step B

Extend your hips while raising the kettlebell up to just below your chin, keeping your elbows above your hands. Throughout the movement, keep the kettlebell close to your body.

Step C

Pause, then return to starting position. Repeat.
""",
             //Kettlebells bent-over-row
        """
Step A

Grab hold of a pair of kettlebells and bend forward at your waist, but keep your back flat. Have your arms extended straight downward with palms facing in towards one another.

Step B

Lift the kettlebells up to the sides of your chest and return them to their extended start position while keeping your back stable and straight throughout.
"""],
        
            [//Swiss-ball close row
             """
Step A

Grab a pair of dumbbells and lie face downward on a swiss-ball with your arms straight out and your palms facing inward.

Step B

Lift the dumbbells upward toward your chest, allowing your elbows to bend but keep them parallel and beside your side.

Step C

At the peak point, squeeze your shoulder blades together to get the maximum effect. Then lower your arms back to the starting position.
""",
             //Swiss-ball oblique back extension
             """
Step A

Lie down on your chest on a swiss-ball and place your hands at the side of your head. Keep your legs extended straight behind with a small bend at the knees if needed.

Step B

Raise your chest up off the ball and rotate your upper body to one side at the same time.

Step C

Return back to starting position, and rotate to the other side. Keep the ball stable and avoid having it move.
""",
             //Swiss-ball pullover
        """
Step A

Lie on a swiss-ball with your knees bent and feet flat on the floor. The only things touching the ball should be your head, shoulders and neck - your lower back should be off of the ball. Push your hips up so that your torso and thighs form a straight line - parallel to the floor - with your legs bent at right angles.

Step B

Grab a dumbbell and wrap your thumbs and forefingers around the end of the weight, then press it up above your chest with both hands. Your palms should be flat against the inside plate of the dumbbell.

Step C

With your elbows slightly bent, slowly sweep the weight back behind your head as far as is comfortable - your upper arms should end up alongside your ears.

Step D

Reverse the motion by sweeping your arms forward - keeping them fixed as you go - until the weight is back over your chest
"""],
        
            [//Resistance band close row
        """
Step A

While standing upright, hold onto the handles of a resistance band with your arms straight out in front of your at the level of your shoulders. Ensure the resistance band is wrapped around an object to provide resistance

Step B

Pull the handles straight into your chest by bending your elbows and squeezing your shoulder blades together. Throughout the movement, hold steady and remain straight upright.
"""],
        
            [//Bent over row (no weights)
        """
Step A

Place a fairly heavy (ie. packed) suitcase before you - or anything else that is roughly the same Stand with your legs normally apart, then bend over at your hips with your knees bent but keep your back flat. Grab the side of the bag.

Step B

Use your back and biceps to pull the suitcase up to your chest. Try to keep the suitcase close to your chest during the movement. Pause, then slowly return to the starting position.
"""]
        ]
    
    var pictures = [
        
        ["Dumbbell bent-over row","Dumbbell deadlift","Dumbbell row kickback","Dumbbell upright row","Incline y raise","One-arm row","Seated bent over row","Seated reverse fly","Swiss-ball close row","Swiss-ball pullover","Weighted chop"],
        
            ["Barbell bent-over row","Barbell side bend","Deadlift","Inverted row","T-bar bent-over row","Zercher squat"],
        
            ["Assisted pull-up","Back raise","Cable close grip pulldown","Cable face pull","Cable seated close row","Cable seated high row","Cable seated low row","Cable standing close row","Cable straight arm pull-down","Chinup","Lat pulldown","Machine lateral pull-down","Neutral-grip pullup"],
        
        
            ["Kettlebell clean","Kettlebell high pull","Kettlebells bent-over-row"],
        
            ["Swiss-ball close row","Swiss-ball oblique back extension","Swiss-ball pullover"],
        
            ["Resistance band close row"],
        
            ["Bent over row (no weights)"]
        ]
    
    var currenttableView: Int!
    
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.backBtn.setTitle("", for: .normal)
        currenttableView = 0
    }
    
    class func identifier() -> BackViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BackViewController") as! BackViewController
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ArmsDetailViewController") as? ArmsDetailViewController{
            vc.name = self.data[currenttableView][indexPath.row]
            vc.details = self.details[currenttableView][indexPath.row]
            vc.images = self.pictures[currenttableView][indexPath.row]
            vc.category = self.category
            vc.subCategory = self.subCategory
            vc.isFromCustomsController = self.isFromCustomsController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[currenttableView].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BackCell")
        cell?.textLabel?.text = data[currenttableView][indexPath.row]
        return cell!
    }

 
    @IBAction func switchTableViewAction(_ sender: Any) {
        currenttableView = (sender as AnyObject).selectedSegmentIndex
        tableView.reloadData()
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }
}
