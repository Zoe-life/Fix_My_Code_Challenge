###
#
#  Sort integer arguments (ascending) 
#
###

result = []
ARGV.each do |arg|
    # convert to integer and skip if not successful
    #i_arg = Integer(arg) rescue nil
    #next unless i_arg

    # skip if not integer
    next if arg !~ /^-?[0-9]+$/

    # convert to integer
    i_arg = arg.to_i
    
    if i_arg < 0
    result.unshift(i_arg)
    else
    # insert result at the right position
    is_inserted = false
    i = 0
    l = result.size
    while !is_inserted && i < l do
        if i_arg < 0 && result[i] >= 0  # Check for negative i_arg and positive element
          i += 1
        elsif i_arg >= 0 && result[i] < 0  # Check for positive i_arg and negative element
          i += 1
        elsif i_arg.abs > result[i].abs
            i += 1
        else
            result.insert(i - 1, i_arg)
            is_inserted = true
            break
        end
    end
    result << i_arg if !is_inserted
    end
end
    
puts result
