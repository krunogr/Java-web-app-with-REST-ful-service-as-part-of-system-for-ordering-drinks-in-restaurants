Java-web-app-with-REST-ful-service-as-part-of-system-for-ordering-drinks-in-restaurants
=======================================================================================

Java web app with Android app makes system for ordering drinks in restourants. For REST(ful) service uses Jersey Framework. The same app without web service is made in PHP as well. Technologies: Java, HTML, CSS, SQL



First, the user has to make login (first image). Afterward login app checks in MySQL database whether user has administrator rights or not. If user has admin rights then app will redirect him to admin part (second image) otherwise user will be redirected to user part (third image).

![Alt text](https://github.com/krunogr/Java-web-app-with-REST-ful-service-as-part-of-system-for-ordering-drinks-in-restaurants/blob/master/mNarudzbe_web/web/screenshots/login.JPG "Login")

### Admin site of app
User with admin right can:
 - see all users. Searching is possible by username or by type
 - add a new user (with or without admin right)
 - delete a user
 - see all orders for every user. Searching by username and by date of orders.

![Alt text](https://github.com/krunogr/Java-web-app-with-REST-ful-service-as-part-of-system-for-ordering-drinks-in-restaurants/blob/master/mNarudzbe_web/web/screenshots/addUser.JPG "Admin site of app")

![Alt text](https://github.com/krunogr/Java-web-app-with-REST-ful-service-as-part-of-system-for-ordering-drinks-in-restaurants/blob/master/mNarudzbe_web/web/screenshots/reviewOrders.JPG "Admin site of app")


### User site of app
User without admin right can:
 - check a new orders. When user select a order on radio button and click Serve the order, the order goes directly to served    orders and it is not anymore in new orders.
 - see all orders with all informations (but not for another users)
 - see all articles (but not for another users). Searching by ID of article.
 - add a new article.
 - remove an article.
 - add event.

![Alt text](https://github.com/krunogr/Java-web-app-with-REST-ful-service-as-part-of-system-for-ordering-drinks-in-restaurants/blob/master/mNarudzbe_web/web/screenshots/reviewOrders.JPG "User site of app")

![Alt text](https://raw.githubusercontent.com/krunogr/Java-web-app-with-REST-ful-service-as-part-of-system-for-ordering-drinks-in-restaurants/master/mNarudzbe_web/web/screenshots/REST.JPG "REST(ful) web service")

