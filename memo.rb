require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。

if memo_type == 1
  puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
  new_file_name = gets.chomp.to_s
  CSV.open("#{new_file_name}.csv","w") do |csv|
    puts "メモの内容を入力してください。ctrl+Dで保存します。"
    memo_content = $stdin.read
    csv << ["#{memo_content}"]
   end
elsif memo_type == 2
  puts "既存のメモを編集します。編集したいファイル名を拡張子を除いて入力してください。"
  edit_file_name = gets.chomp.to_s
  ex_data = CSV.read("#{edit_file_name}.csv")
  puts "ファイル内のメモ内容を以下に表示します。"
  puts "--------------------------------"
  puts ex_data
  puts "--------------------------------"
  CSV.open("#{edit_file_name}.csv","a") do |csv|
    puts "既存のメモ内容に追記します。追記内容を入力してください。ctrl+Dで保存します。"
    edit_content = $stdin.read
    csv << ["#{edit_content}"]
  end
else
  puts "不正な値です。1 か 2 を入力してください。"
end