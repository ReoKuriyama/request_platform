class JoinZendeskComment
  attr_reader :comments

  def self.call(comments:)
    new(comments: comments).call
  end

  def initialize(comments:)
    @comments = comments
  end

  def call
    comments.pluck(:body).join("\n")
  end
end
