class TableConstrutor
	def initialize(file)
		@f = file
	end

	def open_table()
		@f.write("{|\n")
	end

	def close_table()
		@f.write("|}")
	end

	def get_border()
		@f.write("|-\n")
	end

	def get_row()
		@f.write("|")
	end

	def get_column()
		@f.write("||")
	end

	def newline()
		@f.write("\n")
	end
end
