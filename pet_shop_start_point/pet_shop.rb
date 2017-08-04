
def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop = pet_shop[:admin][:total_cash]
  return pet_shop
end

def add_or_remove_cash(pet_shop, num)
  total_cash = pet_shop[:admin][:total_cash] += num
  return total_cash
end

def pets_sold(pet_shop)
  pet_shop = pet_shop[:admin][:pets_sold]
  return pet_shop
end

def increase_pets_sold(pet_shop, number_sold)
  pet_shop[:admin][:pets_sold] += number_sold
  return pet_shop[:admin][:pets_sold]
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, case_breed)
  # breed = pet_shop[:pets][:breed]
  breed_array = []
  for pet in pet_shop[:pets] do
    if case_breed == pet[:breed]
      breed_array.push(pet)
    end
  end
  return breed_array
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets] do
    if name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets] do
    if name == pet[:name]
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customers)
  return customers[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end


def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] >= new_pet[:price]
    return true
  else
    false
  end
end

def sell_pet_to_customer (pet_shop, pet, customer)
  if ( pet != nil && customer_can_afford_pet(customer, pet))
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
      add_or_remove_cash(pet_shop, pet[:price])
  end
end
