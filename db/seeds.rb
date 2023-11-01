# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Option.delete_all
Question.delete_all
questions_data = [
  # 初級
  {
    content: "1問目: Rubyの基本的なデータ型として正しいものは？",
    level: "beginner",
    explanation: "Rubyの基本的なデータ型には、整数、文字列、配列などがあります。",
    options: [
      { content: "HTML", correct: false },
      { content: "整数", correct: true },
      { content: "Photoshop", correct: false },
      { content: "Windows", correct: false }
    ]
  },
  {
    content: "2問目: Rubyで文字列を定義する際に使用する記号は？",
    level: "beginner",
    explanation: "Rubyで文字列を定義する際には、ダブルクォート(\")またはシングルクォート(')を使用します。",
    options: [
      { content: "{}", correct: false },
      { content: "[]", correct: false },
      { content: "()", correct: false },
      { content: "\"\"", correct: true }
    ]
  },
  {
    content: "3問目: Rubyで配列の最初の要素を取得するメソッドは？",
    level: "beginner",
    explanation: "配列の最初の要素を取得するには、`first`メソッドを使用します。",
    options: [
      { content: "begin", correct: false },
      { content: "start", correct: false },
      { content: "first", correct: true },
      { content: "initial", correct: false }
    ]
  },
  {
    content: "4問目: Rubyで文字列を大文字に変換するメソッドは？",
    level: "beginner",
    explanation: "文字列を大文字に変換するには、`upcase`メソッドを使用します。",
    options: [
      { content: "uppercase", correct: false },
      { content: "upcase", correct: true },
      { content: "toupper", correct: false },
      { content: "capitalize", correct: false }
    ]
  },
  {
    content: "5問目: Rubyの真偽値で「真」を表すものは？",
    level: "beginner",
    explanation: "Rubyの真偽値で「真」を表すのは`true`です。",
    options: [
      { content: "truth", correct: false },
      { content: "yes", correct: false },
      { content: "true", correct: true },
      { content: "correct", correct: false }
    ]
  },
  # 中級
  {
    content: "1問目: Rubyのモジュールをクラスに取り込むためのキーワードは？",
    level: "intermediate",
    explanation: "Rubyのモジュールをクラスに取り込むためのキーワードは`include`です。",
    options: [
      { content: "import", correct: false },
      { content: "require", correct: false },
      { content: "include", correct: true },
      { content: "extend", correct: false }
    ]
  },
  {
    content: "2問目: Rubyで不変の値を持つオブジェクトを何と呼ぶ？",
    level: "intermediate",
    explanation: "Rubyで不変の値を持つオブジェクトは`freeze`メソッドを使用して、オブジェクトを凍結することができます。",
    options: [
      { content: "static", correct: false },
      { content: "frozen", correct: true },
      { content: "immutable", correct: false },
      { content: "constant", correct: false }
    ]
  },
  {
    content: "3問目: Ruby on Railsで、データベースの変更を管理する仕組みは？",
    level: "intermediate",
    explanation: "Ruby on Railsで、データベースの変更を管理する仕組みは`マイグレーション`です。",
    options: [
      { content: "Migration", correct: true },
      { content: "Modification", correct: false },
      { content: "Alteration", correct: false },
      { content: "Transformation", correct: false }
    ]
  },
  {
    content: "4問目: Rubyで、オブジェクトのメソッドを動的に呼び出すメソッドは？",
    level: "intermediate",
    explanation: "Rubyで、オブジェクトのメソッドを動的に呼び出すためのメソッドは`send`または`public_send`です。",
    options: [
      { content: "invoke", correct: false },
      { content: "call", correct: false },
      { content: "send", correct: true },
      { content: "trigger", correct: false }
    ]
  },
  {
    content: "5問目: Ruby on RailsのMVCアーキテクチャで、Cは何を指す？",
    level: "intermediate",
    explanation: "Ruby on RailsのMVCアーキテクチャにおけるCは`Controller`を指します。",
    options: [
      { content: "Class", correct: false },
      { content: "Component", correct: false },
      { content: "Controller", correct: true },
      { content: "Compiler", correct: false }
    ]
  },
  {
    content: "1問目: Rubyのメタプログラミングで、クラスの定義を動的に変更するためのメソッドは？",
    level: "advanced",
    explanation: "Rubyの`class_eval`メソッドを使用すると、クラスの定義を動的に変更することができます。",
    options: [
      { content: "eval", correct: false },
      { content: "instance_eval", correct: false },
      { content: "class_eval", correct: true },
      { content: "define_method", correct: false }
    ]
  },
  {
    content: "2問目: Ruby on Railsで、特定のコントローラのアクションをスキップするメソッドは？",
    level: "advanced",
    explanation: "Ruby on Railsの`skip_before_action`メソッドを使用すると、特定のコントローラのアクションをスキップすることができます。",
    options: [
      { content: "skip_action", correct: false },
      { content: "skip_before_action", correct: true },
      { content: "ignore_action", correct: false },
      { content: "pass_action", correct: false }
    ]
  },
  {
    content: "3問目: Rubyで、特定のオブジェクトが特定のモジュールのインスタンスであるかどうかを確認するメソッドは？",
    level: "advanced",
    explanation: "Rubyの`is_a?`メソッドや`kind_of?`メソッドを使用すると、特定のオブジェクトが特定のモジュールのインスタンスであるかどうかを確認することができます。",
    options: [
      { content: "instance_of?", correct: false },
      { content: "is_a?", correct: true },
      { content: "belongs_to?", correct: false },
      { content: "kind_of?", correct: true }
    ]
  },
  {
    content: "4問目: Ruby on Railsで、複数の関連するモデルを一度に保存する機能は？",
    level: "advanced",
    explanation: "Ruby on Railsの`accepts_nested_attributes_for`メソッドを使用すると、親モデルと関連する子モデルの属性を一度に保存することができます。",
    options: [
      { content: "saves_related_models", correct: false },
      { content: "accepts_child_attributes", correct: false },
      { content: "accepts_nested_attributes_for", correct: true },
      { content: "saves_associated_records", correct: false }
    ]
  },
  {
    content: "5問目: Rubyのスレッドセーフとは何か？",
    level: "advanced",
    explanation: "スレッドセーフとは、複数のスレッドが同時に実行されても、データの状態が壊れないように設計されていることを指します。",
    options: [
      { content: "スレッドが安全に終了すること", correct: false },
      { content: "複数のスレッドが同時に実行されてもデータの状態が壊れないこと", correct: true },
      { content: "スレッドが例外を発生させないこと", correct: false },
      { content: "スレッドが他のスレッドと通信できること", correct: false }
    ]
  }
]

questions = []
options = []

questions_data.each do |data|
  question = Question.new(content: data[:content], explanation: data[:explanation], level: data[:level])
  data[:options].each do |option_data|
    option = Option.new(option_data)
    option.question = question
    options << option
  end
  questions << question
end

# 一括INSERT
Question.import questions
Option.import options