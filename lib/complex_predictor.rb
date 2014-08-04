require_relative 'predictor'

class ComplexPredictor < Predictor

  def train!
    @data = {}

    @all_books.each do |category, books|
      @data[category] = {}
      books.each do |filename, tokens|
        tokens = tokens[2000..-2000].reject {|token| !good_token?(token)}
        sorted_tokens_array = tokens.inject(Hash.new(0)) {|m, e| m[e] += 1; m}.select {|k,v| v > 1000}
        # tokens_hash = Hash[*sorted_tokens_array]
        @data[category] = @data[category].merge(sorted_tokens_array)
      end
    end
  end

  def predict(tokens)
    true_count = []
    temp_count = []
    current_category = nil

    @data.each do |category, keywords|
      true_count = []
      tokens[2000 .. -2000].each { |token| true_count << true if keywords[token] }
      current_category = category if true_count.length > temp_count.length
      temp_count = true_count if true_count.length > temp_count.length
    end
    current_category
  end
end
