# Gift Swap People Matcher
#   Use this script to generate gift swap matches for a large family or group
#   of friends. Add names in the 'initialize' method.
class Matcher

  # Set up couples/individuals and/or kids by family grouping
  def initialize

    # Couples or individuals.
    @couples = [
      'Person 1 & Person 2',
      'Person 3',
      'Person 4 & Person 5',
      'Person 6',
      'Person 7 & Person 8',
      'Person 9 & Person 10',
    ]

    # Kids by family grouping. Can't be matched with siblings.
    @families = {
      groupa: [
        'Person A',
        'Person B',
        'Person C',
      ],
      groupb: [
        'Person D',
        'Person E',
        'Person F',
        'Person G',
      ],
      groupc: [
        'Person H',
        'Person I',
        'Person J',
      ],
      groupd: [
        'Person K',
        'Person L',
      ],
    }

  end

  # Run the matching
  def pick
    pick_couples if @couples
    pick_kids if @families
  end

  # Match couples and/or individuals
  def pick_couples
    matches = {}
    @couples.each do |couple|
      @couples.sort_by { rand }.each do |match_couple|
        if match_couple != couple && !matches.values.include?(match_couple)
          matches[couple] = match_couple
          break
        end
      end
    end
    print_matches(matches)
  end

  # Match Kids
  def pick_kids
    matches = {}
    @families.each do |_, kids|
      kids.each do |kid|
        potential = @families.values.flatten - kids # no matches in same family
        potential.sort_by { rand }.each do |match_kid|
          if match_kid != kid && !matches.values.include?(match_kid)
            matches[kid] = match_kid
            break
          end
        end
      end
    end
    print_matches(matches)
  end

  # Print Results
  def print_matches(matches)
    matches.each do |k, v|
      puts "#{k} => #{v}"
    end
  end

end

# Run the matcher
matcher = Matcher.new
matcher.pick
