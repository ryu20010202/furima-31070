FactoryBot.define do
  factory :address_order do
    postal_cord {"194-0003"}
    prefectures { Faker::Number.within(range: 2..48) }
    municipality {"町田市"}
    house_number {"小川5-6-1"}
    building {"aaa"}
    phone_number {12345678901}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
