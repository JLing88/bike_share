User Stories
As a visitor

1

As a visitor,
When I visit the stations index,
I see all stations (name, dock count, city, installation date)

** All Attributes must be present **
2

As a visitor,
When I visit the station show
I see the url '/:station-name' with that station's name instead of :id,
I see all attributes for that station.

** All Attributes must be present **

3

As a visitor,
When I visit the trips index,
I see the first 30 trips (duration, start date, start station, end date, end station, bike id, subscription type, zip code),
I also see a button to see more pages of trips,

When I visit a second page, there should be buttons to move both forward and backward in time.

** All Attributes must be present **

4

As a visitor,
When I visit the trip show,
I see all attributes for that trip.
5
As a visitor,
When I visit the conditions index,
I see all conditions (Date, Max Temperature, Mean Temperature, Min Temperature, Mean Humidity, Mean Visibility (in Miles), Mean Wind Speed (mph), Precipitation (inches))

** All Attributes must be present **

6

As a visitor,
When I visit a condition show,
I see all attributes for that condition. (Date, Max Temperature, Mean Temperature, Min Temperature, Mean Humidity, Mean Visibility (in Miles), Mean Wind Speed (mph), Precipitation (inches))  

** All Attributes must be present **

7

As a visitor,
When I visit "/",
I see a link for "Login",
When I click "Login",
I should be on the "/login" page,
I see a link to "Create Account",

When I click link "Create Account",
I fill in my desired credentials,
And I submit my information,
My current page should be "/dashboard",
I see a message in the navbar that says "Logged in as SOME_USER",
I see my profile information,
I do not see a link for "Login",
I also see a link for "Logout".

8

As a visitor,
When I visit '/bike-shop',
I see at least 12 bike accessories (items) for sale,
I see a button near each item that says "Add to Cart".

When I click "Add to Cart",
I see a flash message alerting me that I have added that specific accessory to my cart.
I also see my cart count updated on all pages.

9

As a visitor,
When I visit '/cart',
I see all the bike accessories I have added to my cart,
I see a thumbnail for each accessory as well as the title and price,
I see a subtotal and quantity breakdown for each accessory,
I see a total for my cart,
After I create an account,
I visit "/cart,
I see all of the data that was there when I was not logged in.

10

As a visitor,
When I visit "/cart"
And I click link "Remove" next to an accessory,
My current page should be "/cart",
I see a flash message,
The message should say "Successfully removed SOME_ACCESSORY from your cart.",
The flash message should contain a link to that accessory in case the user wants to add it back,
I also should not see the accessory listed in my cart.

11

As a visitor,
When I visit an accessory show,
I see an image, title, description and price for my accessory,
I can click "Add to Cart"

12

As a visitor,
When I visit an accessory show for a retired accessory,
I am still able to access the accessory page,
I am not able to add the accessory to my cart,
I also see in place of the "Add to Cart" button or link - "Accessory Retired"

13

As a visitor,
When I visit "/cart",
I see my item with a quantity of 1,

When I increase the quantity,
The current page should be '/cart',
The item's quantity should reflect the increase,
The subtotal for that item should increase,
Also, the total for the cart should match that increase.

14

As a visitor,
When I visit "/cart",
I see my item with a quantity of 1,

When I decrease the quantity,
My current page should be '/cart',
The item's quantity should reflect the decrease,
The subtotal for that item should decrease,
The total for the cart should match that decrease.

15

As a visitor,
I cannot view another user's private data, such as current order, etc.
I should be redirected to /login when I try to check out,
I cannot view the administrator screens or use administrator functionality,
I cannot make myself an admin.
As a registered user

16

As a registered user,
When I visit "/",
I see a link for "Login",

When I click "Login",
I should be on the "/login" page,
I see a place to insert my credentials to login,
I fill in my desired credentials,
I submit my information,
My current page should be "/dashboard",
I see a message in the navbar that says "Logged in as SOME_USER",
I see my profile information,
I do not see a link for "Login",
I see a link for "Logout".

17

As a registered user,
When I visit '/cart',
I see a small image, title, and price for each accessory in my cart,
I see a subtotal and quantity breakdown for each accessory,
I see a total for my cart,
I also see a button to "Checkout".

18

As a registered user,
After adding a few items to my cart,
When I visit '/cart',
And click "Checkout",
I see my own dashboard,
I also see a flash message telling me I have "Successfully submitted your order totaling $TOTAL".

19

As a registered user,
When I visit '/dashboard'
And click one of my orders,
My current path should be '/orders/:id'
I see the bike accessories that I ordered broken down by subtotal and quantity,
I see the total for this order,
I see the status of this order (ordered, completed, paid, cancelled)
I see the date/time that the order was submitted,
I do not see the order of another user.

If the order was completed or cancelled,
I see a timestamp when the action took place.

20

As a registered user,
I cannot view another user's private data (current or past orders, etc),
I cannot view the administrator screens or use admin functionality,
I cannot make myself an admin.  
As a registered user

21

As a registered user,
When I visit '/stations-dashboard',
I see the Total count of stations,
I see the Average bikes available per station (based on docks),
I see the Most bikes available at a station (based on docks),
I see the Station(s) where the most bikes are available (based on docks),
I see the Fewest bikes available at a station (based on docks),
I see the Station(s) where the fewest bikes are available (based on docks),
I see the Most recently installed station,
I also see the Oldest station.

22

