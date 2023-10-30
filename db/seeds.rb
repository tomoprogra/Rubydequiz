# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
questions_data = [
  {
    content: "Rubyはどの言語に影響を受けているか？",
    options: [
      { content: "Python", correct: false },
      { content: "Perl", correct: true },
      { content: "JavaScript", correct: false },
      { content: "Java", correct: false }
    ]
  },
  {
    content: "Ruby on Railsは、どのパターンをベースにしているか？",
    options: [
      { content: "MVC", correct: true },
      { content: "MVP", correct: false },
      { content: "MVVM", correct: false },
      { content: "Observer", correct: false }
    ]
  },
  {
    content: "Rubyで文字列を定義する際に使用する記号は？",
    options: [
      { content: "{}", correct: false },
      { content: "[]", correct: false },
      { content: "()", correct: false },
      { content: '"" or \'\'', correct: true }
    ]
  },
  {
    content: "Rubyの真偽値で「偽」を示すものはどれ？",
    options: [
      { content: "nil", correct: true },
      { content: "0", correct: false },
      { content: "空文字", correct: false },
      { content: "true", correct: false }
    ]
  },
  {
    content: "Rubyで配列の最後の要素を取得するメソッドは？",
    options: [
      { content: ".last", correct: true },
      { content: ".end", correct: false },
      { content: ".final", correct: false },
      { content: ".terminate", correct: false }
    ]
  }
]

questions_data.each do |data|
  question = Question.create(content: data[:content])
  data[:options].each do |option_data|
    question.options.create(option_data)
  end
end
