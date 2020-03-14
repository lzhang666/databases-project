## README
Overview: 
This web application does passenger look up from the flight data base, and output information such as passenger id, travel date and corresponding flight reviews.

-- the backend is programmed in python 3.8 and the frontend is programmed in html

-- the attributes of tables: passenger and review, are modified and are different from previous homeworks. This is done to enable one passenger can take multiple flights and have multiple reviews.


-- Introduction of functionality:
1) home search page: users can search for passengers on the home page using 3 parameters: name, passenger id and travel date. The search can be done using any of these 3 parameters.
	a) name search does implicit look up. For example, entering "di" will return all names including the string such as "Gordin" and "diana";
	b) id search does explicit number look up. For example, user can enter 406 to get the particular passenger who's id is 406, which in this case is "Diana Dagan";
	c) travel date search does range look up. Searching by a single date will return all passengers who traveled on the specific date;
	d) web app user may commit search using only 1, 2 or 3 of the 3 parameters
	e) clicking on the home button on any pages will redirect the web page back to the home search page

2) add new passenger: a new passenger can be added to the data base by clicking on the new passenger button.
	a) the add new passenger function will automatically assign a passenger ID to the user. The ID number is created by a maximum look up on the existing user ID, and by returning as the value of (existing max. id + 1)
	b) user can enter the name of the new passenger and select the travel date.
	c) the travel date is strictly limited to the month of September
	d) pressing the submit button will redirect the page to Passenger View/Edit page, where the user can review the passenger info and update it if needed.

3) passenger info. page: when the look up is completed, the page will be directed to passenger infomation page where user can view/edit or delete the passenger information; view the flight reviews written by the specific passenger; add a flight review entry written by a specifc passenger.

4) view/edit passenger info: this page allows the user to view the basic information of a passenger, such as the distinct id number, full name and the travel date. The user can modify the passenger name, and reselect the travel date which is limited to the dates in September. The passenger ID is unique and cannot be modified.

5) flight reviews page: this page allows the user to look at the flight reviews written by a particular passenger. Note that a passenger can took multiple flights and thus can have multiple reviews and multiple reviews on the same flight id is permitted.

6) Add a flight review page: this page is reached through redirection from the passenger info page. The user is able to add a flight review by a specific passenger. The review is score based, the entries include fligh id, seat comfort rating, food and beverage rating, in-flight entertainment rating, recommendation. Note that the input values for seat comfort rating, food and beverage rating, in-flight entertainment rating cannot be greater than 10.
