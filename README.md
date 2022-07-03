# Fetch-Rewards

This is the take home project from Fetch Reward for the role of Sr. iOS Engineer.

## Architecture

![Screenshot of Architecture](https://i.ibb.co/k8KfGc1/Screenshot-2022-07-03-at-2-46-47-AM.png)

I have used MVC design pattern to architect the project. It uses various techniques like dependancy injection, dependency inversion, model controller, lossly coupled modules to create a overall modular design. Please check the link to UML diagram I have created to explain how different entities are interacting with each other here: https://drive.google.com/file/d/1gOtrz-Ur3TS0TKc41RPE0PXDvNIGGxpW/view?usp=sharing

## Testing

I followed a test driven development approch while creating the networking layer. Moreover, I have added various comments throughout the project on how we can further modify code to improve testability. The code overall, including view controllers, are easily testable and we can add more unit tests to project!

![Screenshot of Test Cases](https://i.ibb.co/QXtPvMJ/Screenshot-2022-07-03-at-2-08-37-AM.png)

## Demo

Please check the screen recording of the app on YouTube here: https://youtube.com/shorts/tJyXgOOnmc8?feature=share

## Assumptions

I would normally clarify these requirements with the PO but, in this scenario, I made few assumptions while developing this application which are listed below:
- If the data from JSON request is missing, we skip that entry instead of showing empty cell
- We sort the data alphabetically without considering UPPERCASE or lowercase. 


## Areas of Improvement
- The app currently does not work without wifi. Hence, we should consider adding placeholder image or handling network erros to let user know that data isn't avaiable instead of crashing the app
- The view group contains all its view in a single storyboard. I would consider breaking them out into multiple storyboard (one storyboard per view controller) and joining them together through storyboard reference. Moreover, we can consider creating seperate xib file for table view cells. 
- The details page uses a static layout to display the content. However, the meal instructions could get lengthy and cut off at certain point. Hence, it would be more user friendly to embeed the vertical stack view inside of a scroll view and let the verticall stack view enable the scroll instead of table view's scroll.  


