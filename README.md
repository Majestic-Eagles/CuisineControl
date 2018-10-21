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
Ingredient: its simple but the user and the recipes will use this in them
Recipe: this will be made up of an ingredient list, instructions, a description of the food, title, maybe a picture or two, and maybe the nutrition facts.
At the moment this is all we think we'll need.


## User Stories

The following **required** functionality is completed:

- [ ] User can use the app to scan the barcodes on food
- [ ] User can store their foods in an online database for the app
- [ ] User can specify what the foods that are being stored are
- [ ] User can generate a random recipe
- [ ] Recipe is generated based on the ingredients the user has

The following **stretch** features are implemented:

- [ ] User can specify what type of recipe they want, i.e. Mexican or Thai
- [ ] User can keep certain foods out of the recipe, i.e. remove eggs from potential random recipes even though the user has eggs
- [ ] User add recipes to the random recipe generator

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

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
