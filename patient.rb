require 'pry'
require_relative 'med_type'

class Patient
    attr_accessor :first_name, :last_name, :status, :current_balance, :med_list

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @med_list = []
  end
  
  def patient_status(status)
    begin
      # binding.pry
    raise ArgumentError,"Argument is not a string" unless status.is_a? String

    @status = status
    #start error handling
    rescue ArgumentError => e
      puts "There has been a Patient Status Error."
      puts "Patient Status Exception message: #{e.message}"
      # puts "Exception backtrace: #{e.backtrace}"
    end
      #end error handling
  end

  def patient_currently_admitted?(admit_time)
    # begin

    # raise ArgumentError, "Patient Admit Error" if (admit_time == nil)

      puts "Patient currently in hospital, admitted at #{admit_time}"

    # rescue ArgumentError => e
    #   puts "Error Code: #{e.message}"

    # end
  end

  def patient_new_total(amount)
    @current_balance = 0

    begin

    raise ZeroDivisionError, "You cannot divide by zero" if (@current_balance == 0)

    puts "Current balance before calculation: #{current_balance}"

    @current_balance = (current_balance + amount)/current_balance

    rescue ZeroDivisionError => e
    puts "#{e.message}"
    else
    # This runs only if there are no exceptions
    @current_balance = amount
    end

  end

  def add_med_to_list(med, dosage)
    begin

    raise ArgumentError,"#{med} is not a string" unless med.is_a? String

    raise ArgumentError,"#{dosage} is not a integer" unless dosage.is_a? Integer

    puts "Medication added: #{med}"
    @med_list.push([med,dosage])

    #Create a new class called MedTypeError that inherits from StandardError and use that as seen below:
    raise MedTypeError, "This is not a valid medication"
    puts @med_list

    rescue ArgumentError => e
      puts "#{e.message}"

    rescue MedTypeError => e
      puts "#{e.message}"
    end
  end

  def patient_medications_list
    begin
      puts "User medication list:"

    raise RuntimeError, "Medications list is not valid."
      puts @med_list

    rescue RuntimeError => e
      puts "#{e.message}"
      # puts "Runtime Backtrace #{e.backtrace}"

    # This needs to run whether there was an exception or not.
    ensure
      puts "Disclaimer: The hospital is not responsible for the user's health due to medications they may be using."
    end
  end
end