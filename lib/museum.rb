class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      exhibit.name == exhibit_match(exhibit, patron)[0]
    end
  end

  def exhibit_match(exhibit, patron)
    patron.interests.select do |interest|
      interest == exhibit.name
    end
  end

  def admit(patron)
    @patrons << patron
  end

  # def patrons_by_exhibit_interest
  #   @patrons.map do |patron|
  #     @patrons_by_exhibit_interest.map do |exhibit_key|
  #       exhibit_match(exhibit_key[0], patron)
  #     end
  #   end
  # end
  #
  # def create_exhibits_as_keys
  #   @patrons_by_exhibit_interest = {}
  #   @exhibits.each do |exhibit|
  #     @patrons_by_exhibit_interest[exhibit] = []
  #   end
  #   @patrons_by_exhibit_interest
  # end

  # def exhibit_recommended_patrons
  #   hash = {}
  #   @exhibits.map do |exhibit|
  #     exhibit.
  #
  #   hash
  # end

  def patron_array
    hash = {}
    @patrons.map do |patron|
      @exhibits.each do |exhibit|
        if !exhibit_match(exhibit, patron).empty?
          hash[exhibit] = patron
        end 
      end
    end
  end
end
