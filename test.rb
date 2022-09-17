require 'CSV'

class Exam
  def initialize(input = nil)
    @input = CSV.parse(input)
    @hash_array = []
  end

  def call
    transform_data

    return false unless validation

    print_tree(root_item)
  end

  private

  def transform_data
    @input.each do |item|
      existed_item = @hash_array.detect { |ei| ei[:id] == item[1] }

      if existed_item
        existed_item[:name] = item[0]
        existed_item[:parent_id] = item[2]
      else
        @hash_array << { name: item[0], id: item[1], parent_id: item[2], children: [] }
      end

      parent_item = @hash_array.detect { |pi| pi[:id] == item[2] }

      if parent_item
        parent_item[:children] << item[1]
      else
        @hash_array << { name: '', id: item[2], parent_id: nil, children: [item[1]] } unless item[2] == 'nil'
      end
    end
  end

  def print_tree(item, lv = 0)
    puts "\n"
    puts "#{'  ' * lv} + #{item[:name]}"
    item[:children].each do |child_id|
      children = @hash_array.detect { |i| i[:id] == child_id }
      next unless children

      print_tree(children, lv + 1)
    end
  end

  def validation
    # Unique root item validation
    return false if @hash_array.select { |item| item[:parent_id] == 'nil' }.count > 1

    # Unique item validation
    ids = @hash_array.map { |item| item[:id] }
    return false unless ids.uniq.length == ids.length

    # Commas in ID, Name, Parent ID validation
    @hash_array.each do |item|
      return false if item[:name].index(',') || item[:id].index(',') || item[:parent_id].index(',')
    end

    true
  end

  def root_item
    @hash_array.detect { |item| item[:parent_id] == 'nil' }
  end
end

# Name, ID, Parent ID
input1 = <<EOF
feelings,98473,nil
happy,621dsz.t,98473
sad,what-a-strange-id,98473
EOF
Exam.new(input1).call

input2 = <<EOF
Mercury,18,1
Proxima Centauri,23,16
Venus,17,1
Terra,42,1
Milky Way,16,nil
Pluto,14,1
Proxima Centauri c,98,23
Mountains,77,42
Mountains,79,97
Jupiter,78,1
Proxima Centauri b,99,23
Saturn,10,1
Sol,1,16
Uranus,15,1
Luna,24,42
Mars,97,1
EOF
Exam.new(input2).call