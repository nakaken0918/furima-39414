# README
## NOT NULL ##

## users table（出品者の登録情報）##

  # name（string
  # mail（string, unique
  # password（string

  ## 氏名 ##
  # name_first（string
  # name_family（string
  # name_first_kana（string
  # name_family_kana（string

  ## 生年月日 ##
  # birth_year（select（1930~2030
  # birth_month（select（1~12
  # birth_day（select（1~31

## items table（商品の登録情報）##

  # image（ActiveStorage
  # goods（text（~40字まで
  # explain（text（~1,000字まで

  # category（select
  #   ---, レディース, メンズ, ベビー・キッズ, インテリア・住まい・小物, 本・音楽・ゲーム,
  #   おもちゃ・ホビー・グッズ ,家電・スマホ・カメラ, スポーツ・レジャー, ハンドメイド, その他

  # condition（select
  #   ---, 新品・未使用, 未使用に近い, 目立った傷や汚れなし, やや傷や汚れあり, 傷や汚れあり, 全体的に状態が悪い
  
  # shipping（select
  #   ---, 着払い(購入者負担), 送料込み(出品者負担)

  # shipping_region（select
  #   ---, 北海道, 青森県, 岩手県, 宮城県, 秋田県, 山形県, 福島県, 茨城県, 栃木県, 群馬県, 埼玉県, 千葉県,
  #   東京都, 神奈川県, 新潟県, 富山県, 石川県, 福井県, 山梨県, 長野県, 岐阜県, 静岡県, 愛知県, 三重県, 滋賀県,
  #   京都府, 大阪府, 兵庫県, 奈良県, 和歌山県, 鳥取県, 島根県, 岡山県, 広島県, 山口県, 徳島県, 香川県,
  #   愛媛県, 高知県, 福岡県, 佐賀県, 長崎県, 熊本県, 大分県, 宮崎県, 鹿児島県, 沖縄県

  # shipping_date（select
  #   ---, 1~2日で発送, 2~3日で発送, 4~7日で発送

  # price（string(300~9,999,999),

  ## 出品者情報 ##
  # user（references,外部キー

## orders table（商品購入に必要な情報）##

  ## カード情報 ##
  # card_number（string（xxxx xxxx xxxx xxxx ,カード番号16桁
  # card_date（string（xx/xx ,有効期限,「/」は自動入力,期限切れは赤字
  # card_code（string（セキュリティコード4桁

  # zip_code（string（「-」込みの8桁

  # province（select
  #   ---, 北海道, 青森県, 岩手県, 宮城県, 秋田県, 山形県, 福島県, 茨城県, 栃木県, 群馬県, 埼玉県, 千葉県,
  #   東京都, 神奈川県, 新潟県, 富山県, 石川県, 福井県, 山梨県, 長野県, 岐阜県, 静岡県, 愛知県, 三重県, 滋賀県,
  #   京都府, 大阪府, 兵庫県, 奈良県, 和歌山県, 鳥取県, 島根県, 岡山県, 広島県, 山口県, 徳島県, 香川県,
  #   愛媛県, 高知県, 福岡県, 佐賀県, 長崎県, 熊本県, 大分県, 宮崎県, 鹿児島県, 沖縄県

  # city（string
  # house（string
  # building（string, NULL OK!
  # telephone（string（「-」無しの11桁

  ## 商品の情報 ##
  # item（reference,外部キー