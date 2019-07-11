class ExtractNouns
  attr_reader :sentence

  def self.call(sentence:)
    new(sentence: sentence).call
  end

  def initialize(sentence:)
    @sentence = sentence
  end

  def call
    keywords = []
    Natto::MeCab.new.parse(sentence) do |n|
      keywords.push(n.surface) if n.feature.split(',').first == '名詞'
    end

    keywords
  end
end
