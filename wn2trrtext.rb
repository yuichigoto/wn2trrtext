
class LoadFiles
  def initialize(dict)
    @wordFiles = ['index.adj', 'index.adv', 'index.noun', 'index.verb']
    @dict = dict if exist?(dict)
    @wordFiles.each do | file |
      exist?(@dict + '/' + file)
    end
    @wordsAry = Array.new
    (0..6).each do |idx|
      @wordsAry[idx] = Array.new
    end
  end

  def load
    @wordFiles.each do | filename |
      File.open(@dict + '/' + filename, "r") do | file |
        file.each do | line |
          line.chomp!
          unless line =~ /^\s/
            tmpAry = line.split(/\s/)
            word = tmpAry.shift
            @wordsAry[kind(word)].push(word) if word.length > 1
          end
        end
      end
    end
    return @wordsAry
  end

  def shuffle(idx)
    tmpAry = Array.new
    ary = @wordsAry[idx]
    length = ary.size
    (0..1000).each do | idx |
      tmpAry.push(ary[rand(length)])
    end
    return tmpAry
  end
  

  private 
  def kind(word)
    return 0 if word =~ /^[asdfghjkl]+$/ #home
    return 1 if word =~ /^[qwertyuiop]+$/  #upper
    return 2 if word =~ /^[zxcvbnm.,]+$/  # lower
    return 3 if word =~ /^[asdfghjklqwertyuiop]+$/ #home + upper
    return 4 if word =~ /^[asdfghjklzxcvbnm.,]+$/  # home + lower
    return 5 if word =~ /^[a-z]+$/  # without number
    return 6  # with number
  end

  def exist?(path)
    if File.exist?(path)
      return true
    else
      puts "Error #{path} doesn't exist!"
      exit
    end
  end
end

unless ARGV.size == 1
  p "Please input wordnet directory"
  exit
end

outputFiles = %w(Home.txt Upper.txt Lower.txt HomeAndUpper.txt HomeAndLower.txt WithoutNumber.txt WithNumber.txt)
files = LoadFiles.new(ARGV[0])
wordAry = files.load

outputFiles.each_with_index do | outputfile, idx |
  File.open(outputfile, "w") do | file |
    line = String.new
    files.shuffle(idx).each_with_index do | word, count |
      line += word
      if count%5 == 4 && count > 0
        line += "."
        file.puts(line)
        line = ''
      else
        line += ' '
      end
    end
  end
end
