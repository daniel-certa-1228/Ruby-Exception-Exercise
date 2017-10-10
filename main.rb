require_relative 'patient'

new_patient = Patient.new("Jisie", "David")
puts new_patient.first_name
puts new_patient.last_name

#Handle exception at the CALL
begin
puts patient_contact_info
rescue NameError
	puts "There is no fucntion by that name"
end	

puts new_patient.patient_status(:coma)

# Could only get an handling by rescuing at the CALL rather than in the function
begin
puts new_patient.patient_currently_admitted?
rescue ArgumentError
	puts "Need admit time"
end

puts new_patient.patient_new_total(125)
new_patient.add_med_to_list("lipitor", 123.12)
new_patient.patient_medications_list

# takes care of puts patient_contact_info
# def method_missing(method_name)
# 	puts "There is no method called #{method_name}"
# end