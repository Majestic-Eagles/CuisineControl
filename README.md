# Group Project 'CuisineControl'

**CuisineControl** is an app that scans food items in order to store their expiration dates.  In addition, CuisineControl can keep track of what foods one has and use that information to generate a random recipe for the person to use.  CuisineControl can also specify these recipes, for example limiting the recipes to "Mexican" recipes or by limiting which ingredients that the person has.

Time spent: **1** hours spent in total

## Parse and Api's
**Parse**
Our parse server will be able to hold users, which will have a username, password, then maybe a pointer to a list of recipes they liked. Not sure if a list is the most efficient but it will get the job done. We're thinking that will also need a pointer to the ingreidients that user has.

**Api's**
We'll probably be using an api called **Edamam** for searching food recipes. We choice this becuase it's free to use and they have a large data base of recipes.

The models we will probably use are:

User: to store basic user info and the ingredients they have.

Food:
Class Food
 * Name
 * Serving size
 * Calories
 * Protein
 * Fat
 * Carbohyrdates
 * IsPresent (A boolean variable that says whether or not a person has it)
 
Recipe:
Class Recipe
* Ingredients (An array of Food objects)
* Name
* Description
* FoodImage
* Calories 
* Protein
* Fat
* Carbohydrates
* Instructions (Likely a string containing the instructions that the user will read to prepare the recipe)
* IsAvailable (Whether or not the user has the foods necessary to prepare the recipe)
* IsMissing (An array of food objects that the user needs to finish the recipe)
* CookTime

## Wireframe

For the wire frame we used Adobe XD:
https://xd.adobe.com/view/a4b6a4d6-fd42-4026-698e-25a6af47052c-d287/
It gives a general idea of how we are going to lay things out.


## User Stories

The following **required** functionality is completed:
- [X] User can sign up and log in
- [X] User gets an error if account is invalid or taken
- [X] User persists
- [X] User can use the app to scan the barcodes on food
- [X] User can store their foods in an online database for the app
- [X] User can specify what the foods that are being stored are
- [ ] User can generate a random recipe
- [ ] Recipe is generated based on the ingredients the user has

The following **stretch** features are implemented:

- [ ] User can specify what type of recipe they want, i.e. Mexican or Thai
- [ ] User can keep certain foods out of the recipe, i.e. remove eggs from potential random recipes even though the user has eggs
- [ ] User add recipes to the random recipe generator

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://image.ibb.co/eJwEfq/cusine-Walkthrough.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://imgur.com/1rODnqd.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://imgur.com/WGdqrwz.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://imgur.com/bXI4mVF.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='https://imgur.com/kk5FF0D.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library


## Notes

Describe any challenges encountered while building the app.

## License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
