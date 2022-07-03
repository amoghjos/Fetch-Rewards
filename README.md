# Fetch-Rewards

This is the take home project from Fetch Reward for the role of Sr. iOS Engineer

## Areas of Improvement
- The app currently does not work without wifi. Hence, we should consider adding placeholder image or handling network erros to let user know that data isn't avaiable instead of crashing the app
- The view group contains all its view in a single storyboard. I would consider breaking them out into multiple storyboard (one storyboard per view controller) and joining them together through storyboard reference. Moreover, we can consider creating seperate xib file for table view cells. 
