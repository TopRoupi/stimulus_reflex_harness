exercice = Exercice.create

tests = Array.new(10).map{Test.create(exercice: exercice)}

exercice.tests = tests
