Kitten.destroy_all

names = %w[Arya Haru Meera Yuki Rohan Akira Kavya Sakura Dev Hiro Asha Aiko Tako Neko Onibu]

20.times do |i|
  Kitten.create!(
    name: names.sample,
    age: rand(1..12),
    cuteness: rand(1..10),
    softness: rand(1..10)
  )
end

puts("Seeded #{Kitten.count} kittens with Indian and Japanese names!")
