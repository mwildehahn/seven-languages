class ActsAsCsv
    def self.acts_as_csv

        define_method 'read' do
            File.open(self.class.to_s.downcase + '.txt') do |f|
                @headers = f.gets.chomp.split(', ')
                f.each do |row|
                    values = row.chomp.split(', ')
                    mapped = {}
                    @headers.each.with_index do |header, index|
                        mapped[header] = values[index]
                    end

                    @rows << CsvRow.new(mapped)
                end
            end
        end

        define_method 'headers' do
            @headers
        end

        define_method 'csv_contents' do
            @rows
        end

        define_method 'initialize' do
            @rows = []
            read
        end

        define_method 'each' do |&block|
            @rows.each { |row| block.call row }
        end
    end
end

class CsvRow
    def initialize(data)
        @data = data
    end

    def method_missing name, *args
        @data[name.to_s]
    end
end

class RubyCsv < ActsAsCsv
    acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
puts
m.each {|row| puts "One: #{row.one}, Two: #{row.two}" }