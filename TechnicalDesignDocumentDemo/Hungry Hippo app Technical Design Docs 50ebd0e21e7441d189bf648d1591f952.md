# Hungry Hippo app Technical Design Docs

## Introduction

Your task is to produce a brief design doc for a customer-facing mobile app called “Hungry Hippo.” The purpose is to surface nearby restaurants in an app where a user can order food for pick-up. There are well known contenders in this area like Uber Eats, Zomato, and Menulog. The aim is not to copy these and become an expert in the online restaurant business, but instead to propose a design for a solution that shows an understanding of the tradeoffs. You can propose any technology stack that you like. Make sure your design doc justifies your choices and be prepared to explain your decisions in an interview.Spend no more than an evening (max 3 or 4 hours) producing this document. Please limit the document to a maximum of three pages.

Requirements
The app has the following requirements:

1. A “home” screen with a list of nearby restaurants
2. A “menu” screen with the option to choose items for ordering from the restaurant and a button to confirm an order
3. A “my orders” screen with the current order and past orders
4. Personal data needs to be stored securely
5. The app will get info over the network. You can propose any kind of back-end you like and you can assume back-end engineers will build it for you.
6. Restaurants should still be viewable offline
7. A push notification will be sent when the order is ready for pickup
A fully-fledged food ordering app will have a very large scope with a lot of requirements. We don’t need you to anticipate all of these. 

Use the time and length constraints above to guide your solution. A detailed software design for a minimal set of requirements is preferable to a vague document that attempts a solution for everything.

Ideas
Some ideas for information to include in your design doc:
● Architecture for implementing the screens e.g., MVVM, MVP, MVI, VIPER
● Concurrency - what patterns will your app use to avoid blocking the main thread?
● Other app architecture concerns like module or framework decomposition
● Layering (if necessary)
● Tooling
● Technology choices (e.g., 3rd party libraries or SDKs)
● A rough estimate of how long it would take to develop the solution
● Testing strategy
● Deployment strategy
This is not an exhaustive list - you are allowed to structure the design doc however you like.
Please include discussions of trade-offs or assumptions you make when producing the document.

## 1. Frontmatter

- Title: iOS Developer
- Author: YILONG CHEN
- Create: 2022-07-27

## 2. Introduction

**a. Overview, Problem Description, Summary, or Abstract**

This mobile Application is a customer-facing mobile app called “Hungry Hippo.” The purpose is to surface nearby restaurants in an app where users can order food for pick-up.

![Untitled](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/Untitled.png)

**b. Goals or Product and Technical Requirements**

The app has the following requirements:

1. A “home” screen with a list of nearby restaurants

2. A “menu” screen with the option to choose items for ordering from the restaurant and a button to confirm an order.

3. A “my orders” screen with the current order and past orders

4. Personal data needs to be stored securely

5. The app will get info over the network. You can propose any back-end you like, and you can assume back-end engineers will build it for you

6. Restaurants should still be viewable offline

7. A push notification will be sent when the order is ready for pick-up

![Untitled](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/Untitled%201.png)

## 3. Solutions

![架构图.png](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/%25E6%259E%25B6%25E6%259E%2584%25E5%259B%25BE.png)

## Cache Solutions

![catch work 基本流程图 (2).png](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/catch_work_%25E5%259F%25BA%25E6%259C%25AC%25E6%25B5%2581%25E7%25A8%258B%25E5%259B%25BE_(2).png)

## solution

MVVM

![Untitled](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/Untitled%202.png)

![Untitled](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/Untitled.jpeg)

VS MVC

![Untitled](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/Untitled%203.png)

VS MVP

![Untitled](Hungry%20Hippo%20app%20Technical%20Design%20Docs%2050ebd0e21e7441d189bf648d1591f952/Untitled%204.png)