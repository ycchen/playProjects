pdf.text "Product: #{@product.name}", :size => 30, :style => :bold

@product.categories.each do |category|
	pdf.text category.name
end

subcat = @product.categories.each.map do |subcat|
	[
		subcat.name
	]
end


pdf.table(subcat, :row_colors => ["FFFFFF", "DDDDDD"] )

pdf.move_down(30)

pdf.table(subcat, :cell_style => {:borders => [:left, :right]})

pdf.move_down(30)

pdf.table(subcat) do
	style(row(0), :background_color => 'eeeeee')
	style(column(0))
end

pdf.move_down(30)

pdf.table(subcat) do
	row(0).style :background_color => 'eeffff'
	column(0)
end