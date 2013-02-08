module Config
    def get_vars(conf_file)
        line_sub = Regexp.new(/\s+|"|\[|\]/)
        temp = Array.new
        vars = Hash.new
    
        unless File.exists?(conf_file) then
            raise "The configuration file could not be found!"
        end
    
        IO.foreach(conf_file) do |line|
            if line.match(/^[#|;]/)
                next
            elsif line.match(/^$/)
                next
            else
                temp[0],temp[1] = line.to_s.scan(/^.*$/).to_s.split('=')
                temp.collect! do |val|
                    val.gsub(line_sub, "")
                end
                vars[temp[0]] = temp[1]
            end
        end
        return vars
    end
end


