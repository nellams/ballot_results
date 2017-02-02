
#build vote results
vote_results = []
4.times do |precinct_index|
  vote_results[precinct_index] = []
  3.times do |candidate_index|
    vote_results[precinct_index][candidate_index] = rand(20..500)
  end
end

candidates = [
  'Mary Sue',
  'Sally Jane',
  'Billy Joe'
]

#list out vote results

vote_results.each_with_index do |precinct_results, precinct_index|
  puts "**In precinct #{precinct_index + 1}:**"

  candidates.each_with_index do |candidate, candidate_index|
    puts "* #{candidate} got #{vote_results[precinct_index][candidate_index]} votes"
  end

  puts ""
end

# * How many people voted in precinct 1?
sum = 0
vote_results[0].each do |v|
  sum += v
end
puts "#{sum} people voted in precinct 1."
# * Who was the winning candidate in Precinct 4?
top = vote_results[3].max

vote_results[3].each_with_index do |count, person|
  if count == top
    puts "#{candidates[person]} won Precinct 4."
    break
  end
end
# * How many people voted for Mary Sue?
mary_sue_votes = vote_results[0][0] + vote_results[1][0] + vote_results[2][0] + vote_results[3][0]
puts "Mary Sue got #{mary_sue_votes} votes."
# * How many people voted for Billy Joe?
billy_joe_votes = 0
vote_results.each do |array|
  billy_joe_votes += array[2]
end
puts "Billy Joe got #{billy_joe_votes} votes."
# * How many people voted for Sally Jane?
sally_jane_votes = 0
vote_results.each do |array|
  sally_jane_votes += array[1]
end
puts "Sally Jane got #{sally_jane_votes} votes."

# * How many people voted in total?
total_votes = mary_sue_votes + billy_joe_votes + sally_jane_votes
puts "#{total_votes} people voted."

puts "~~~"

all_votes = 0
vote_results.each do |thing|
  thing.each do |num|
  all_votes += num
  end
end
puts "#{all_votes} people voted."

# * Who had the most votes?
totals = {"Mary Sue": mary_sue_votes, "Sally Jane": sally_jane_votes, "Billy Joe": billy_joe_votes}

winner = ["", 0]

totals.each do |k, v|
  if v > winner[1]
    winner = ["#{k}", v]
    # puts "#{k} had the most votes."
  end
  # puts "Just looked at #{k}"
end
puts "#{winner[0]} won the election."
