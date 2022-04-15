type group
	group_ (0 to 1000) as string
	count as integer=0
end type
const data_size=5
sub fill_group(g1 as group)
	dim n as integer
	g1.count=data_size
	for n=0 to data_size-1
		read g1.group_(n)
	next
end sub
sub add_(g1 as group,i as string)
	if g1.count<999 then
		g1.group_(g1.count)=i
		g1.count=g1.count+1
	end if
end sub
sub printGroup(g1 as group)
	dim n as integer
	for n=0 to g1.count-1
		print g1.group_(n);
		if n<> g1.count-1 then print " , ";
	next
	print
end sub
function toString(g1 as group)as string
	dim n as integer
	dim a as string
	a=""
	for n=0 to g1.count-1
		a=a+g1.group_(n)
		if n<> g1.count-1 then a=a+ " "
	next
	return a
end function
sub reverse(g1 as group)
	dim n as integer
	dim g2 as group
	for n=0 to g1.count-1
		g2.group_(n)=g1.group_(n)
	next
	g2.count=g1.count
	for n=g1.count-1 to 0 step -1
		g1.group_(g1.count-1-n)=g2.group_(n)
	next
end sub
sub addsort(g1 as group,i as string)
	dim n as integer
	dim d as string
	dim dd as string
	d=i
	if g1.count<999 then
		if g1.count>0 then
			for n=0 to g1.count-1
				if g1.group_(n)>d then 
					dd=g1.group_(n)
					g1.group_(n)=d
					d=dd
				end if
			next
			g1.group_(g1.count)=d
			g1.count=g1.count+1
		else
			g1.group_(g1.count)=d
			g1.count=g1.count+1
		end if
	end if
end sub
sub fillread(g1 as group)
	dim n as integer
	dim d as string
	for n=0 to data_size-1
		read d
		addsort g1,d
	next
end sub
data "hello","there","hi","say","bye"
dim n as integer
dim shared group1 as group
fillread(group1)
print "group:"
print toString(group1)
