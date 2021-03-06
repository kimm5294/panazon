class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password

  has_many :connections_as_friender, class_name: "Connection", foreign_key: "friender_id"
  has_many :connections_as_friendee, class_name: "Connection", foreign_key: "friendee_id"
  has_many :friendees, through: :connections_as_friender
  has_many :frienders, through: :connections_as_friendee
  has_many :items_for_sale, class_name: "Item", foreign_key: "seller_id"
  has_many :sales, through: :items_for_sale, source: :transactions
  has_many :purchases, class_name: "Transaction", foreign_key: "buyer_id"
  has_many :purchased_items, through: :purchases, source: :item


  def friends
    self.frienders + self.friendees
  end

  def five_friends
    if self.friends.length >= 5
      self.friends.sample(5)
    else
      self.friends.sample(self.friends.length)
    end
  end

  def cart
    self.purchases.where("purchased = 'false'")
  end

  def past_orders
    self.purchases.where("purchased = 'true'")
  end

  def is_friends_with?(friendee)
    !!connection(friendee)
  end

  def connection(friendee)
    if !!Connection.find_by(friender_id: self.id, friendee_id: friendee.id)
      return Connection.find_by(friender_id: self.id, friendee_id: friendee.id)
    elsif !!Connection.find_by(friender_id: friendee.id, friendee_id: self.id)
      return Connection.find_by(friender_id: friendee.id, friendee_id: self.id)
    else
      return nil
    end
  end

  def sold_items
    self.sales.where("purchased = 'true'")
  end

  def checkout
    self.cart.map do |sale|
      sale.update_attributes(purchased: true)
      sale.item.decrement!(:count, by = sale.quantity)
    end
  end

  def friends_activities_feed
    self.friends_activities.sort_by { |activity| activity.created_at }.reverse.take(10)
  end

  def friends_activities
    activities_with_duplicates = self.friends_purchases + self.friends_sales
    activities_with_duplicates.uniq
  end

  def friends_purchases
    friends_purchases = []
    self.friends.each do |friend|
      friend.purchases.each do |purchase|
        friends_purchases << purchase
      end
    end
    friends_purchases
  end

  def friends_sales
    friends_sales = []
    self.friends.each do |friend|
      friend.sales.each do |sale|
        friends_sales << sale
      end
    end
    friends_sales
  end

  def clear_cart
    self.cart.map do |sale|
      sale.destroy
    end
  end
end
