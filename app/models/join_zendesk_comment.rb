class JoinZendeskComment
  attr_reader :comments

  def self.call(comments:)
    new(comments: comments).call
  end

  def initialize(comments:)
    @comments = comments
  end

  def call
    join_comments = ''
    comments.each do |comment|
      join_comments += comment[:body] + "\n"
    end

    join_comments
  end
end
