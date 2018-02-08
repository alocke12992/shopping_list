### Found issue: When navigating to view cart (when cart is empty) and selecting option 3) Exit to menu,
### you are sent to menu but the following user input causes the program to re"puts" menu instead of immediately following the command.

## How would I escape a nested loop in my add_item method?

@cart = []

@shelf = [
{item: "bread", cost: 2.00},
{item: "Milk", cost: 3.50},
{item: "Eggs", cost: 1.50},
{item: "Coffee", cost: 10.00},
]

### Cant seem to get it to add without it adding the first one added twice.
@total_cost = 0.00
def sum_total
  total_cost = 0.00
  @cart.each{|h| total_cost += h[:cost]}
  @total_cost = total_cost
end

# ========= CLEANS PUTS ========= #

def clean_cart
  @cart.each_with_index do |item, i|
    puts "#{i+1}) #{item[:item]} $#{item[:cost]}"
  end
end

def clean_shelf
  @shelf.each_with_index do |item, i|
    puts "#{i+1}) #{item[:item]} $#{item[:cost]}"
  end
end

# ========= VIEW THE SHELF ========= #
def view_shelf
  puts "--------Shelf--------"
  puts "Here are the Items on the shelf:"
  clean_shelf
end



# ========= VIEW THE CART ========= #

def view_cart
  if @cart != []
    puts "--------Cart--------"
    puts "Here are the Items in your cart:"
    clean_cart
    puts "Your current total is $#{@total_cost}"
  else
    puts "It looks like your cart is empty!"
    add_from_shelf
  end
end

# ========= EDIT THE CART ========= #

def edit_cart

  puts "Would you like to add or remove items from your cart?"
  puts "1) Add Item"
  puts "2) Remove Item"
  user_input = gets.strip.to_i
  if user_input == 1
    if @shelf == 0
      puts "The shelf is empty. Sorry, check back next week for more items!"
      edit_cart
    else
      add_item
    end
  elsif user_input == 2
    if @cart == 0
      puts "There are no items in your cart"
    else
      remove_item
    end
  else
    puts "invalid entry, please try again"
  end
end

# ========= ADD ITEM TO CART ========= #
def  add_item
  view_shelf
  if @shelf != []
    puts "which Item would you like?"
    item_num = gets.strip.to_i
    item_added = @shelf.delete_at(item_num - 1)
    @cart << item_added
    clean_cart = @cart.map.each { |h| h[:item]}
    puts "#{clean_cart[-1]} was added to the Cart"

    # -- Would like to be able to add in this loop to continue adding items until the shelf is empty ---#
    # puts "Would you like to get another item?"
    # puts "1) Yes"
    # puts "2) No"
    # user_input = gets.strip.to_i
    # if user_input == 1
    #   break if @shelf == 0
    # elsif user_input == 2
    #   puts "ok"
    # end
  else
    puts "Sorry, the shelf is empty"
  end
  sum_total
  puts "Total for all of the items in your cart is now $#{@total_cost}."
end

# ========= ALT ADD ITEM (Used from CART menu) ========= #

def add_from_shelf
  puts "Would you like to add items to your cart? (Y/N)"
  puts "1) Yes"
  puts "2) No"
  user_input = gets.strip.to_i
  if user_input == 1
    add_item
  elsif user_input == 2
    puts "Ok!"
  else
    puts "Invalid Entry, please try again"
  end
end

# ========= REMOVE ITEM FROM CART ========= #
def remove_item
  view_cart
  if @cart != 0
    puts "Which item would you like to remove?"
    item_num = gets.strip.to_i
    item_added = @cart.delete_at(item_num - 1)
    @shelf << item_added
    clean_shelf = @shelf.map.each {|item| item[:item]}
    puts "#{clean_shelf[-1]} was removed from the cart."
    sum_total
    puts "Total for all of the items in your cart is now $#{@total_cost}."
  else
    puts "The cart is empty"
  end
end


# def view_total
#   @cart_each do |cost|
#     cost += total
#   user_input = gets.strip.downcase
#   if user_input == "y"
#     add_item
#   end
# end

def menu
  puts "------Welcome to the store------"
  puts "What would you like to do?"
  puts "1) View Shelf"
  puts "2) View Cart"
  puts "3) Edit Cart"
  puts "4) Exit"
  user_input = gets.strip.downcase
  exit(0) if user_input == 'exit'
  user_input.to_i
end

while true
  case menu
    when 1
      view_shelf
    when 2
      view_cart
    when 3
      edit_cart
    when 4
      puts "Thanks for shopping with us! Come back soon!"
      exit
    else
      puts "Invalid input, please try again."
    end
  end
