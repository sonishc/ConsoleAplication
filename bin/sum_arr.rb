def sum(a)
puts (a.first(2).sum == a.last(2).sum) ? "true" : "false"
end
sum([0,0,5,6,45,456,2,2,0]) 