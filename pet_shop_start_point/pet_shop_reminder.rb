
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(cash)
  return cash[:admin][:total_cash]
end

def add_or_remove_cash(total_cash, new_cash)
  sum = total_cash[:admin][:total_cash] += new_cash
  return sum
end

def pets_sold(pets_sold)
  return pets_sold[:admin][:pets_sold]
end

def increase_pets_sold(current, pets_sold)
  sum = current[:admin][:pets_sold] += pets_sold
  return sum
end

def stock_count(stock)
  return stock[:pets].count
  return stock[:pets].length
  #on Monday ask the difference between .count & .length#
end

def pets_by_breed(pet_shop, breed)
  breed_count = []
  for pet in pet_shop[:pets] do
    if breed == pet[:breed]
      breed_count.push(pet)
    end
  end
  return breed_count
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets] do
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets] do
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  sum = customer[:pets].push(new_pet)
  return sum
end

def customer_can_afford_pet(funds, new_pet)
  if funds[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if ( pet != nil && customer_can_afford_pet(customer, pet) )
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet)
    increase_pets_sold(pet_shop, 1)
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
