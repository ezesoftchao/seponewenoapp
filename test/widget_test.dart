/*
13


2
I want search request on the List<Food> that I got. I have used a query method like this:

_foodList.where((food) => food.name == userInputValue).toList();

however, the search asked me to search with complete text and the right capitalization of the text.

how if I want to process a compilation of "dish", then all the names of foods that have the word "dish" will display in List?

list
dart
flutter
share  improve this question  follow
asked Jan 17 '19 at 9:08

Muhammad Imanudin
59922 gold badges1111 silver badges2828 bronze badges
add a comment
1 Answer

21

Lower-case or upper-case all strings before comparison and use contains() instead of ==:

_foodList.where((food) => food.name.toLowerCase().contains(userInputValue.toLowerCase()).toList();
If values can be null you need to add additional checks.

share  improve this answer  follow
answered Jan 17 '19 at 9:10

Günter Zöchbauer
458k138138 gold badges16351635 silver badges13481348 bronze badges
1
Hi bro, do you know this case? link – Muhammad Imanudin Feb 10 '19 at 14:40
@GunterZochbauer is it possible to search list of list? Ex: list<String> posts = [...,...].. Var result = _foodList.where((food) => food.name.toLowerCase().contains(userInputValue.toLowerCase()) || posts. //And also this array – BloodLoss Feb 3 at 2:04
It's probably better to create a new question. – Günter Zöchbauer Feb 3 at 4:11
@BloodLoss any success? – Rohit Jun 19 at 12:56
@Rohit yes I found way to do it – BloodLoss Jun 20 at 16:37*/
