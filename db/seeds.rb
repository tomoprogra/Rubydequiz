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
    content: "1問目.Rubyの`yield`キーワードはどのような場面で使用されますか？",
    explanation: "`yield`は、ブロックをメソッドに渡す際に使用されるキーワードです。メソッド内で`yield`を使用すると、そのメソッドに渡されたブロックが実行されます。",
    options: [
      { content: "外部APIを呼び出す際", correct: false },
      { content: "ブロックをメソッドに渡す際", correct: true },
      { content: "例外を発生させる際", correct: false },
      { content: "変数のスコープを変更する際", correct: false }
    ]
  },
  {
    content: "2問目.Ruby on Railsで、データベースのマイグレーションを実行するコマンドは何ですか？",
    explanation: "データベースのマイグレーションを実行するためには、`rails db:migrate`コマンドを使用します。",
    options: [
      { content: "rails db:seed", correct: false },
      { content: "rails db:migrate", correct: true },
      { content: "rails db:schema:load", correct: false },
      { content: "rails db:setup", correct: false }
    ]
  },
  {
    content: "3問目.Rubyの`||=`という演算子の主な用途は何ですか？",
    explanation: "`||=`は、変数が未定義または`nil`の場合にのみ値を代入するための演算子です。",
    options: [
      { content: "変数の値を2倍にする", correct: false },
      { content: "変数の値を除算する", correct: false },
      { content: "変数が未定義またはnilの場合に値を代入する", correct: true },
      { content: "変数の値を加算する", correct: false }
    ]
  },
  {
    content: "4問目.Ruby on Railsの「Convention over Configuration」の意味は何ですか？",
    explanation: "「Convention over Configuration」は、Railsの設計原則の一つで、デフォルトの設定や規約を優先し、特別な設定は必要最小限にするという意味です。",
    options: [
      { content: "設定よりもコードを優先する", correct: false },
      { content: "設定よりも規約を優先する", correct: true },
      { content: "設定を完全に無視する", correct: false },
      { content: "規約を完全に無視する", correct: false }
    ]
  },
  {
    content: "5問目.Rubyの`map`メソッドと`each`メソッドの主な違いは何ですか？",
    explanation: "`map`メソッドは、配列の各要素に対してブロックを適用した結果を新しい配列として返します。一方、`each`メソッドは、配列の各要素に対してブロックを適用するだけで、元の配列を変更しません。",
    options: [
      { content: "`map`は配列を変更し、`each`は変更しない", correct: false },
      { content: "`map`と`each`は同じ動作をする", correct: false },
      { content: "`map`は新しい配列を返し、`each`は元の配列を返す", correct: true },
      { content: "`map`はブロックを受け取らない", correct: false }
    ]
  }
]


questions_data.each do |data|
    question = Question.create(content: data[:content], explanation: data[:explanation])
    data[:options].each do |option_data|
      question.options.create(option_data)
    end
  end
