def dice_desc
  "dice>(n)D(d): d�̥�������n�Ĥդ�ޤ���"
end

def dice(msg)
  if (msg !~ /^(\d+)[Dd](\d+)$/)
    return "��������λؼ����������������Ǥ�"
  end

  n = $1.to_i
  d = $2.to_i

  if (n > 1000)
    return "1000�İʾ�Υ�������ϥ���٥󤷤Ʋ�������"
  end
  if (d > 10000)
    return "10000�̰ʾ�Υ�������ϥ���٥󤷤Ʋ�������"
  end

  sum = 0
  arr = Array.new
  for i in 0...n
    r = rand(d) + 1
    sum += r
    arr.push("(#{r})")
  end
  if (n > 10)
    "#{sum}"
  else
    "#{sum} " + arr.join(" ")
  end
end
