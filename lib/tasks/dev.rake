namespace :dev do
	DEFAULT_PASSWORD = 'adminCL'

	desc 'Prepara o ambiente de desenvolvimento'
	task setup: :environment do
		if Rails.env.development?
			%x(rails db:drop db:create db:migrate)
			%x(rails dev:add_default_admin)
			%x(rails dev:add_default_admin_profile)
			%x(rails dev:add_schools)
			%x(rails dev:add_default_user)
			%x(rails dev:add_default_user_profile)
			%x(rails dev:add_ceics)
			%x(rails dev:add_programs)
			%x(rails dev:add_projects)
			%x(rails dev:add_classrooms)
			#%x(rails dev:add_lessons)
			%x(rails dev:add_others_users)
			%x(rails dev:add_address)
			%x(rails dev:add_phone_numbers)
			%x(rails dev:add_default_educ)
			%x(rails dev:add_default_educ_profile)
		else
			puts 'Ambiente não é desenvolvimento'
		end
	end

	desc 'Adiciona admin padrão'
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.org.br',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end

	desc 'Adiciona admin profile padrão'
  task add_default_admin_profile: :environment do
    AdminProfile.create!(
			name: 'Administrador Padrão',
			role: 'Manager',
			active: true,
			admin: Admin.first
    )
  end

	desc 'Adiciona escolas'
	task add_schools: :environment do
		file_path = File.join(Rails.root, 'tmp', 'schools.txt')
		File.open(file_path, 'r').each do |row|
			School.create!(name: row.strip)
		end
	end

	desc 'Adiciona o user padrão'
  task add_default_user: :environment do
    User.create!(
			email: 'user@user.org.br',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
    )
  end

	desc 'Adiciona o user profile padrão'
  task add_default_user_profile: :environment do
    UserProfile.create!(
      first_name: 'Usuário',
			last_name: 'Padrão',
			birthdate: Faker::Date.birthday(min_age: 8, max_age: 20),
			genre: Faker::Gender.binary_type,
			father_name: "#{Faker::Name.male_first_name}"" ""#{Faker::Name.last_name}",
			mother_name: "#{Faker::Name.female_first_name}"" ""#{Faker::Name.last_name}",
			active: true,
			school: School.first,
			user: User.first
    )
  end

	desc 'Adiciona CEICs'
	task add_ceics: :environment do
		ceics = [
			{ slug: "Patrimônio", name: "Centro de Educação Integral Patrimônio"
			},
			{ slug: "Laranjeiras", name: "Centro de Educação Integral Laranjeiras"
			},
			{ slug: "Ponta Negra", name: "Centro de Educação Integral Ponta Negra"
			}
		]
		ceics.each do |ceic|
			Ceic.create!(
				name: ceic[:name],
				slug: ceic[:slug]
			)
		end
	end

	desc 'Adiciona Programas'
	task add_programs: :environment do
		programs = [
			{ slug: "PPA", name: "Programa Pedagógico Ambiental"
			},
			{ slug: "PPS", name: "Programa Pedagógico Social"
			}
		]
		programs.each do |program|
			Program.create!(
				name: program[:name],
				slug: program[:slug]
			)
		end
	end

	desc 'Adiciona Projetos'
	task add_projects: :environment do
		projects = [
			{ name: 'Projeto Número Hum', slug: 'PNH' },
			{ name: 'Projeto Número Dois', slug: 'PND' },
			{ name: 'Projeto Número Três', slug: 'PNT' },
			{ name: 'Projeto Número Quatro', slug: 'PNQ' },
			{ name: 'Projeto Número Cinco', slug: 'PNC' },
			{ name: 'Projeto Número Seis', slug: 'PNS' },
			{ name: 'Projeto Número Sete', slug: 'PNST' },
			{ name: 'Projeto Número Oito', slug: 'PNO' },
			{ name: 'Projeto Número Nove', slug: 'PNN' },
			{ name: 'Projeto Número Dez', slug: 'PNZ' },
			{ name: 'Projeto Número Onze', slug: 'PNOZ' },
			{ name: 'Projeto Número Doze',  slug: 'PNDZ' },
			{ name: 'Projeto Número Treze', slug: 'PNTZ' },
			{ name: 'Projeto Número Quatorze', slug: 'PNQZ' }
		]
		projects.each do |project|
			Project.create!(
				name: project[:name],
				slug: project[:slug],
				program: Program.all.sample
			)
		end
	end

	desc 'Adiciona classrooms'
	task add_classrooms: :environment do

		ceics = Ceic.all

		schedules1 = ['10:00', '12:00', '14:00']
		schedules2 = ['11:00', '13:00', '15:00']
		schedules3 = ['12:00', '14:00', '16:00']

		projects1 = [1,2,3,4,5]
		projects2 = [6,7,8,9,10]
		projects3 = [11,12,13,14]

		schedules1.each do |sched|
			time = Time.zone.parse(sched)
			projects1.each do |projs|
			proj = Project.find(projs)
				ceics.all.each do |ceic|
					Classroom.create!(schedule: time, active: true, project: proj, ceic: ceic)
				end
			end
		end
		schedules2.each do |sched|
			time = Time.zone.parse(sched)
			projects2.each do |projs|
			proj = Project.find(projs)
				ceics.all.each do |ceic|
					Classroom.create!(schedule: time, active: true, project: proj, ceic: ceic)
				end
			end
		end
		schedules3.each do |sched|
			time = Time.zone.parse(sched)
			projects3.each do |projs|
			proj = Project.find(projs)
				ceics.all.each do |ceic|
					Classroom.create!(schedule: time, active: true, project: proj, ceic: ceic)
				end
			end
		end
	end

	desc 'Adiciona aula'
	task add_lessons: :environment do
		projects1 = [1,2,3,4,5]
		projects2 = [6,7,8,9,10]
		projects3 = [11,12,13,14]

		month = 9
		year = 2023
		
		weekdays1 = { tue_thu: [2, 4] }
		weekdays2= { mon_wed: [1, 3] }
		weekdays3 = { wed_fri: [3, 5] }

		matching_dates = {}
		weekdays3.each do |weekdays_name, weekdays3|
			start_date = Date.new(year, month, 1)
			end_date = Date.new(year, month, -1)

			matching_dates_for_weekdays3 = []

			current_date = start_date
			while current_date <= end_date
				if weekdays3.include?(current_date.wday)
					matching_dates_for_weekdays3 << current_date
				end
					current_date += 1
					matching_dates = matching_dates_for_weekdays3
			end
		end
		matching_dates.each do |date|
			projects = Project.find(projects3)
			projects.each do |project|
				classroom_ids = project.classrooms.ids
				classrooms = Classroom.find(classroom_ids)
				classrooms.each do |classroom|
					lesson = Lesson.create!(
						date: date,
						classroom: classroom
					)
					classroom.enrollments.each do |enrollment|
						Attendance.create!(
							lesson: lesson,
							user_profile_id: enrollment.user_profile_id
						)
					end
				end
			end
		end
	end

	desc 'Adiciona outros users'
	task add_others_users: :environment do

		genres = ['male', 'female']

		100.times do |i|
			user = User.create!(
				email: Faker::Internet.email,
				password: DEFAULT_PASSWORD,
				password_confirmation: DEFAULT_PASSWORD,
			)
			genre = genres.sample
			first_name = genre == 'male' ? Faker::Name.male_first_name : Faker::Name.female_first_name
			profile = UserProfile.create(
				first_name: first_name,
				last_name: Faker::Name.last_name,
				birthdate: Faker::Date.birthday(min_age: 8, max_age: 18),
				genre: genre,
				father_name: "#{Faker::Name.male_first_name}"" ""#{Faker::Name.last_name}",
				mother_name: "#{Faker::Name.female_first_name}"" ""#{Faker::Name.last_name}",
				active: true,
				school: School.all.sample,
				user: user
			)
			rand(1..3).times do |enroll|
				project_id = Project.pluck(:id).shuffle[1]
				proj = Project.find(project_id)
				cr_id = proj.classroom_ids.sample
				cr = Classroom.find(cr_id)
				if !Enrollment.exists?(project_id: proj.id, user_profile_id: profile.id)
					Enrollment.create!(
						canceled: false,
						user_profile: profile,
						project_id: cr.project_id,
						ceic_id: cr.ceic_id,
						classroom_id: cr.id
					)
				end
			end
		end
	end

	desc 'Adiciona endereços'
	task add_address: :environment do

		user_profiles = UserProfile.all

		user_profiles.each do |profile|
			Address.create!(
				street: Faker::Address.street_name,
				number: Faker::Address.building_number,
				neighborhood: Faker::Address.community,
				city: Faker::Address.city,
				state: Faker::Address.state_abbr,
				zipcode: Faker::Address.zip_code,
				user_profile: profile
			)
		end
	end

	desc 'Adiciona telefones'
	task add_phone_numbers: :environment do

		user_profiles = UserProfile.all

		user_profiles.each do |profile|
			description = ['Próprio', 'Recado']
			rand(1..3).times do |i|
				index = rand(description.size)
				PhoneNumber.create!(
					number: Faker::PhoneNumber.cell_phone,
					description: description[index],
					user_profile: profile
				)
			end
		end
	end

	desc 'Adiciona educador padrão'
	task add_default_educ: :environment  do
		Educ.create!(
			email: 'educ@educ.org.br',
			password: DEFAULT_PASSWORD,
			password_confirmation: DEFAULT_PASSWORD
		)
	end

	desc 'Adiciona educador profile padrão'
	task add_default_educ_profile: :environment  do
		EducProfile.create!(
			name: 'Educador Padrão',
			project: Project.find(1),
			ceic: Ceic.find(1),
			educ: Educ.first
		)
	end
end

