institutes = %w[Karnataka Rourkela Raipur Delhi Trichy]
degrees = ['B.Tech', 'M.Tech', 'B.Engg', 'B.Sc', 'M.Sc']
branches = ['Computer Science And Engineering', 'Information Technology', 'Electrical And Electronics Engineering', 'Electronics And Communication Engineering']

institutes.each do |institute|
  name = 'National Institute of Technology ' + institute
  Institute.create!(name: name)
end
puts 'Institutes Created'

degrees.each do |degree|
  Degree.create!(name: degree)
end
puts 'Degrees Created'

branches.each { |branch| Branch.create!(name: branch) }
puts 'Branches Created'

institutes = Institute.all
branches = Branch.all
degrees = Degree.all

interests = {
  'Computer Science And Engineering': [
    'Machine Learning',
    'Cryptography',
    'Artificial Intelligence',
    'Number Theory',
    'Networks'
  ],
  'Information Technology': [
    'Social Media',
    'Network Analysis',
    'Big Data',
    'Parallel Computing',
    'Data Structures And Algorithms'
  ],
  'Electrical And Electronics Engineering': [
    'Telecommunications',
    'Microelectronics',
    'Signal Processing',
    'Control Systems',
    'Power Engineering'
  ],
  'Electronics And Communication Engineering': [
    'Integrated Circuits',
    'Microelectronics',
    'Electromagnetics',
    'Remote Sensing',
    'Power and Energy Systems',
  ],
}

User.create(
  name: 'Abhishek Kumar',
  email: 'abhishekkumar@gmail.com',
  password: 'passwd',
  institute_id: 1,
  degree_id: 1,
  branch_id: 1,
  phone_numbers: [],
  interests: []
)

100.times do |i|
  name = Faker::Name.name
  email = Faker::Internet.email(name: name)
  institute = institutes.sample
  branch = branches.sample
  degree = degrees.sample
  user_interests = [interests[branch.name.to_sym].sample, interests[branch.name.to_sym].sample]
  description = "Hi! I am #{name}, working at #{institute.name} on the fields of #{user_interests[0]} and #{user_interests[1]}"

  education = [["#{degree.name}", "#{institute.name}", 2019]]
  acheivements = [
    ["Published a paper on #{user_interests[0]}", '2019']
  ]

  User.create!(
    name: name,
    email: email,
    password: 'passwd',
    institute: institute,
    branch: branch,
    interests: user_interests,
    degree: degree,
    achievements: acheivements,
    description: description,
    education: education,
    phone_numbers: [Faker::PhoneNumber.cell_phone]
  )
end
second = User.second
User.first.update(interests: second.interests, achievements: second.achievements, description: second.description, education: second.education) 
puts 'Users created'

users = User.all

25.times do
  user = users.sample
  institute_id = user.institute_id
  collab_interest = user.interests[rand(2)]
  title = "A collaboration on #{collab_interest}"
  description = "Hi! I am working on problem in the field of #{collab_interest}"
  Collaboration.create(
    user: user,
    institute_id: institute_id,
    title: title,
    fields: [collab_interest],
    description: description
  )
end
puts 'Collaborations created'

interests = interests.values.flatten

25.times do
  institute = institutes.sample
  event_interests = [interests.sample, interests.sample]
  certified = rand(2) == 1
  title = "A workshop on #{event_interests[0]} and #{event_interests[1]}"
  description = "A #{'Certified' if certified} workshop by #{institute.name} on #{event_interests[0]} and #{event_interests[1]}"
  price = rand(5000)
  start_date = DateTime.now
  end_date = DateTime.now + rand(10)

  Event.create!(
    institute: institute,
    title: title,
    description: description,
    fields: event_interests,
    certification: certified,
    price: price,
    start_date: start_date,
    end_date: end_date,
    phone_numbers: [Faker::PhoneNumber.cell_phone]
  )
end
puts 'Events created'

25.times do 
  user = users.sample
  paper_fields = [interests.sample, interests.sample]
  abstract = "A paper on the interesting fields of #{paper_fields[0]} and #{paper_fields[1]}"
  journal_link = 'https://localhost:3000/papers'
  title = "A paper on #{paper_fields.join(', ')}"
  Paper.create!(
    user: user,
    institute_id: user.institute_id,
    fields: paper_fields,
    journal_link: journal_link,
    abstract: abstract,
    title: title
  )
end
puts 'Papers created'

25.times do
  grant_interests = [interests.sample, interests.sample]
  title = "Grant for exploring the topics #{grant_interests[0]} and #{grant_interests[1]}"
  description = "Our institution believes progress in important in the fields #{grant_interests.join(', ')}."
  Grant.create!(
    title: title,
    description: description,
    submission_deadline: DateTime.now + rand(2*365),
    fields: grant_interests,
    amount: rand(100000)
  )
end
puts 'Grants created'

Conversation.seed(15)
puts 'Conversations created'
