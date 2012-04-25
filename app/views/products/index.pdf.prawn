pdf.text "Product: ", :size => 30, :style => :bold

# pdf.text "#{@products.count}  "

b = @products.each.map do |item|
[
	item.id,
	item.name,
	number_to_currency(item.price)
]
end

header = ["ID", "Product Name", "Price"]

pdf.table([header] + b, :header => true) do |table|
	table.row(0).font_style = :bold
end
