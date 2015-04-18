FactoryGirl.define do
	factory :user do |f|
		f.first_name 'sandy'
		f.email 'sandeep@ywr.com'
		f.password '12345678'
		f.password_confirmation '12345678'
  end

  factory :attorney do |f|
		f.first_name 'sandy'
		f.email 'sandeep@ywr.com'
		f.password '12345678'
  end
end