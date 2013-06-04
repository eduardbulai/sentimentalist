# 	As a user
# 	I want to search for tweets by location, hashtag, subject keyphrase, or twitter handle
# 	so I can know more about how people feel in different locations

# 	- There is a search form on the left sidebar of the home dashboard
# 	- The search bar contains a field for location
# 	- The search bar contains a field for hashtag
# 	- the search bar contains a field for twitter handle
# 	- the search bar contains a field for subject keyphrase
# 	- the search bar contains a check yes/no field for ‘only my followers’
# 	- none of the fields are required
# - submitting the form with the ‘followers only’ field checked and with only a location criteria causes the icon field to refresh with only those icons that correspond to a user’s followers in that location
# - submitting the form with the ‘followers only’ field checked and with only a hashtag    criteria causes the icon field to refresh with only those icons that correspond to a user’s followers tweeting with that hashtag
# - submitting the form with the ‘followers only’ field checked and with only a subject keyphrase criteria causes the icon field to refresh with a randomly selected sample of tweets with that subject keyphrase
# - submitting the form with only a twitter handle criteria causes the icon field to refresh with only those icons that correspond to a user’s followers with that twitter handle
# - submitting the form with the ‘followers only’ field unchecked and with only a hashtag    criteria causes the icon field to refresh with a randomly selected sample of tweets with that hashtag
# - submitting the form with the ‘followers only’ field unchecked and with only a subject keyphrase criteria causes the icon field to refresh with a randomly selected sample of tweets with that subject keyphrase
# - submitting the form with the ‘followers only’ field unchecked and with only a ‘location’ criteria causes the icon field to refresh with a randomly selected sample of tweets with that subject keyphrase
# - submitting the form with criteria that do not match any results causes the icon field to refresh with a message along the lines of “... your search criteria do not match any results :( “
