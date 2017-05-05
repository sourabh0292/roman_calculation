class CalculationController < ApplicationController
  
  def index
	   @cal = Calculation.new
  end

  def calculation

  	@roman1 = params[:calculation][:calculation].upcase.split("")
    @roman2 = params[:calculation][:calculation1].upcase.split("")
    @operator = params[:calculation][:operator]
    
      int1 =  int_number(@roman1)
      int2 =  int_number(@roman2)

    case @operator 
      when "+"
        @number = int1 + int2
      when "-"
        @number = int1 - int2 
      when "*"
        @number = int1 * int2
      when "/"
        @number = int1 / int2
      end
      @value = roman(@number)
    end

  private

  def int_number(roman)
  
    hash = {
 	   "M": 1000,
     "CM": 900,
	   "D": 500,
     "CD": 400,
     "C": 100,
     "XC": 90,
     "L": 50,
     "XL": 40,
     "X": 10,
     "IX": 9,
     "V": 5,
     "IV": 4,
     "I": 1
    }

    @roman = roman.reverse
    @total = 0
    flag = 1

	@roman.each_with_index do |value,i| 
	unless i == 0
		  if hash[@roman[i].to_sym] < hash[@roman[i-1].to_sym]
			   operator = "-" unless flag == 0
			   flag = 0
		  else
			   operator = "+" 
			   flag = 1
		  end
        @total = @total + hash[@roman[i].to_sym] if operator == "+" 
        @total = @total - hash[@roman[i].to_sym] if operator == "-" 
	else
	     @total = @total + hash[@roman[i].to_sym]
       flag = 1 
    end
  end
    @total
  end

  
  def roman(num)
    result = ""
    number = num
    roman_mapping.keys.each do |divisor|
      quotient, modulus = number.divmod(divisor)
      result << roman_mapping[divisor] * quotient
      number = modulus
    end
    result
  end

    def roman_mapping
      {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
      }
  end
end