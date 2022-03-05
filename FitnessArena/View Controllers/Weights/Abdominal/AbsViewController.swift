//
//  AbsViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-14.
//

import UIKit

class AbsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var category = ""
    var subCategory = ""
    var isFromCustomsController : Bool = false
    
    var data = [
        
        ["Cycle crunch","Dumbbell bench twist","Dumbbell leg lift","Dumbbell side bend","Dumbbell toe touch","Dumbbell torso twist","Dumbbell woodchopper","Golf squat","Swiss-ball torso twist","Twisting shoulder press","Walking lunge twist","Weighted chop","Weighted crunch"],
        
            [ "Bar crunch","Barbell cable rollout","Barbell rollout","Barbell side bend","Standing torso twist","Standing weighted russian twist"],
        
            ["Ab crunch machine","Barbell cable rollout","Cable kneeling twisting crunch","Cable standing crunch","Cable torso rotation","Cable woodchopper","Hanging knee raise","Hanging leg raise","High woodchopper","Incline reverse crunch","Kneeling cable crunch","Standing oblique crunch"],
        
            ["Kettlebell crunch","Kettlebell russian twist","Kettlebell side bend"],
        
            ["Ab crunch on a ball","Bosu crunch","Bosu pushup","Bosu russian twist","Bosu side bridge","Bosu sit-up","Figure-8 crunch","Jackknife","Medicine ball decline crunch","Medicine ball toe touch","Seated twist","Swiss-ball crunch","Swiss-ball oblique crunch","Swiss-ball pike pushup","Swiss-ball plank","Swiss-ball reverse crunch","Swiss-ball torso twist","Swiss-ball trunk rotation","Weighted swiss-ball crunch"],
        
            ["Resistance band crunch","Resistance band hip raise","Resistance band kneeling crunch","Resistance band side bend"],
        
        [ "Abdominal reverse curl","Abdominal twist","Bench leg raise","Bench side bridge","Bicycle kick","Bridge crunch","Burpees","Clam","Crunch twist","Decline twisting ab crunch","Dragon flag","Elevated-feet plank","Flutter kicks","Incline plank","Kneeling plank","Leg climb crunch","Lying heel touch","Modified v-sit","Mountain climbers","Oblique v-up","Plank","Prone cobra","Pulse up","Raised leg crunch","Reverse crunch","Rollback","Russian twist","Saxon side bend","Seated jackknife","Side bridge","Side crunch","Side plank","Situp","Sprinter","Standing knee raise","Steam engine","Superman","Toe touch","Traditional crunch","Twisting crunch","Twisting hip raise","Twisting windmill","V-up","Weighted swiss-ball crunch","Wheel rollout"]
        ]
    
    var details = [
        // first section
        [//Cycle crunch
         """
Step A

Place a mat on the floor (it helps) and lie flat on your back with your legs bent and feet flat on the floor - as illustrated. Hold a dumbbell at either end and let it rest on your chest.

Step B

Hold the dumbbell in place as you slowly curl you head and shoulders off the floor and hold the elevated position for the remainder of the exercise.

Step C

Slowly pull your left knee in toward your chest as you extend your right leg straight out about 2 inches off the floor.

Step D

Now reverse this by extending your left leg while simultaneously pulling in your right knee to your chest - as if you are riding a bicycle on your back.

Step E

Keep alternating legs while keeping your head elevated. When done, lower back to the starting position with your head flat against the mat.
""",
         //Dumbbell bench twist
         """
Step A

Lie down on an exercise bench so that your torso is hanging off the end of the bench and you can bend at the waist. Hold onto a fairly light dumbbell at both ends and place it near your chest - with elbows extended to the sides.

Step B

Bending at the waist, raise your torso up until your body is perfectly straight and parallel to the floor.

Step C

Slowly turn your torso to your left, then lower yourself back down. Repeat the move but turn to the opposite side (right).
""",
         //Dumbbell leg lift
         """
Step A

Place a mat on the floor, and lie flat on your back with your legs extended straight. Place a dumbbell between your feet (as illustrated) and tuck your hands in underneath your sides to help provide stability.

Step B

Keep your legs together as you slowly raise both legs up until your heels are 15 inches or so off the ground.

Step C

Pause, then slowly lower your legs back down but stop before the weight touches the floor. Focus on using your abdominal muscles to complete the movement. Repeat.
""",
         //Dumbbell side bend
         """
Step A

While standing upright, hold a dumbbell with one arm. Place your other hand on your waist for support.

Step B

Bend gradually toward the side holding the dumbbell - bending only at your side.

Step C

Return to starting upright position. Switch the weight to the other arm and repeat with the other side.
""",
         //Dumbbell toe touch
         """
Step A

While on your back, hold a single light dumbbell in both hands. Raise your legs until they are perpendicular to the floor. Extend your arms upward, ensuring that the dumbbell is roughly held over your chest.

Step B

Keep your legs stable without placing a bend as you lift your chest and shoulders off the floor to try to touch your feet with the dumbbell.

Step C

Return to starting position and repeat.
""",
         //Dumbbell torso twist
         """
Step A

With both hands, hold a single dumbbell close to your chest with your elbows bent, as illustrated Your feet should be shoulder-width apart.

Step B

Twist your waist to one side, allowing yourself to turn your head and shoulders while keeping your feet motionless.

Step C

Twist your waist to the other side gradually, trying to avoid using momentum for the motion and focusing more on using the power of your abdominal oblique muscles.

Step D

Return to starting position.
""",
         //Dumbbell woodchopper
         """
Step A

With arms nearly straight and feet just beyond shoulder-width apart, hold a dumbbell over your right shoulder.

Step B

Bend your knees and forcefully rotate your torso left as you draw your arms down and across your body. When your hands go past your left ankle, reverse the motion. Then switch sides. Keep your abs tight to prevent injury.
""",
         //Golf squat
         """
Step A

Using both hands, hold a dumbbell by the top end. Make sure that your arms are hanging straight down in front of you as you stand.

Step B

Slowly squat down until your thighs are nearly parallel to the floor.

Step C

Move back into standing position while simultaneously twisting your torso to the right. As you go, swing the weight up in a controlled motion and to the right side so that it ends up over your right shoulder. At the peak point, your left heel should be rising off the floor due to the extension.

Step D

Carefully lower the weight back down in front of you, then squat down and repeat the exercise this time standing up and twisting to the left.
""",
         //Swiss-ball torso twist
         """
Step A

Lie on a swiss-ball so that your back is centered on the ball. Hold one dumbbell with both hands and extend them over your chest, as illustrated.

Step B

While keeping your arm extended straight at all times, rotate your body to one side.

Step C

Rotate back to starting position and then to the other side and back.
""",
         //Twisting shoulder press
         """
Step A

Hold a pair of dumbbells slightly greater than shoulder-width apart at the level of your jaw. Palms should be facing in towards your body.

Step B

Press the dumbbells overhead as you twist your torso to the left.

Step C

Lower the dumbbells as you twist back to the center, then press upward again while twisting to the right. Repeat.
""",
         //Walking lunge twist
        """
Step A

Hold a 10-25 pound plate out in front of you, and stand with your feet hip-width apart, as illustrated The weight plate should be positioned in front of your chest with your elbows slightly bent.

Step B

With your right leg, lunge forward about 3 feet until your right thigh is parallel to the floor and your left knee is nearly touching the floor. At the same time, twist your upper body roughly 90 degrees to the right.

Step C

Twist and step back to the start position, then repeat, stepping with the left leg and twisting to the left. As you do the exercise, you will be "walking" across the floor, so make sure you have a clear path in front of you.
""",
         //Weighted chop
         """
        Step A
        
        Stand straight with our feet shoulder-width apart and hold a light dumbbell with both hands around the handle as illustrated. Twisting to the right, turn to your right and raise your arms overhead so that the weight is directly over your right shoulder your left heel should rise off the floor as you pivot.
        
        Step B
        
        Starting from this position, squat down and rotate your torso to your left as you simultaneously "chop" the dumbbell across and down to your left.
        
        Step C
        
        When the weight reaches the outside of your left ankle, reverse the motion and return to the starting position where the weight is above your right shoulder. After the set is finished, switch positions so that you are twisting to your right, starting with the dumbbell over your left shoulder and twist down to the right
        """,
         //Weighted crunch
        """
              Step A
              
              While holding a dumbbell on your chest, lie on the floor with your knees bent.
              
              Step B
              
              Flex your waist to raise your upper torso from the ground. Keep your lower back on the floor as you raise your torso up as high as possible.
              
              Step C
              
              Return back to starting position. Repeat.
              """],
        
            [
                // second section
                //Bar crunch
              """
Step A

Lie on a bench, knees bent, feet together, with an empty bar held above, shoulder-width apart.

Step B

Keep your elbows straight as you crunch up by lifting your upper back and shoulders off the bench. Keep the bar extended upward.

Step C

Slowly return to the start position and repeat.
""",
              //Barbell cable rollout
              """
Step A

Place an ankle strap around the middle of the barbell and attach it to the low pulley. Select a light cable weight to begin.

Step B

Kneel with your back to the weights and the cable running between your legs. Grab the barbell with an overhand, shoulder-width grip, as illustrated.

Step C

Roll the bar away from you and follow its path with your arms straight. Go as far forward as you can go. The cable should help in pulling the weight back, but provides resistance to the negative portion of the exercise.

Step D

If you wish, you can try it it other way by kneeling on the opposite side of the bar, facing the weight stack, and feel the resistance as you pull it toward you, but none as you roll it out.
""",
              //Barbell rollout
              """
Step A

Kneel on an exercise mat with your shoulders directly over a barbell loaded with 2.5kg plates. Use an overhand, shoulder-width grip.

Step B

Roll the bar out in front of you, keeping your arms straight and your knees in place as your hips, torso and arms go forward. Advance as far as you can without arching your back.

Step C

Pause, then pull back to the starting position.
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
              //Standing torso twist
              """
Step A

While holding a barbell resting on the back of your shoulders, bend over at your waist.

Step B

Turn to one side by twisting your torso and head and shoulders.

Step C

Twist back to the starting position and repeat with the opposide side.
""",
              //Standing weighted russian twist
        """
Step A

Stand upright and use both hands to hold a barbell weight in front of your body at chest height.

Step B

Twist your torso in one direction and hold for a second at the further point of extension. Throughout the movement, maintain the positioning of the weight in relation to your chest.

Step C

Turn back to starting position.

Step D

Twist your torso in the other direction and hold. Return to starting position and repeat.
"""],
        
            [//Ab crunch machine
             """
Step A

Sit in position with back against the pad, feet locked behind the feet pads, and reach overhead to grab the handles.

Step B

Pull on the handles while lifting with your feet, but most of the power should come from contracting your abdominal muscles.

Step C

In a well controlled manner, return to starting position gradually as you focus on releasing your tightened abs.
""",
             //Barbell cable rollout
             """
Step A

Place an ankle strap around the middle of the barbell and attach it to the low pulley. Select a light cable weight to begin.

Step B

Kneel with your back to the weights and the cable running between your legs. Grab the barbell with an overhand, shoulder-width grip, as illustrated.

Step C

Roll the bar away from you and follow its path with your arms straight. Go as far forward as you can go. The cable should help in pulling the weight back, but provides resistance to the negative portion of the exercise.

Step D

If you wish, you can try it it other way by kneeling on the opposite side of the bar, facing the weight stack, and feel the resistance as you pull it toward you, but none as you roll it out.
""",
             //Cable kneeling twisting crunch
             """
Step A

Attach a rope handle to a high cable pulley and grasp the cable rope attachment with both hands. Place your wrists against the side of your head. Flex your hips to allow the resistance on the cable pulley to lift your torso upward so that your spine is hyperextended.

Step B

Curl your head and torso down to one side towards your knees, keeping your hands at the sides of your head.

Step C

Hold, then return to the upright starting position and repeat to the other side.
""",
             //Cable standing crunch
             """
Step A

Attach a rope handle to a high cable pulley and stand upright with your back to the weight stack. Hold the ends of the rope in each hand by the sides of your head.

Step B

Curl your head and torso down to your midsection while remembering to keep your hands by the side of your head.

Step C

Hold, then return to the upright starting position.
""",
             //Cable torso rotation
             """
Step A

Standing upright and facing to one side, hold a cable using both hands.

Step B

Twist to the opposite side, turning your head and shoulders in the process, but keep your arms straight.

Step C

Twist back to the starting side, focusing on only moivng your hips and shoulders. Remember to keep your arms straight throughout the movement.
""",
             //Cable woodchopper
             """
Step A

Take a stirrup handle, and attach it to the pulley. Grab it with both hands firmly, and stand with your left side toward the cable station and your feet shoulder-width apart. Hold onto the handle as if you are about to swing an axe.

Step B

Then, pull the rope down so that it crosses your torso. Bend and twist your waist to ensure that the handle ends up on the far side of your right calf. Pause while at the bottom, and then slowly straighten your body posture, as you return to starting position.

Step C

Finish the number of repetitions you wish to do, then repeat wit your right side toward the weight track.
""",
             //Hanging knee raise
             """
Step A

Hold onto the parallel bars of a dip station using a neutral grip and lift yourself upward so that your arms are straight.

Step B

Use your lower abdominal muscles to pull your hips up and curl them in toward your chest so that your knees are as close to your chest as possible.

Step C

Pause, feel the lower abdominal contraction, then slowly return to the starting position.
""",
             //Hanging leg raise
             """
Step A

While holding onto a chinup bar using an overhand grip, hang with your knees bent slightly.

Step B

Pull your hips up as you curl inward toward your chest using the muscles of your lower abs. Life your knees as close to your chest as possible, rounding your lower back at the top. Then, pause. feel the contraction in your lower-abdominal muscles, and return to the position you began with.
""",
             //High woodchopper
             """
Step A

Attach a rope handle to the high cable and grab the rope with a hand-over-hand grip. Stand sideways, about 3 feet from the weight stack, and hold the rope over your shoulder, like an ax you are going to swing.

Step B

Bend and twist at the waist, bringing your hands down and across your torso so they end up on the far side of your outside calf. Let your feet pivot slightly with the movement, to protect your knees.

Step C

Pause at the bottom, then slowly straighten back to the starting position. Finish the reps on that side, then repeat with your opposite side toward the weight stack.
""",
             //Incline reverse crunch
             """
Step A

Lying on a slant board, with your hips lower than your head, keep your knees slightly bent.

Step B

Slowly pull your hips upward and inward, like you would if emptying a bucket of water resting on your pelvis. Keep your knees at the same angle throughout the movement

Step C

Pause, then slowly lower your hips to the starting position.
""",
             //Kneeling cable crunch
             """
Step A

Attach to the high pulley, the rope handle, and grab onto it. While facing the machine, kneel in front of the weights with your butt near your heels, but not resting on them. Hold the ropes at the sides of your face with your elbows pointing straight down to the floor.

Step B

Bring your rib cage toward your pelvis, making sure to avoid moving other parts of your lower body from the original position. Pause as your elbows near your knees, the return to starting position. Repeat.
""",
            //Standing oblique crunch
            """
             Step A
             
             Attach a stirrup handle to the high cable and stand beside the weight stack as shown.
             
             Step B
             
             Grab the handle with your inside hand and pull down on the cable so that your palm is in line with your head and your elbow points straight downward.
             
             Step C
             
             Crunch your rib cage sideways toward your hip bone on the same side as the arm holding the pulley while keeping your hand in the same position relative to your head. Pause, then slowly straighten your back. Finish the repetitions on one side before doing the same on the other side.
             """],
        
            [//Kettlebell crunch
             """
Step A

Lie on your back with your knees bent and feet flat on the floor. Hold a kettlebell in both hands at the level of your upper chest.

Step B

Lift your head and shoulders off the floor, keeping your knees bent and feet flat on the floor.

Step C

Lower your head and shoulders. Repeat.
""",
             //Kettlebell russian twist
             """
Step A

Sit on the floor with a kettlebell at your side. Put your legs together and bend your knees. Keep your chest lifted and back straight.

Step B

Pick up the kettlebell, holding it upside down by the handles for better control. It should be at chest height.

Step C

Lean back slightly, being careful not to round your back. Lift your feet off the floor but keep your knees together and legs bent.

Step D

Quickly twist from side to side, leading with the kettlebell. Your entire chest and head region should rotate while your legs stay stationary. Squeeze your abs throughout the exercise.
""",
             //Kettlebell side bend
        """
Step A

Stand straight upright, holding a kettlebell by your side with your arm extended straight down.

Step B

Bend sideways to the opposite side, then return to your original position.

Step C

Hold a kettlebell in the other hand now, and bend to its opposing side.
"""],
        
            [//Ab crunch on a ball
             """
The basic movements of this exercise develop the strength of the abdominal muscles, while the use of the ball helps increase stability.

Step A

Slowly roll down onto the ball, letting your spine follow its curve, and place your head and neck in a comfortable position on its back. Place your hands at the sides of your head and position your feet hip-distance apart.

Step B

Draw your abdominal muscles, then exhale and curl your entire spine up, starting from the neck. Flex at your torso until the distance between the top of your pelvis and the bottom of your ribs stops shortening.
""",
             //Bosu crunch
             """
Step A

Place a BOSU ball on the floor and lie with your back on it. Keep your knees bent, feet flat, and place your hands to the sides of your head.

Step B

Lift your head and shoulders off the BOSU, keeping your feet flat on the floor throughout the movement. Resist the urge to pull your head up with your hands - focus on using your abdominal and core muscles to do the work.

Step C

Lower to the starting position and repeat.
""",
             //Bosu pushup
             """
Step A

Flip a Bosu ball over so that the rounded portion is facing the floor. Position your hands on the sides of the platform.

Step B

Brace your abdominal and core muscles as you lower yourself so that your chest nearly touches the bal. Tuck your elbows as you lower your body so that your upper arms form a 45-degree angle with your body at the bottom of the movement.

Step C

Pause at the bottom, then push yourself back to the starting position. Do not allow your hips to sag at any point during the movement and repeat.
""",
             //Bosu russian twist
             """
Step A

Begin by sitting on a BOSU ball in situp position with your feet raised up off the floor and a slight bend in your knees. With your hands, hold a medicine ball at your chest level.

Step B

Once you find your balance, twist your upper body to one side, lowering the medicine ball towards the ground, as illustrated.

Step C

Twist your torso to the other side, keeping your feet up and as stationary as possible throughout the motion.
""",
             //Bosu side bridge
             """
Step A

Place a BOSU on the floor, and rest one hand on it while extending your legs straight out - one foot on top of the other.

Step B

Raise your top leg upward. Keep your body and the raised leg straight throughout the movement.

Step C

Return to the starting position and repeat with the other leg.
""",
             //Bosu sit-up
             """
Step A

Begin by lying on the BOSU ball with your hips just off the edge of the ball. Place your hands behind your head to gently support your neck.

Step B

Exhale and curl your upper body over the BOSU ball. Hold for a brief second at the top, before slowly returning to the starting position.

Step C

Move in a slow and controlled fashion. Try to keep your hips still. Focus on moving your spine only, not your hips.
""",
             //Figure-8 crunch
             """
Step A

Lie on your back with your feet flat on the floor and your knees bent at a 90-degree angle, with a light medicine ball squeezed tightly between them.

Step B

Place your hands behind your ears and slowly raise your head, shoulders, and feet off the floor. Now move your knees in a wide figure-8 motion.
""",
             //Jackknife
             """
Step A

Get into a pushup position with tops of your feet and your shins on the ball and your hands on the floor.

Step B

Pull your knees close to your chest, letting the ball roll slightly forward. Keep your arms straight, and squeeze your abs hard at the top.
""",
             //Medicine ball decline crunch
             """
             Step A
             
             Sit on a decline bench with your feet hooked underneath the rollers and hold a medicine ball at your chest with both hands, elbows close to your sides. Your back should be flat on the bench.
             
             Step B
             
             In a controlled manner, slowly curl up along the bench, lifting one vertebra at a time off the pad. When your back is fully off the bench, slowly return back to the starting laying positing by reversing the motion.
             """,
             //Medicine ball toe touch
             """
Step A

Lie on your back with your arms and legs straight up in the air holding a ball in your hands.

Step B

Reach the ball towards your toes, lifting your head and shoulders off the floor. Remember to focus on using your ab muscles to pull yourself up, as opposed to using momentum.
""",
             //Seated twist
        """
Step A

Sit upward with your back straight up but leaning slightly towards the floor, with your knees bent 90 degrees.

Step B

Hold a medicine ball close to your chest as you rotate your torso to the left. Then, place the ball on the floor behind you.

Step C

Rotate around to the right, pick up the ball, rotate left, and place it behind you. Keep your head in line with your torso throughout the movement, and perform it as quickly as possible.

Step D

Repeat.
""",
             //Swiss-ball crunch
             """
             Step A
             
             Lie on your back on the ball with your feet flat on the floor. Lower your head as far as you can. Hold your hands behind your ears.
             
             Step B
             
             Use your abdominal muscles to pull your torso to a sitting position. Pause, then slowly lower yourself.
             """,
             //Swiss-ball oblique crunch
                          """
                          Step A
                          
                          Lie sideways on the ball, ensuring that you keep your legs straight. Brace your feet against a wall for support and hold your hands behind your ears.
                          
                          Step B
                          
                          Lift your shoulder and crunch sideways toward your hip. Hold for a second before releasing. Try not to twist your body.
                          """,
             //Swiss-ball pike pushup
                          """
                          Step A
                          
                          Kneel on the floor in front of a swiss-ball and slide forward so that you are lying over the ball with the ball situated just under your thighs. Contract your abdominals so that your back remains straight. Slowly walk forward with your hands until your feet are resting on the ball. Slowly raise your butt toward the ceiling as the ball moves toward your hands and maintain the position.
                          
                          Step B
                          
                          Slowly bend your elbows to lower yourself toward the floor.
                          
                          Step C
                          
                          Push back up to the start position.
                          """,
             //Swiss-ball plank
                          """
                          Step A
                          
                          Begin by getting into pushup position, but bend your elbows and rest your weight on your forearms instead of using your hands as illustrated. Your body should form a straight line from your shoulders down to your ankles. Have your feet elevated on a swiss-ball as shown.
                          
                          Step B
                          
                          Brace your core by contracting your abdominal muscles in this position. Hold for roughly 30seconds, then release.
                          """,
             //Swiss-ball reverse crunch
                          """
                          Step A
                          
                          Lie on your back on a swiss ball with knees bent fet off the floor, and hands reaching overhead holding onto a bench for support.
                          
                          Step B
                          
                          Keeping your head and neck relaxed, use your lower-abdominal muscles to raise your hips off the ball and toward your rib cage.
                          
                          Step C
                          
                          Slowly lower your hips back to the starting position. As they lightly touch the ball, repeat.
                          """,
             //Swiss-ball torso twist
                          """
                          Step A
                          
                          Lie on a swiss-ball so that your back is centered on the ball. Hold one dumbbell with both hands and extend them over your chest, as illustrated.
                          
                          Step B
                          
                          While keeping your arm extended straight at all times, rotate your body to one side.
                          
                          Step C
                          
                          Rotate back to starting position and then to the other side and back.
                          """,
             //Swiss-ball trunk rotation
                          """
                          Step A
                          
                          Sit upright on a swiss-ball and place your hands on your hips.
                          
                          Step B
                          
                          While keeping your feet flat, lean to one side as far as possible without tipping, and rotate in a big circle.
                          
                          Step C
                          
                          After one full rotation, change direction and rotate the other way.
                          """,
             //Weighted swiss-ball crunch
                          """
                          Step A
                          
                          Lie on your back on a swiss ball, holding a weight plate across your chest.
                          
                          Step B
                          
                          Raise your head and shoulders and crunch your rib cage toward your pelvis.
                          
                          Step C
                          
                          Pause, then slowly return to the starting position.
                          """],
        
            [//Resistance band crunch
             """
Step A

Wrap resistance band around an object, or have someone hold it for you at the middle. While lying on your back with your feet raised and knees bent, hold the resistance band handles by the side of your head.

Step B

Lift your head and shoulders off of the floor while making sure to keep your knees bent and your legs steady.

Step C

Lower your head and shoulders to the starting position and repeat.
""",
             //Resistance band hip raise
             """
Step A

Lying on your back, extend your legs straight up toward the ceiling with the resistance band placed over your heels. Hold the handles of the band on the floor, as illustrated so that the band is fairly firm.

Step B

Push your feet upwards toward the ceiling by raising your hips off of the floor. Keep your hands locked in position and steady.

Step C

Return to the starting position and repeat.
""",
             //Resistance band kneeling crunch
             """
Step A

Loop the resistance band over any stationary object. Ensure the bands are anchored high enough to provide resistance. From a kneeling position, place the resistance band handles against the forehead area.

Step B

Crunch your abdominal muscles as you move your elbows toward the middle of your thighs. Exhale as you contract the abs and try to keep your hips still.

Step C

Slowly return to the starting position and repeat.
""",
             //Resistance band side bend
        """
Step A

Hold a resistance band by both ends and loop it under the arches of your feet so you are standing on the middle of the band with feet shoulder width apart. Raise the handles so that they are overhead with your arms fully extended.

Step B

Bend sideways toward one direction while keeping your arms extended straight. Keep both feet planted flat on the floor and hold for a second.

Step C

Return to starting upright position. Repeat the same motion, but with the other side.
"""],
        
            [ //Abdominal reverse curl
              """
This exercise works the lower of your abdominal muscle and when performed correctly can eliminate the use of other muscles to cheat the movement.

Step A

Lie flat on a bench and reach back to hold on to the underside of the bench behind your head. Bend your legs at the knee, raising your feet off the bench so that your knees are over your hips.

Step B

Slowly draw your abdominal muscles toward your spine, then slowly exhale and push your spine into the bench - start with your lower back and make the movement flow up your spine until your hips roll up off the bench.

Step C

Imagine that the bench is made of soft plastic and try to leave an imprint of your spine in it.

Step D

When you have rolled the full length of your spine, inhale slowly and return to the starting position, pushing your spine into the bench as you roll back down.
""",
              //Abdominal twist
              """
Step A

Lie on your back, extend your legs straight up, and place your hands out to your sides at the level of your shoulders.

Step B

While keeping your upper body stable, roll your legs downward toward one side - bringing your feet toward the floor.

Step C

Roll your legs back up to the starting position and toward the opposite side. Then, return to the upright position again.
""",
              //Bench leg raise
              """
Step A

Lie on a bench with legs extended straight, and hold on to the top of the bench.

Step B

Raise your legs straight up, slightly lifting your lower back off the bench.

Step C

Hold for a few seconds, then lower your legs back down to the start positon. Keep your legs straight throughout the motion.
""",
              //Bench side bridge
              """
Step A

Lie on your side and brace yourself against a bench with your arm, as illustrated. Keep your feet on the floor with legs straight and on top of one another.

Step B

Raise your body upward, focusing on keeping your body in a straight line and using your abdominal muscles to lift yourself. Your arms should mostly be used for support, not as a source of force.

Step C

Return to starting position.
""",
              //Bicycle kick
              """
Step A

Lie on your back, and bend your knees at 90 degrees so that your thighs are pointing toward the ceiling. Place your hands behind your ears.

Step B

Pump your legs back and forth, as if riding a bicycle. Simultaneously, rotate your torso from side to side by moving an armpit, but not elbow, up toward the opposite knee.
""",
              //Bridge crunch
              """
Step A

Lie on your back wit your knees bent and feet flat on the floor. Place your hands by the side of your head and lift your hips off the floor so that you form a straight line from your shoulders to your hips (as illustrated)

Step B

Lift your head and upper shoulders off the flooor while keeping your feet flat on the floor.

Step C

Hold, then return to the starting position.
""",
              //Burpees
              """
Step A

Start from standing position. Squat in position and place your hands on the ground.

Step B

Kick out both your feet so you are now in push-up position.

Step C

Jump your feet back into the previous squat position by bringing your legs close to your chest.

Step D

From the squatting position, jump upward into the air with your arms extended overhead.

Step E

Land into squat position and repeat from the beginning.
""",
              //Clam
              """
Step A

With your back flat on the floor, bend your knees and hips at right angles, as illustrated. Your hands should be behind your head with elbows out toward your sides.

Step B

Slowly lift your head and shoulders off the floor, as if doing a crunch, but also ensure that your hips are coming off the floor by crunching your knees up towards your chest.
""",
              //Crunch twist
              """
Step A

Lie on your back on the floor and raise your head and upper shoulders off the mat slightly. Lace you fingers from both hands together behind your inclined head for support while keeping your elbows wide apart. Do NOT bend your head toward your chest, keep it perpendicular to your torso but bend your knees 90 degrees, and raise your feet 1-2 inches off of the floor.

Step B

While twisting your torso to the left so that your right elbow moves toward your left knee, contract your stomach muscles. Ensure that you are lifting your left shoulder off the floor. At the height of the movement, pause, then slowly return to your starting position without relaxing your muscles. Alternate between leftward and rightward twists.
""",
              //Decline twisting ab crunch
              """
Step A

Lie back on a decline bench and hold a medicine ball with both hands at chest level.

Step B

Raise your head and shoulders off the bench while twisting to one side, simultaneously. Use slow, controlled motions and focus on utilizing your abdominal muscles - not your lower back.
""",
              //Dragon flag
        """
Step A

Lie face-up on a bench with your hands grasping a sturdy object behind you for support.

Step B

Lift your entire body up in a straight line, stacking it vertically over your shoulders. The aim is to keep your body straight, so avoid bending at the hips. Then slowly lower back down until parallel to the bench. Repeat.
""",
              //Elevated-feet plank
              """
Step A

This exercise makes the traditional plank more
difficult to perform. Get into the traditional plank
position, but place both your feet on a bench, as
illustrated.

Step B

Brace your core by contracting your abdominal
muscles in this position. Hold for roughly 30
seconds, then release.
""",
              //Flutter kicks
                            """
              Step A
              
              Lay flat on the floor or mat with your legs fully extended. Place your hands by your sides and lift your legs slightly off the ground while keeping them fully extended.
              
              Step B
              
              Lightly raise one leg above the other while keeping the knee straight. Then bring that leg down and bring the other up. Repeat.
              """,
              //Incline plank
                            """
              Step A
              
              This exercise makes the traditional plank easier to perform, since you do not have to support as much body weight. Pretend you are about to do pushups off of a bench, but place your forearms on the bench instead. Your elbows should be placed so that your arms and torso form a 90-degree angle between one another.
              
              Step B
              
              Brace your core by contracting your abdominal muscles in this position. Hold for roughly 30seconds, then release.
              """,
              //Kneeling plank
                            """
              Step A
              
              Start to get into a pushup position, but bend your elbows and rest your weight on your forearms instead of on your hands. Then, bend your knees so that they help support your body - this makes performing the traditional plank exercise easier to perform. Your body should form a straight line from your shoulders to your knees.
              
              Step B
              
              Brace your core by contracting your abdominal muscles in this position. Hold for roughly 30seconds, then release.
              """,
              //Leg climb crunch
                            """
              Step A
              
              Lie flat on your back on the floor or mat with your legs extended straight. Raise one leg up straight up, while keeping the other flat on the floor.
              
              Step B
              
              Crunch your abdominal muscles as you bend over and take hold of the raised leg below the knee with both hands.
              
              Step C
              
              Walk your hands up the leg to the ankle and then back down. Repeat.
              """,
              //Lying heel touch
                            """
              Step A
              
              Lie flat on the floor or mat with your feet flat on the floor and knees bent. Extend your arms straight by your side and raise your shoulders off the floor by contracting your abdominal muscles.
              
              Step B
              
              Touch your left heel with your left hand by rotating to the left and hold for a second. Keep your abdominal muscles contracted and shoulders off the floor throughout the movement.
              
              Step C
              
              Rotate back to the starting position.
              
              Step D
              
              Touch your right heel with your right hand by rotating to the right side and hold for a second. Keep your abdominal muscles contracted and shoulders off the floor throughout the movement. Return to the starting position and repeat.
              """,
              //Modified v-sit
                            """
              Step A
              
              While lying on your back, straighten your legs, raise your heels an inch off the floor, and place your hands by your sides.
              
              Step B
              
              Keeping your arms parallel to the floor, lift your torso and legs so they form a "V" shape. As you raise yourself, bend your knees and pull them up toward your chest.
              
              Step C
              
              Return to starting position and repeat.
              """,
              //Mountain climbers
                            """
              Step A
              
              Get into pushup position on the floor. Bring your left knee to your right elbow.
              
              Step B
              
              Straighten your left leg to return to the starting position. Then, bring your right knee to the left elbow.
              
              Step C
              
              Straighten your right leg to return to the starting position. Repeat at a fairly quick pace.
              """,
              //Oblique v-up
                            """
              Step A
              
              Lie on your side with your body in a straight line and your arms crossed against your chest.
              
              Step B
              
              Life your legs off the floor, making sure to keep them tightly bound together. You should feel your obliques contracting, even though there isn't too much motion involved.
              
              Step C
              
              Pause, then slowly return to the starting position. Repeat as many times as needed, then switch sides.
              """,
              //Plank
                            """
              Step A
              
              Begin by getting into pushup position, but bend your elbows and rest your weight on your forearms instead of using your hands as illustrated. Your body should form a straight line from your shoulders down to your ankles.
              
              Step B
              
              Brace your core by contracting your abdominal muscles in this position. Hold for roughly 30seconds, then release.
              """,
              //Prone cobra
                            """
              This exercise helps develop the strength of the spinal muscles and the muscles that retract the shoulder blades, and also improves spinal mobility - it is a useful exercise for anyone who sits at a desk for long periods.
              
              Step A
              
              Lie face down on the floor with your arms beside your hips and your palms facing up. Activate your core muscles by drawing your abdominals toward your spine and squeezing your gluteals.
              
              Step B
              
              Slowly exhale and lift your chest off the floor and your arms up and backward toward your hips. Rotate your thumbs toward the ceiling as you carry out the movement.
              
              Step C
              
              Pause at the top of the movement for two seconds, then return to the start position.
              """,
              //Pulse up
                            """
              Step A
              
              Lie on your back with your hands underneath your tailbone and have your legs straight upward, as illustrated.
              
              Step B
              
              Pull your navel inward and flex your glutes as you lift your hips just a few inches off the floor. Then lower your hips.
              """,
              //Raised leg crunch
                            """
              Step A
              
              Lie on the floor or mat with your legs raised. Your knees should be bent 90 degrees.
              
              Step B
              
              Contract your abdominals and lift your shoulders off the floor as you bring your upper body toward your legs in a crunch motion. Keep your legs raised during the motion and still.
              
              Step C
              
              Lower your torso and repeat.
              """,
              //Reverse crunch
                            """
              Step A
              
              Lie on your back on the floor and raise your head and upper shoulders off the mat slightly. Lace your fingers from both hands together behind your inclined head for support while keeping your elbows wide apart. Do NOT bend your head toward your chest, keep it perpendicular to your torso but bend your knees 90 degrees, and raise your feet 1-2 inches off of the floor.
              
              Step B
              
              Then, lift your knees in a smooth arc toward your head while keeping everything else as still as possible. Once your knees are directly above your upper abdomen, pause, contract the abs, and then lower your feet back down slowly in reverse. Do not let them touch the floor though and ensure you continue to maintain tension in your abdominal muscles.
              """,
              //Rollback
                            """
              Step A
              
              Sit with your knees bent and your heels on the floor. Keep your torso upright, shoulders back, and arms extended forward, parallel to the floor. Inhale while keeping your stomach pulled in.
              
              Step B
              
              Roll backward, rounding your spine while you hold your chin to your chest. Stop two-thirds of the way to the floor.
              
              Step C
              
              Exhale, and return to the starting position. As you gain strength, roll back closer to the floor.
              """,
              //Russian twist
                            """
              Step A
              
              Sit on a gym mat or floor. Maintain your balance as you raise your feet off the floor and place your hands in front of you, as shown.
              
              Step B
              
              Rotate your torso to the left. Pause, then rotate around to the right. Keep your head in line with your torso throughout the movement, and perform it as quickly as possible.
              
              Step C
              
              Repeat.
              """,
              //Saxon side bend
                            """
              Step A
              
              Hold a pair of light dumbbells with an overhand grip overhead, keeping your elbows only slightly bent.
              
              Step B
              
              Keep your back straight as you slowly bend directly to your left side. Keep going as far as possible while avoiding twisting your upper body.
              
              Step C
              
              Pause, then return to an upright position, and repeat on the other side of the body.
              """,
              //Seated jackknife
                            """
              Step A
              
              Sit on the edge of a bench and hold the seat behind you for support.
              
              Step B
              
              Extend your legs in front of you, knees bent slightly.
              
              Step C
              
              Now, simultaneously raise your legs toward your chest and bring your chest toward your knees.
              """,
              //Side bridge
                            """
              Step A
              
              Lie on your side with your legs straight out. Turn sideways and raise your body off the floor, with one bent arm parallel to the floor.
              
              Step B
              
              Keep your abdominal muscles tight for 30-60seconds. Try to keep your body in a straight line and your elbow directly under your shoulder.
              
              Step C
              
              Return to the starting position and repeat.
              """,
              //Side crunch
                            """
              Step A
              
              Keep your legs straight and extend your right arm along the floor (for balance) while lying on your right side. Cup your left hand behind your head while holding your head a few inches above the floor with your elbow pointing toward the ceiling, as shown. Remember to keep your head still (do not bend it toward your feet) throughout the movement phase.
              
              Step B
              
              Contract the muscles of the left side of your torso while moving your upper torso toward your feet so that your upper body curls in a smooth arc. Simultaneously, lift your legs upward, while keeping your ankles locked together, to form a "V"shape with your body. When your obliques are fully contracted, begin returning slowly to the starting position. Reverse your position afterward doing several repeats to work the right side of the body.
              """,
              //Side plank
                            """
              Step A
              
              Lie on your left side with your knees straight and prop your upper body up on your left elbow and forearm, as illustrated.
              
              Step B
              
              Brace your core by contracting your abs forcefully. Then, slowly raise your hips until your body form a straight line from your ankles down to your shoulders.
              
              Step C
              
              Hold for 30 seconds or so, then turn to your right side and repeat.
              """,
              //Situp
                            """
              Step A
              
              With your feet anchored under a sturdy object, lie with your knees bent. Then, fold your arms across your chest or just hold your hands behind your ears.
              
              Step B
              
              Use your abs to flex your spine and slowly lift your upper body. Finally, roll back down, slowly and with control. Repeat as desired.
              """,
              //Sprinter
                            """
              Step A
              
              Lying on your back, keep your hands at your side, legs extended straight, and heels held about 5inches off of the floor.
              
              Step B
              
              Slowly, start sitting up while elevating your left arm with the elbow bent so it resembles a sprinter's pumping motion. At the peak of the situp, bring your right knee to your chest.
              
              Step C
              
              Return to the start, keeping your legs raised, and repeat with the opposite arm and leg.
              """,
              //Standing knee raise
                            """
              Step A
              
              Stand upright with your feet shoulder-width apart. Raise your left knee as high as possible.
              
              Step B
              
              Lower your leg, and then raise your right knee. Repeat.
              """,
              //Steam engine
                            """
              Step A
              
              Standing so that your feet are shoulder-width apart, place your fingers behind your ears.
              
              Step B
              
              Touch your left elbow to your right knee as you bend and raise the knee while crunching your left armpit toward your right hip.
              
              Step C
              
              Return to starting position and repeat with the other side. Repeat the two sequences repeatedly.
              """,
              //Superman
                            """
              This exercise helps develop core strength and both spinal strength and stability, as well as working the muscles that retract the shoulder blade retractors and the gluteals.
              
              Step A
              
              Kneel on all fours with your knees under your hips and hip-distance apart and put your hands on the floor a shoulder-width apart under your shoulders. Put your spine into the neutral position. Activate your core by drawing your abdominal muscles back toward your spine.
              
              Step B
              
              Without any sideways movement and keeping your abdomen pulled in, exhale and slowly raise an opposite arm and leg until they are parallel to the floor - be careful to follow the tempo you have set.
              
              Step C
              
              Inhale and slowly return your arm and leg to the starting position.
              
              Step D
              
              Repeat for the desired number of reps, then repeat the exercise using the other arm and leg.
              """,
              //Toe touch
                            """
              Step A
              
              While lying on your back, extend our legs and arms toward the ceiling.
              
              Step B
              
              Slowly lift your head and shoulders. As you curl upward, attempt to reach as high as possible with your fingers.
              
              Step C
              
              Hold. Then return to the starting position.
              """,
              //Traditional crunch
                            """
              Step A
              
              Lie with your knees bent and your feet flat on the floor. Fold your arms across your chest or hold your hands behind your ears (Do not interlock your fingers behind your head).
              
              Step B
              
              Use your abs to lift your head and upper torso while keeping your lower back pressed firmly against the floor.
              
              Step C
              
              Pause with your shoulder blades a couple of inches off the floor, then slowly return to the starting position using a controlled movement.
              """,
              //Twisting crunch
                            """
              Step A
              
              Lie down on your back with feet flat on the floor and knees bent. Place your fingers lightly behind your head.
              
              Step B
              
              Begin to gradually curl your right shoulder toward your left knee until your right shoulder blade raises above the floor. Hold for 3-5 seconds while actively crunching your abdominal muscles.
              
              Step C
              
              Slowly, return to starting position and repeat with the opposite side of the body.
              """,
              //Twisting hip raise
                            """
              Step A
              
              Lie on your back with your legs projecting straight upward and your hands by your sides.
              
              Step B
              
              Push upward with your feet by raising your hips off the floor and simultaneously, twisting them to one side.
              
              Step C
              
              Lower your hips back to the ground and repeat the motion but twist to the opposing side.
              """,
              //Twisting windmill
                            """
              Step A
              
              While lying on your back, extend your arms out to the sides at shoulder height. Raise your legs until they are perpendicular to the floor.
              
              Step B
              
              Gradually lower your legs to one side of your body so you meet the floor a few inches away from your hand.
              
              Step C
              
              Pause, then bring your feet back to the center. Repeat, but bend your legs to the other side.
              """,
              //V-up
                            """
              Step A
              
              With your back on the floor, and your legs straight hold your arms straight above your chest, and have your fingers point upwards.
              
              Step B
              
              Fold your body upward by lifting your legs off the floor and stretching your arms toward your toes, while consciously contracting your abdominal muscles.
              
              Step C
              
              Then, pause for a short time, and return to starting position.
              """,
              //Weighted swiss-ball crunch
                            """
              Step A
              
              Lie on your back on a swiss ball, holding a weight plate across your chest.
              
              Step B
              
              Raise your head and shoulders and crunch your rib cage toward your pelvis.
              
              Step C
              
              Pause, then slowly return to the starting position.
              """,
              //Wheel rollout
                            """
              Step A
              
              Place your knees on the floor, hands resting on an ab wheel directly below your chest, back flat, abs tight, neck and head aligned with your back.
              
              Step B
              
              Roll your hands as far forward as possible, keeping your core tight. Stop the movement as soon as you realize you can't go any farther while still keeping the neutral arch in your back.
              
              Step C
              
              Roll your hands back to the starting position.
              """,
            ]
        ]
    
    var pictures = [ ["Cycle crunch","Dumbbell bench twist","Dumbbell leg lift","Dumbbell side bend","Dumbbell toe touch","Dumbbell torso twist","Dumbbell woodchopper","Golf squat","Swiss-ball torso twist","Twisting shoulder press","Walking lunge twist","Weighted chop","Weighted crunch"],
                     
                     [ "Bar crunch","Barbell cable rollout","Barbell rollout","Barbell side bend","Standing torso twist","Standing weighted russian twist"],
                 
                     ["Ab crunch machine","Barbell cable rollout","Cable kneeling twisting crunch","Cable standing crunch","Cable torso rotation","Cable woodchopper","Hanging knee raise","Hanging leg raise","High woodchopper","Incline reverse crunch","Kneeling cable crunch","Standing oblique crunch"],
                 
                     ["Kettlebell crunch","Kettlebell russian twist","Kettlebell side bend"],
                 
                     ["Ab crunch on a ball","Bosu crunch","Bosu pushup","Bosu russian twist","Bosu side bridge","Bosu sit-up","Figure-8 crunch","Jackknife","Medicine ball decline crunch","Medicine ball toe touch","Seated twist","Swiss-ball crunch","Swiss-ball oblique crunch","Swiss-ball pike pushup","Swiss-ball plank","Swiss-ball reverse crunch","Swiss-ball torso twist","Swiss-ball trunk rotation","Weighted swiss-ball crunch"],
                 
                     ["Resistance band crunch","Resistance band hip raise","Resistance band kneeling crunch","Resistance band side bend"],
                 
                 [ "Abdominal reverse curl","Abdominal twist","Bench leg raise","Bench side bridge","Bicycle kick","Bridge crunch","Burpees","Clam","Crunch twist","Decline twisting ab crunch","Dragon flag","Elevated-feet plank","Flutter kicks","Incline plank","Kneeling plank","Leg climb crunch","Lying heel touch","Modified v-sit","Mountain climbers","Oblique v-up","Plank","Prone cobra","Pulse up","Raised leg crunch","Reverse crunch","Rollback","Russian twist","Saxon side bend","Seated jackknife","Side bridge","Side crunch","Side plank","Situp","Sprinter","Standing knee raise","Steam engine","Superman","Toe touch","Traditional crunch","Twisting crunch","Twisting hip raise","Twisting windmill","V-up","Weighted swiss-ball crunch","Wheel rollout"]
                 ]
    
    @IBOutlet weak var backBtn: UIButton!
    var currenttableView: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.backBtn.setTitle("", for: .normal)
        currenttableView = 0
    }

    class func identifier() -> AbsViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AbsViewController") as! AbsViewController
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "AbsCell")
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
