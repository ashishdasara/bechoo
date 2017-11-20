# Bechoo.com

## ** Problem Definition **

  Online Buy and Sell Platform

Users will be able to view ads, add comments to existing ads and post ads of products in already existing categories and sub-categories. The users can also add the ads to their carts and change the quantity of the products.

The activities that can be performed are as follows:

* User (Before logging in)
  * Check other ads
  * Post Ad
* User (After Login)
  * Post Ad
  * Edit and delete ad
  * Add products to cart
  * Add comments to other ads
  * Message the seller of the ads for further contact.

* Admin
  * Post ads
  * Approve or delete advertisements
  * Create categories and sub-categories
  * Check ads
  * Approve new user applications
  * Create new Admins
  * Delete users but not other admins
  * Approve/Delete comments

The user applies for an account that needs to be approved by the Admin for further login actions. Furthermore, the user cannot add his own product to his cart, and neither can he message himself. The user recieves a welcome email when he signs up for the website, and another again after his account is approved by an admin. He also recieves a mail when any user messages him for the first time with query related to the advertisement he posted.

## ** Ruby and rails version **

  Version 3.10.0 (ruby 2.4.0-p0), codename: Russell's Teapot

## ** How to run the test suite

  I have added some seeds to the project which might help in the evaluating process. I have added an admin account, one user account(unapproved), one user account(approved), two categories and teo sub-categories to the first category. Some parts of the project are visible only to the admins. Only admin can promote other users to admins, but the admin accounts cannot be deleted thereafter.

  admin account:
    login: adminadmin
    password: password

  customer account(approved):
    login: userfirst
    password: password
