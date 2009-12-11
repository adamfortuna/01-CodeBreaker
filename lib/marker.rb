class Marker
  def initialize(secret)
    @secret = secret #['r','r','r','r']
  end
  def guess(these)
    # secret: ['r','r','b','b']
    # these: ['b','g','g','g']

    results = []
    these.each_with_index do |place, i|
      if @secret[i] == place
        results.push("p")
      elsif @secret.include?(place) 
        results.push("m")
      end
    end
    results.sort.reverse
  end
  
  def mark
  end
end
