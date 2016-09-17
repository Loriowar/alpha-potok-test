# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# First legal entity
user = User.create(name: 'ЮЛ1')
credit = Credit.create(amount: 1_000_000, duration: 6, period: 1, annual_rate_base: 0.3, annual_rate_delay: 0.5, user: user)
6.times{CreditPayment.create(amount: 191_666.67, credit: credit)}

# Second legal entity
user = User.create(name: 'ЮЛ2')
credit = Credit.create(amount: 1_000_000, duration: 6, period: 1, annual_rate_base: 0.3, annual_rate_delay: 0.5, user: user)
3.times{CreditPayment.create(amount: 191_666.67, credit: credit)}
CreditPayment.create(amount: 525_000.00, credit: credit)
2.times{CreditPayment.create(amount: 0.0, credit: credit)}

# Third legal entity
user = User.create(name: 'ЮЛ3')
credit = Credit.create(amount: 1_000_000, duration: 6, period: 1, annual_rate_base: 0.3, annual_rate_delay: 0.5, user: user)
2.times{CreditPayment.create(amount: 191_666.67, credit: credit)}
4.times{CreditPayment.create(amount: 208_333.67, credit: credit)}