module IIS
  
  logFormat = "%snaredate %snarehost %snarelog %random %h %l %u %t \"%r\" %>s %b"
  logKeys = logFormat
  logFormat = logFormat.split(/\s+/)
  logTable = {
              '%snaredate' => '(\w{3}\s+\d{0,2}\s+\d{2}:\d{2}:\d{2})',
              '%snarehost' => '(\w*)',
              '%snarelog' => '(\w*)',
              '%random' => '(\d)',
              '%h' => '(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})',
              '%l' => '([\D|\w])',
              '%u' => '([\D|\w])',
              '%t' => '(\[\d{2}\/\w*\/\d{4}:\d{2}:\d{2}:\d{2}\s*-\d{4}\])',
              '"%r"' => '("\w\s*.*")',
              '%>s' => '(\d{3})',
              '%b' => '(\d*)'
  }
  logParse = logFormat.map do |l|
    l = logTable[l]
  end
  logParse = Regexp.new(logParse.join('\s+'))
  #puts logParse
  #keys = Array.new
  #logFormat = logFormat.gsub(/\s+/, '\s*')
  #logParse = logTable.each do |k,v|
  #  if logFormat.sub!(k,v)
  #    keys.push k
  # end
  #end
=begin
def IIS.parseFile(file)
    IO.foreach(file) do |line|
      parseLine(line)
    end
  end
  def IIS.parseLine(line)
    puts line.match(Regexp.new(logTable['%h']))
  end
=end
IO.foreach('/var/log/remote') do |line|
  #host = line.match(Regexp.new(logTable['%h']))
  #snare_date = line.match(Regexp.new(logTable['%snaredate']))
  #snare_log = line.match(Regexp.new(logTable['%snarelog']))
  #snare_host = line.match(Regexp.new(logTable['%snarehost']))
  #random = line.match(Regexp.new(logTable['%random']))
  #something1 = line.match(Regexp.new(logTable['%l']))
  #something2 = line.match(Regexp.new(logTable['%u']))
  matches = line.match(logParse) || matches
  
  #puts logParse;
  #puts linematches;exit;
  #snare_date = linematches[logKeys.index("%snaredate")]
  end
end
