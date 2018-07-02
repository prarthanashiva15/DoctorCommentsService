# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = Author.create([{name: 'Anakin Skywalker',
                          email: 'anakin.skywalker@starwars.com',
                          phone: '1234567389' },
                         {  name: 'Han Solo', email: 'han.solo@starwars.com',
                            phone: '2345678123' },
                         {  name: 'Luke Skywalker',
                            email: 'luke.skywalker@starwars.com',
                            phone: '5678432189' },
                         {  name: 'Leia Organa',
                            email: 'leia.organa@starwars.com',
                            phone: '5676474533' },
                         {  name: 'Obowan Kenobi',
                            email: 'obowan.kenobi@starwars.com',
                            phone: '2345678123' }])

doctors = Doctor.create([{group_id: 124, name: 'Benjamin Spock',
                          address: '123 Street A', latitude: '34.1808',
                          longitude: '118.3090' },
                         {  group_id: 124, name: 'Charles Burton',
                            address: '345 Street D', latitude: '34.1808',
                            longitude: '118.3090' },
                         {  group_id: 125, name: ' Mark Hall',
                            address: '200 Block A', latitude: '34.1808',
                            longitude: '118.3090' },
                         {  group_id: 130, name: ' Peter Leavitt',
                            address: '123 Street A', latitude: '34.1808',
                            longitude: '118.3090' },
                         { group_id: 125, name: 'Jeremy Stone',
                           address: '54 North Drive', latitude: '34.1808',
                           longitude: '118.3090' }])

specialties = Specialty.create([{ name: 'Surgon' },
                                { name: 'Cardiologists' },
                                { name: 'Dermatologists' },
                                { name: 'Family Physicians' }])


doctors_specialties = DoctorsSpecialty.create([{ doctors_id: doctors[0].id,
                                                 specialties_id:
                                                    specialties[1].id },
                                               { doctors_id: doctors[1].id,
                                                 specialties_id:
                                                     specialties[0].id },
                                               {  doctors_id: doctors[2].id,
                                                  specialties_id:
                                                      specialties[3].id },
                                               {  doctors_id: doctors[4].id,
                                                  specialties_id:
                                                      specialties[3].id },
                                               {  doctors_id: doctors[3].id,
                                                  specialties_id:
                                                      specialties[0].id }])

