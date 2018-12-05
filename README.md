# Group Project 'CuisineControl'

**CuisineControl** is an app that keeps track of the expiration dates of all the foods a person has.  It solves the problem of throughing out food that is expired by allowing people to easily add foods by scanning their barcodes.  It also searches for random recipes based on the food the person has, allowing them to enjoy new exciting recipes.

Time spent: **127** hours spent in total

## Backend
**Parse**
Our parse server will be able to hold users, which will have a username, password, then maybe a pointer to a list of recipes they liked. Not sure if a list is the most efficient but it will get the job done. We're thinking that will also need a pointer to the ingreidients that user has.

**API's**
We used two different API's, both made by Edamam.  We used their food database API's to lookup the information of a food from a barcode.  We also used their recipe search API to lookup recipes based on the food items the user has.

The models we used are:

User: to store basic user info and the ingredients they have.

Food (This model respresents a food object added by the user)
Class Food
 * Name
 * API name
 * Serving size
 * Calories
 * Protein
 * Fat
 * Carbohyrdates
 * Expiration Date
 
Recipe (This model represents a recipe that the API will find based on the user information)
Class Recipe
* Ingredients
* Name
* Recipe Image URL
* Recipe URL
* Calories 
* Protein
* Fat
* Carbohydrates
* CookTime

## Wireframe

For the wire frame we used Adobe XD:
https://xd.adobe.com/view/a4b6a4d6-fd42-4026-698e-25a6af47052c-d287/
It gives a general idea of how we are going to lay things out.


## User Stories

The following functionality is completed:
- [X] User can sign up and log in
- [X] User gets an error if account is invalid or taken
- [X] User persists
- [X] User can use the app to scan the barcodes on food
- [X] User can store their foods in an online database for the app
- [X] User can specify what the foods that are being stored are
- [X] User can generate a random recipe
- [X] Recipe is generated based on the ingredients the user has
- [X] User can can see what foods they have
- [X] User can delete a food from their food list (also deletes food from Parse)

The following **Challenge** features are implemented:
- [X] User is greeted with a pretty login/signup screen
- [X] User can add foods manually
- [X] Login/signup screens have activity indicators.

Features we want to include in the **Future**
- [ ] User can specify what type of recipe they want, i.e. Mexican or Thai
- [ ] User can keep certain foods out of the recipe, i.e. remove eggs from potential random recipes even though the user has eggs
- [ ] User  can add their own recipes to the random recipe generator

## Video Walkthrough

https://www.youtube.com/watch?v=wjhPynNv1hs

Here's a walkthrough of implemented user stories:

<video width="310" height="530" controls>
  <source src="Rec1.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

*Most up to date Gif*<br>
<img src='https://i.ibb.co/ySyzWf3/CCFinal.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- Edamam API
- Parse API
- Timothy Lee (Fade Transistion)


## Notes

Frontend problems:

One challenge I faced with UI was implemented UIScrollView in a couple of the views, once I figured out how to do so it was pretty easy, but I had trouble with correctly adding constraints.  

Backend problems

One of the biggest challenges in building the app was selecting and implementing the correct API.  I searched through documentation of at least 10 API's in an attempt to find the perfect one for my situation (that was also free).  In the end I didn't really find something that had everything I wanted, but I ended up choosing the Edamam API because it had a very good database for barcodes, as well as a good recipe search.  The compromise was that I wasn't able to search for foods quite how I wanted to using the API.

## License

Copyright [2018] [Taylor McLaughlin]
Copyright [2018] [Ryan McCommon]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
