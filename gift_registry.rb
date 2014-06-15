class ConsumerInterface

	attr_accessor :name :database

	def initialize (name)
		@name = name
		@database = Database.new
	end

	def greeting
		puts "Hello #{@name}"	
	end

	def selection
		puts "Please choose an option"
		puts "[1] Add an item to your wishlist"
		puts "[2] Add a gift for someone else"
		puts "[3] View wishlist"
		puts "[4] View gift registry"
		puts "[5] Modify wishlist or gift directory"
		selection_choice = gets.chomp
		case selection_choice
			when 1 then add_item_to_wishlist
			when 2 then add_gift_to_gift_registry
	end

	def add_item_to_wishlist
		puts "What item would you like to add?"
		wishlist_item = gets.chomp
		puts "How many #{wishlist_item}s would you like?"
		wishlist_item_quantity = gets.chomp.to_i
		puts "Great, you have added #{wishlist_item_quantity} #{wishlist_item}(s)!"
		@database.add_to_wishlist(ItemInfo.new(wishlist_item, wishlist_item_quantity))
		selection
	end

	def add_gift_to_gift_registry
		puts "What gift would you like to add?"
		gift_registry_item = gets.chomp
		puts "Who is the gift for?"
		gift_recipient = gets.chomp
		puts "How many #{gift_registry_item}(s) do you think #{gift_recipient} would like?"
		gift_registry_item_quantity = gets.chomp.to_i
		puts "Great you have added #{gift_registry_item_quantity} #{ift_registry_item}(s) for #{gift_recipient}"
		@database.add_to_gift_registry(GiftInfo.new(gift_registry_item, gift_recipient, gift_registry_item_quantity))
		selection
	end
end

class ItemInfo

	attr_accessor :wishlist_item , :wishlist_item_quantity, :item_id

	def initialize (wishlist_item, wishlist_item_quantity)
		@wishlist_item = wishlist_item
		@wishlist_item_quantity = wishlist_item_quantity
	end

	def to_s
		"#{@wishlist_item}, #{@wishlist_item_quantity}"
	end
end


class GiftInfo

	attr_accessor :gift_registry_item, :gift_recipient, :gift_registry_item_quantity, :gift_id

	def initialize(gift_registry_item, gift_recipient, gift_registry_item_quantity)
		@gift_registry_item = gift_registry_item
		@gift_recipient = gift_recipient
		@gift_registry_item_quantity = gift_registry_item_quantity
	end

	def to_s
		"#{@gift_registry_item}, #{@gift_recipient}, #{@gift_registry_item_quantity}"
	end
end

class Database

	def initialize
		@wishlist = []
		@gift_registry = []
		@gift_id = 100
		@item_id = 100
	end
end












