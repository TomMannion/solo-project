>As a customer
>So that I can check if I want to order something
>I would like to see a list of dishes with prices.
>
>As a customer
>So that I can order the meal I want
>I would like to be able to select some number of several available dishes.
>
>As a customer
>So that I can verify that my order is correct
>I would like to see an itemised receipt with a grand total.
>
>As a customer
>So that I am reassured that my order will be delivered on time
>I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

# Objectives

1. See list of dishes with prices - keyword: List
2. Select some number of dishes avaliable - keyword: select, avaliable
3. itemised receipt with grand total - keyword: itemised, total
4. Send a test with twillow, "Thank you! Your order was placed and will be delivered before 18:52" after i order - keywords: twillow, after order, include time

# Class structure

Resturant(Child to "Customer") - initliazes with @Menu : Array of MenuItem objects && @customers : Array of customers

Customer(Parent to "Resturant") - initliazes with @order: Array of order objects -  Holds @name, @phone_num - Takes 

MenuItem (Child to "Resturant")

OrderItem (Child to "Customer, MenuItem")

## MenuItem Methods

1. initialize with @dish and @price

## OrderItem Methods

1. initialize with MenuItem
2. @amount - amount of menu item

## Customer Methods

1. initialize with @name, @phone_num, @resturant and @order = [OrderItem obj]
2. add_to_order(MenuItem obj from Menu, @amount int)
3. remove_from_order(MenuItem obj from Menu, @amount int)
4. check_order - return itemized list and price
5. pay_for_order/send_confirmation - twillow request

## Resturant Methods

1. intiliaze with @menu = [MenuItem obj]
2. menu = return all menu items