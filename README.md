The goal of this exercise is to experiment with a belongs_to and has_many both in Rails Console and in Views.

```

bundle
rake db:create db:migrate db:seed

```

The models need to be edited to explain associations.

Companies, Locations, Reviews, and Products.

Companies have many Locations and Products.

Products have many reviews.

Use boostrap but don't worry about Footer or Navbar.





# Stories:

Fill in the line below each direction with the command needed to complete it.

## Rails Console:

For Example:

set a variable called companies = to all the Companies.
  companies = Company.all

1. set a variable called products = to all the Products ordered by name.

  products = Product.order(:name)

2. set a variable called locations = to all the Locations ordered by street_name.
  locations = Location.order(:street_name)

3. set a variable called reviews = to all the Reviews ordered by rating.
  reviews =Review.order(:rating)

4. set a variable called company = to the Company with an ID of 10.
  company = Company.find(10)

5. select all of the products that belong to that company.
  company.products

6. select all of the locations that belong to that company.
  company.locations

7. select the first product that belongs to that company.
  company.products.first

8. select all the reviews that belong to that product.
  company.products.first.reviews

9. select all the reviews that belong to the product with id of 1.
  Product.find(1).reviews

10. update each product's rating to 0.
  reviews = Review.all
  reviews.each do |review|
    review.update(:rating => 0)
  end

11. select all the reviews with a rating of greater than 5.  
    Review.where("rating  > 5")

12. select all the companies with a start date before 12/12/2012.  
    Company.where(['start_date < ?', '12/12/2012'])

13. How many are there?
  61

14. select all the products with a price greater than 50.
  Product.where("price > 50")


15. select review with id of 10 and return the product it belongs to.
  Review.find(10).product


## View Stories

Create an index page for companies that lists all companies and attributes in a table, with a link to that companies show page from it's name.
(Set root to this page 'companies#index')

There are no views setup. Root is set to standard rails page.

Show page for each company.
Show page for each location.
Show page for each product.
Show page for each review.


Users can create/edit companies.
Users can create/edit locations.
Users can create/edit products.
Users can create/edit reviews.






Things to remember
* Remember that Products have reviews.
* Now we need to figure out how to nest routes inside of nested routes.



### Example pages.


###### Example Companies Index Page:
- Root => 'companies#index'
- Name links to Show page for that company.
- Link to Create Product and Create Location. The name should link to a show page for that company.
- Link to delete a company.



```

Name | Suffix | Catch Phrase | Email | Start Date  | Industry|                 |  
Googl| "Yeah" | We searchin  |g@gmail|  12/12/2002 | Tech    | Create Location | Create Product | Delete
Galva| GG     | We teachin   |g@g.com|  12/12/2121 | Sports  | Create Location | Create Product | Delete


```

###### Example Company Show Page:

get '/company/:id' => 'companies#show'

Show page for company shows all details of company and shows all it's products and locations in separate tables.


```

name: Google
Suffix: Yeah
Catch Phrase: We searchin
Email: g@gmail.com
Start Date: 12/12/2002
Industry: Tech

Delete Company  Edit Company

Google's Locations:

City        |   Street    | State     | Country | Zipcode
Jenkinston  | Steuber Rue |  Missouri | Tuvalu  | 86576   | Delete
Denver      | Deleware    |  Colorado | US      | 86576   | Delete


Google's Products:

Name                   | Department           | Price  |
Fantastic Cotton Car   |   Food               | $89.92 | Create Review | Delete Product
Rubber Boxing Glove    |   Sports             | $20.52 | Create Review | Delete Product


```

###### Example Location Show Page:

get '/companies/:company_id/locations/:id'

```
City: Jenkinston
Street: Steuber Rue
State: Missouri
Country: Tubalu
Zipcode: 86576
Company : Google

Edit  Delete


```

###### Example Product Show Page:

get '/companies/:company_id/products/:id'

A table that contains all of the products reviews.
Review title in table links to review show page.


```
Name: Rubber Boxing Glove
Department: Sports
Price: $89.92

Edit   Delete


Rubber Boxing Glove reviews:


Title    |    Description      | Rating
saepe    |   Laborum occaecati |  5     | Delete | Edit
Bad      |  Cool product well  |  3     | Delete | Edit



```


###### Example Review Show Page:

get '/companies/:company_id/products/:product_id/reviews/:id'


```
Title: Bad Product
Description: Cool advertising tricked me.
Rating:   1

Edit Delete

```




#### Stretch goals:

* make a "/locations" page which lists al locations, regardless of company.
* Make a "/products" page which lists ALL the products, regardless of company.
* Make a "/reviews" page which lists ALL the reviews, regardless of product, ordered by Rating.
# mustached-octo-adventure
