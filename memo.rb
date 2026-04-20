require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください。"
    titl = gets.chomp
    puts "メモしたい内容を入力してください。"
    puts "完了したらcontrol＋Dを押してください"
    contents = readlines(chomp:true)
    CSV.open("#{titl}.csv","w") do |csv|
        contents.each do |line|
            csv << [line]
        end
    end
    
elsif memo_type == 2
    puts "既存のファイルを開きます。拡張子を除いたファイル名を入力してください。"
    titl2 = gets.chomp
    puts "メモを編集してください"
    puts "完了したらcontrol＋Dを押してください"
    contents2 = readlines(chomp:true)
    
    CSV.open("#{titl2}.csv","a+") do |csv|
        contents2.each do |line|
            csv << [line]
        end
    end
else
    puts "不正な値です。「１」か「２」を入力してください。"
end
