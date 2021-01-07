class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
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

end
