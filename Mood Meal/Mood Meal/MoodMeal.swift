

import Foundation

struct Mood{
    var emoji: String
    var name: String
}

struct Activity{
    var emoji: String
    var name: String

}

struct Meal{
    var mood: Mood
    var activity: Activity
    var suggestedMeal: String
}

var meals: [Meal] = [
    Meal(mood: Mood(emoji: "😊", name: "Happy"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Pancakes with Maple Syrup"),
    Meal(mood: Mood(emoji: "😊", name: "Happy"), activity: Activity(emoji: "🚶🏼‍♂️", name: "Light"), suggestedMeal: "Fruit Salad with Yogurt"),
    Meal(mood: Mood(emoji: "😊", name: "Happy"), activity: Activity(emoji: "🏃🏼‍♂️", name: "Moderate"), suggestedMeal: "Grilled Chicken with Brown Rice"),
    Meal(mood: Mood(emoji: "😊", name: "Happy"), activity: Activity(emoji: "🏋🏻‍♂️", name: "Intense"), suggestedMeal: "Protein Smoothie with Banana"),
    
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Mac and Cheese"),
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🚶🏼‍♂️", name: "Light"), suggestedMeal: "Tomato Soup with Garlic Bread"),
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🏃🏼‍♂️", name: "Intense"), suggestedMeal: "Grilled Fish with Steamed Veggies"),
    Meal(mood: Mood(emoji: "😢", name: "Sad"), activity: Activity(emoji: "🏋🏻‍♂️", name: "Sedentary"), suggestedMeal: "Chocolate Ice Cream"),
    
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Herbal Tea with Biscuits"),
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🚶🏼‍♂️", name: "Light"), suggestedMeal: "Veggie Wrap with Hummus"),
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🏃🏼‍♂️", name: "Moderate"), suggestedMeal: "Grilled Salmon with Quinoa"),
    Meal(mood: Mood(emoji: "😩", name: "Stressed"), activity: Activity(emoji: "🏋🏻‍♂️", name: "Intense"), suggestedMeal: "Steak with Mashed Potatoes"),
    
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🪑", name: "Sedentary"), suggestedMeal: "Granola Bar with Smoothie"),
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🚶🏼‍♂️", name: "Light"), suggestedMeal: "Avocado Toast with Poached Egg"),
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🏃🏼‍♂️", name: "Moderate"), suggestedMeal: "Chicken Burrito Bowl"),
    Meal(mood: Mood(emoji: "⚡️", name: "Energetic"), activity: Activity(emoji: "🏋🏻‍♂️", name: "Intense"), suggestedMeal: "Pasta with Grilled Vegetables")
]
