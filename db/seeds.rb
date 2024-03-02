25.times do
  Article.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph(sentence_count: 10)
  )
end

Article.reindex