As a registered user,
When I visit '/trips-dashboard',
I see the Average duration of a ride,
I see the Longest ride,
I see the Shortest ride,
I see the Station with the most rides as a starting place,
I see the Station with the most rides as an ending place,
I see Month by Month breakdown of number of rides with subtotals for each year,
I see the Most ridden bike with total number of rides for that bike,
I see the Least ridden bike with total number of rides for that bike,
I see the User subscription type breakout with both count and percentage,
I see the Single date with the highest number of trips with a count of those trips,
I see the Single date with the lowest number of trips with a count of those trips.

23

As a registered user,
When I visit a station show,
I see the Number of rides started at this station,
I see the Number of rides ended at this station,
I see the Most frequent destination station (for rides that began at this station),
I see the Most frequent origination station (for rides that ended at this station),
I see the Date with the highest number of trips started at this station,
I see the Most frequent zip code for users starting trips at this station,
I see the Bike ID most frequently starting a trip at this station.

24

As a registered user,
When I visit '/conditions-dashboard',
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees),
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments,
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments,
I see the Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visibility in miles in four mile increments.

25

As a registered user,
When I visit '/trips-dashboard',
I see the Weather on the day with the highest rides.
I see the Weather on the day with the lowest rides.

26

As a registered user,
When I visit '/',
And I click "Logout",
I see "Login",
I do not see "Logout".

27

As a registered user and admin,
I can modify my account data,
I cannot modify any other user's account data.
As a admin user

28

As an admin user,
When I visit the stations index,
I see everything a visitor can see,
I see a button next to each station to edit that station,
I also see a button next to each station to delete that station.

29

As an admin user,
When I visit the station show,
I see all attributes a visitor can see,
I see a button to delete this station,
I also see a button to edit this station.

30

As an admin user,
When I visit admin station new,
I fill in a form with all station attributes,
When I click "Create Station",
I am directed to that station's show page.
I also see a flash message that I have created that station.

** All Attributes must be present **

31

As an admin user,
When I visit admin station edit,
I fill in a form with all station attributes,
When I click "Update Station",
I am directed that station's show page,
I see the updated station's information,
I also see a flash message that I have updated that station.

** All Attributes must be present **

32

As an admin user,
When I visit the stations index,
And I click delete next to a station,
I do not see the station on the index.
I also see a flash message that I have deleted that station.

33

As an admin user,
When I visit the trips index,
I see all attributes that a visitor can see,
I see a button next to each trip to edit that trip,
I also see a button next to each trip to delete that trip.

34

As an admin user,
When I visit the trip show,
I see everything a visitor can see,
I see a button to delete this trip,
I also see a button to edit this trip.

** All Attributes must be present **

35

As an admin user,
When I visit admin trip new,
I fill in a form with all trip attributes,
When I click "Create Trip",
I am directed to that trip's show page.
I also see a flash message that I have created that trip.


** Zip Code is a user-provided field, and may not be present on all records. Otherwise, as with Stations, all attributes of a Trip need to be present to ensure data integrity **

36

As an admin user,
When I visit admin trip edit,
I fill in a form with all trip attributes,
When I click "Update Trip",
I am directed to that trip's show page,
I see the updated trip's information,
I also see a flash message that I have updated that trip.

** All Attributes must be present **

37

As an admin user,
When I visit the trips index,
And I click delete next to a trip,
I do not see the trip on the index.
I also see a flash message that I have deleted that trip.

38

As an admin user,
When I visit the conditions index,
I see everything that a visitor can see,
I see a button next to each condition to edit that condition,
I also see a button next to each condition to delete that condition.

39

As an admin user,
When I visit a condition show,
I see all the attributes a visitor can see,
I see a button to delete this condition,
I also see a button to edit this condition.

40

As a admin user,
When I visit admin condition new,
I fill in a form with all condition attributes,
When I click "Create Condition",
I am directed to a that condition's show page.
I also see a flash message that I have created that condition.

** All Attributes must be present **

41

As an admin user,
When I visit admin condition edit,
I fill in a form with all condition attributes,
When I click "Update Condition",
I am directed to that condition's show page,
I see the updated condition's information,
I also see a flash message that I have updated that condition.

** All Attributes must be present **

42

As an admin user,
When I visit the conditions index,
And I click delete next to a condition,
I do not see the condition on the index.
I also see a flash message that I have deleted that condition

43

As an admin user,
When I visit "/",
I see a link for "Login",

When I click "Login",
I should be on the "/login" page,
I see a place to insert my credentials to login,
I fill in my desired credentials,
I submit my information,
My current page should be "/admin/dashboard",
I see a message in the navbar that says "Logged in as Admin User: SOME_USER",
I see my profile information,
I do not see a link for "Login",
I see a link for "Logout"

44

As an admin user,
When I visit an individual order page,
I see the order's date and time,
I see the purchaser's full name and address,
I see the item's name, which is linked to the item page.
I see the quantity in this order.
I see the line item subtotal,
I see the total for the order,
I also see the status for the order.

45

As an admin user,
When I visit "/admin/dashboard",
I see a link for viewing all accessories,
When I click that link,
My current path should be "/admin/bike-shop",
I see a table with all accessories (active and inactive)

Each accessory should have:

A thumbnail of the image
Description
Status
Ability to Edit accessory
Ability to Retire/Reactivate accessory

46

As an admin user,
When I visit the admin dashboard,
I see a list of all orders,
I see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed"),
I see a link for each individual order,
I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed"),
I have links to transition between statuses

I can click on "cancel" on individual orders which are "paid" or "ordered"
I can click on "mark as paid" on orders that are "ordered"
I can click on "mark as completed" on orders that are "paid"
47
As an admin user,
When I visit admin bikeshop new
I can create an accessory,
An accessory must have a title, description and price,
The title and description cannot be empty,
The title must be unique for all accessories in the system,
The price must be a valid decimal numeric value and greater than zero,
The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
